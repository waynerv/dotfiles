#!/bin/bash

set -eo pipefail

icon_path=/Applications/Alacritty.app/Contents/Resources/alacritty.icns
if [ ! -f "$icon_path" ]; then
    echo "Can't find existing icon, make sure Alacritty is installed"
    exit 1
fi

echo "Backing up existing icon"
hash="$(shasum $icon_path | head -c 10)"
mv "$icon_path" "$icon_path.backup-$hash"

new_icon_path=alacritty/.config/alacritty/Alacritty.icns
if [ ! -f "$new_icon_path" ]; then
    echo "Can't find new icon"
    exit 1
fi
echo "Applying replacement icon"
cp -f "$new_icon_path" "$icon_path"

touch /Applications/Alacritty.app
killall Finder
killall Dock
