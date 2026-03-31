#!/usr/bin/env bash

set -euo pipefail

source_dir="${1:?source directory required}"
dest_dir="${2:?destination directory required}"

rsync -a --exclude '.terraform/' "$source_dir/" "$dest_dir/"

perl -0pi -e 's/\n  backend "remote" \{.*?\n  \}\n//s' "$dest_dir/providers.tf"
