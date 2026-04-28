; WORKAROUND: nvim-treesitter (archived) registers a custom directive
; `set-lang-from-info-string!` globally at load time. On nvim 0.12 this
; directive receives a TSNode[] array instead of a single TSNode, so calling
; :range() on it crashes with "attempt to call method 'range' (a nil value)".
;
; This file overrides nvim-treesitter's bundled markdown injection query
; (~/.local/share/nvim/lazy/nvim-treesitter/queries/markdown/injections.scm).
; Files in ~/.config/nvim/queries/ take highest priority and are NOT extended
; — they fully replace the plugin version.
;
; The only change vs. the original is the fenced_code_block pattern:
;   ORIGINAL: uses @_lang + (#set-lang-from-info-string! @_lang)  <- crashes
;   THIS FILE: uses @injection.language directly                   <- built-in
;
; TO REVERT: delete this file and its parent directory:
;   rm ~/.config/nvim/queries/markdown/injections.scm
;   rmdir ~/.config/nvim/queries/markdown
;   rmdir ~/.config/nvim/queries
; Note: reverting will bring back the crash until nvim-treesitter is replaced
; or nvim fixes the directive API mismatch.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
