#!/bin/sh
set -eu

model_name='wanxiang-lts-zh-hant.gram'
model_url="https://github.com/amzxyz/rime-wanxiang-data/releases/download/LTS/$model_name"
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
target="$rime_dir/$model_name"
temporary="$target.download"

# This is a community (not official Rime) project that updates its LTS
# release asset in place, so the file has no pinned revision or checksum
# like scripts/install-bopomofo-pro-model.sh does. See
# input-method/rime/models/README.md for details and trade-offs.
mkdir -p "$rime_dir"
curl --fail --location --silent --show-error --output "$temporary" "$model_url"
mv "$temporary" "$target"
printf 'Installed Wanxiang language model: %s (sha256: %s)\n' \
  "$target" "$(shasum -a 256 "$target" | awk '{print $1}')"
