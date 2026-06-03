#!/usr/bin/env bash

set -euo pipefail

source_dir="${1:?source directory required}"
dest_dir="${2:?destination directory required}"

mkdir -p "$dest_dir"
cp -R "$source_dir/." "$dest_dir/"
find "$dest_dir" -type d -name .terraform -prune -exec rm -rf {} +

providers_file="$dest_dir/providers.tf"
providers_tmp="$providers_file.tmp"

awk '/^  backend "remote" \{$/ { skip = 1; next } skip && /^  \}$/ { skip = 0; next } !skip' "$providers_file" > "$providers_tmp"

mv "$providers_tmp" "$providers_file"
