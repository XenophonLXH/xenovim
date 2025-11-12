#!/usr/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rm -rf ~/.config/nvim/
cp -r $SCRIPT_DIR ~/.config/nvim
echo "Xenovim installation complete...."
