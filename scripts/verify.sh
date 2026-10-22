#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
source_dir="$repo_root/input-method/rime"
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
status=0

for name in default.custom.yaml squirrel.custom.yaml bopomofo_pro.schema.yaml bopomofo_pro_wx.schema.yaml; do
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

# The Wanxiang grammar model is a rolling community download with no pinned
# checksum (see scripts/install-wanxiang-model.sh), so only check presence.
wx_model_file="$rime_dir/wanxiang-lts-zh-hant.gram"
if [ -f "$wx_model_file" ]; then
  printf 'FOUND Wanxiang test grammar model\n'
else
  printf 'MISSING Wanxiang test grammar model (optional; run scripts/install-wanxiang-model.sh)\n'
fi

exit "$status"
