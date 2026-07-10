#!/bin/sh
set -eu

model_name='zh-hant-t-essay-bgw.gram'
model_url="https://raw.githubusercontent.com/lotem/rime-octagram-data/bb8e1313552f0f27f2f968031dfaf4563e55d982/$model_name"
expected_sha256='574c99d100f422766c433c601ed6efd642e881d69a30df9fffb6f1695be550e3'
rime_dir=${RIME_DIR:-"$HOME/Library/Rime"}
target="$rime_dir/$model_name"
temporary="$target.download"

mkdir -p "$rime_dir"
curl --fail --location --silent --show-error --output "$temporary" "$model_url"
actual_sha256=$(shasum -a 256 "$temporary" | awk '{print $1}')

if [ "$actual_sha256" != "$expected_sha256" ]; then
  rm -f "$temporary"
  printf 'Model checksum verification failed.\n' >&2
  exit 1
fi

mv "$temporary" "$target"
printf 'Installed verified language model: %s\n' "$target"
