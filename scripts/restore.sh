#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
source_dir="$repo_root/input-method/rime"
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
squirrel_bin='/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel'

mkdir -p "$rime_dir"

for name in default.custom.yaml squirrel.custom.yaml bopomofo_pro.schema.yaml bopomofo_pro_wx.schema.yaml; do
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
