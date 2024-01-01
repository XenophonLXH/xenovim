local obsidian = require('obsidian');

-- Obsidian Open
function _G.ObsidianOpen()
    local file = vim.fn.input("File: ", ".")
    vim.cmd("ObsidianOpen "..file)
end

-- Obsidian New
function _G.ObsidianNew()
    local file = vim.fn.input("File: ", "")
    vim.cmd("ObsidianNew "..file)
end

-- Obsidian Quick Switch
function _G.ObsidianQuickSwitch()
    vim.cmd("ObsidianQuickSwitch")
end

-- Obsidian Create Folder
function _G.ObsidianDirectory()
    local workspace = vim.ui.select(
        {"work", "personal"},
        {
            prompt = "Select Workspace: ",
            format_item = function(workspace)
                return workspace
            end,
        },
        function(workspace)
            if workspace == 'work' then
                _G.ObsidianDirectorCreateeWork()
            elseif workspace == 'personal' then
                _G.ObsidianDirectoryCreatePersonal()
            else
                print("Doing nothing")
            end
        end
    )
end

function _G.ObsidianDirectorCreateeWork()
    local folder = vim.fn.input("Full Path: ", "/home/xenophon/Documents/Work/ObsidianVault/TaskFlow/")
    os.execute("mkdir -p "..folder)
    print("Created Folder: "..folder)
end

function _G.ObsidianDirectoryCreatePersonal()
    local folder = vim.fn.input("Full Path: ", "/home/xenophon/Documents/Personal/ObsidianVault/")
    os.execute("mkdir -p "..folder)
    print("Created Folder: "..folder)
end


-- == Obsidian Notes == 
-- Obsidian Note Today
function _G.ObsidianToday()
    vim.cmd("ObsidianToday")
end

-- Obsidian Note Yesterday
function _G.ObsidianYesterday()
    vim.cmd("ObsidianYesterday")
end

-- Obsidian Note Tomorrow
function _G.ObsidianTomorrow()
    vim.cmd("ObsidianTomorrow")
end


-- == Obsidian Workspace ==
function _G.ObsidianWorkspace()
    local workspace = vim.fn.input("Worspace: ", "work")
    vim.cmd("ObsidianWorkspace " ..workspace)
end
