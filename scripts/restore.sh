#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
source_dir="$repo_root/input-method/rime"
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
squirrel_bin='/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel'

mkdir -p "$rime_dir"

for name in default.custom.yaml squirrel.custom.yaml bopomofo_pro.schema.yaml; do
  if [ ! -f "$source_dir/$name" ]; then
    printf 'Missing repository file: %s\n' "$source_dir/$name" >&2
    exit 1
  fi
  cp "$source_dir/$name" "$rime_dir/$name"
  printf 'Restored %s\n' "$name"
done

if [ -x "$squirrel_bin" ]; then
  "$squirrel_bin" --reload
  printf 'Reloaded Squirrel.\n'
else
  printf 'Squirrel is not installed; files were restored without reload.\n' >&2
fi

maccy_settings="$repo_root/clipboard/maccy/settings.sh"
if [ -f "$maccy_settings" ]; then
  # shellcheck source=/dev/null
  . "$maccy_settings"
  defaults write org.p0deje.Maccy historySize -int "$maccy_history_size"
  defaults write org.p0deje.Maccy pasteByDefault -bool "$maccy_paste_by_default"
  defaults write org.p0deje.Maccy KeyboardShortcuts_popup -string "$maccy_popup_shortcut_json"
  printf 'Restored Maccy preferences; relaunch Maccy if it is already open.\n'
else
  printf 'No tracked Maccy preferences found.\n'
fi
