#!/usr/bin/env bash
set -euo pipefail

command_name="${1:-blueprint}"

require_repo_root() {
  if [[ ! -f "blueprint/src/content.tex" ]]; then
    echo "error: run this container with the lra-lean repository mounted at /workspace" >&2
    exit 2
  fi
}

build_inputs() {
  require_repo_root
  if [[ -d "docs/number-systems" ]]; then
    python3 scripts/build-number-systems-declaration-manifest.py
    python3 scripts/build-number-systems-blueprint.py
    python3 scripts/report-number-systems-dependency-order.py --check
  else
    echo "warning: docs/number-systems is missing; skipped number-system input regeneration" >&2
  fi
  python3 scripts/build-volume-blueprints.py
}

build_inputs_when_available() {
  build_inputs
}

build_blueprint_existing() {
  require_repo_root
  leanblueprint pdf
  leanblueprint web
  if [[ -f "docs/number-systems/declarations.yaml" ]]; then
    python3 scripts/check-blueprint-declarations.py
  else
    echo "warning: docs/number-systems/declarations.yaml is missing; skipped declaration mapping check" >&2
  fi
}

case "$command_name" in
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
    cp blueprint/print/print.pdf site/number-systems-blueprint.pdf
    ;;
  shell)
    exec bash
    ;;
  *)
    echo "usage: lra-blueprint {inputs|blueprint|blueprint-existing|docs|shell}" >&2
    exit 2
    ;;
esac
