#!/usr/bin/env sh
set -eu

if ! command -v pwsh >/dev/null 2>&1; then
    printf '%s\n' 'error: pwsh is required to run this PowerShell-backed shell wrapper.' >&2
    exit 127
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
exec pwsh -NoProfile -ExecutionPolicy Bypass -File "$script_dir/restart-codex-desktop.ps1" "$@"

