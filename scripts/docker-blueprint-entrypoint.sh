#!/usr/bin/env bash
set -euo pipefail

command_name="${1:-blueprint}"

usage() {
  cat <<'EOF'
usage: lra-blueprint [--help|-h] {inputs|blueprint|blueprint-existing|docs|shell}

Commands:
  inputs              Generate Blueprint input files from the current Lean tree.
  blueprint           Generate inputs, then build the Blueprint PDF and web outputs.
  blueprint-existing  Build the existing Blueprint PDF and web outputs only.
  docs                Build Blueprint outputs and the repository site.
  shell               Open an interactive shell in the container.
EOF
}

require_repo_root() {
  if [[ ! -f "blueprint/src/content.tex" ]]; then
    echo "error: run this container with the lra-lean repository mounted at /workspace" >&2
    exit 2
  fi
}

build_inputs() {
  require_repo_root
  python3 scripts/build-volume-blueprints.py
}

build_inputs_when_available() {
  build_inputs
}

build_blueprint_existing() {
  require_repo_root
  leanblueprint pdf
  leanblueprint web
}

case "$command_name" in
  -h|--help|help)
    usage
    ;;
  inputs)
    build_inputs
    ;;
  blueprint)
    build_inputs_when_available
    build_blueprint_existing
    ;;
  blueprint-existing)
    build_blueprint_existing
    ;;
  docs)
    build_inputs_when_available
    build_blueprint_existing
    python3 scripts/build-repository-site.py
    mkdir -p site/blueprint
    cp -R blueprint/web/. site/blueprint/
    cp blueprint/print/print.pdf site/lra-blueprint.pdf
    ;;
  shell)
    exec bash
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac
