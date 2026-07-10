#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
source_dir="$repo_root/input-method/rime"
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
status=0

for name in default.custom.yaml squirrel.custom.yaml bopomofo_pro.schema.yaml; do
  repo_file="$source_dir/$name"
  local_file="$rime_dir/$name"
  if [ ! -f "$local_file" ]; then
    printf 'MISSING local file: %s\n' "$local_file"
    status=1
  elif cmp -s "$repo_file" "$local_file"; then
    printf 'MATCH %s\n' "$name"
  else
    printf 'DIFF  %s\n' "$name"
    status=1
  fi
done

if [ -f "$rime_dir/build/squirrel.yaml" ]; then
  printf 'FOUND generated Squirrel config: %s\n' "$rime_dir/build/squirrel.yaml"
else
  printf 'MISSING generated Squirrel config; reload Squirrel after restore.\n'
  status=1
fi

pro_schema="$rime_dir/build/bopomofo_pro.schema.yaml"
if [ -f "$pro_schema" ] && grep -Fq 'language: "zh-hant-t-essay-bgw"' "$pro_schema"; then
  printf 'MATCH Zhuyin test-scheme language-model configuration\n'
else
  printf 'MISSING or DIFF Zhuyin test-scheme language-model configuration\n'
  status=1
fi

model_file="$rime_dir/zh-hant-t-essay-bgw.gram"
model_sha256='574c99d100f422766c433c601ed6efd642e881d69a30df9fffb6f1695be550e3'
if [ -f "$model_file" ] && [ "$(shasum -a 256 "$model_file" | awk '{print $1}')" = "$model_sha256" ]; then
  printf 'MATCH Zhuyin Traditional language model\n'
else
  printf 'MISSING or DIFF Zhuyin Traditional language model\n'
  status=1
fi

maccy_settings="$repo_root/clipboard/maccy/settings.sh"
if [ -f "$maccy_settings" ]; then
  # shellcheck source=/dev/null
  . "$maccy_settings"
  actual_history_size=$(defaults read org.p0deje.Maccy historySize 2>/dev/null || true)
  actual_paste_by_default=$(defaults read org.p0deje.Maccy pasteByDefault 2>/dev/null || true)
  actual_popup_shortcut=$(defaults read org.p0deje.Maccy KeyboardShortcuts_popup 2>/dev/null || true)

  if [ "$actual_history_size" = "$maccy_history_size" ]; then
    printf 'MATCH Maccy history size\n'
  else
    printf 'DIFF  Maccy history size\n'
    status=1
  fi

  if [ "$actual_paste_by_default" = "$maccy_paste_by_default" ]; then
    printf 'MATCH Maccy paste behavior\n'
  else
    printf 'DIFF  Maccy paste behavior\n'
    status=1
  fi

  if [ "$actual_popup_shortcut" = "$maccy_popup_shortcut_json" ]; then
    printf 'MATCH Maccy popup shortcut\n'
  else
    printf 'DIFF  Maccy popup shortcut\n'
    status=1
  fi
else
  printf 'MISSING tracked Maccy preferences\n'
  status=1
fi

exit "$status"
