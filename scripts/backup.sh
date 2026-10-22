#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
target_dir="$repo_root/input-method/rime"

for name in default.custom.yaml squirrel.custom.yaml bopomofo_pro.schema.yaml bopomofo_pro_wx.schema.yaml; do
  source_file="$rime_dir/$name"
  if [ ! -f "$source_file" ]; then
    printf 'Missing required Rime file: %s\n' "$source_file" >&2
    exit 1
  fi
  cp "$source_file" "$target_dir/$name"
  printf 'Backed up %s\n' "$name"
done

