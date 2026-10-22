#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

"$script_dir/install-bopomofo-pro-model.sh"
"$script_dir/restore.sh"
"$script_dir/verify.sh"
