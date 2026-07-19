#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SITE_DIR="$ROOT/site"

rm -rf "$SITE_DIR"
mkdir -p "$SITE_DIR/blueprint"

if [[ -d "$ROOT/blueprint/web" ]]; then
  cp -R "$ROOT/blueprint/web/." "$SITE_DIR/blueprint/"
else
  echo "Blueprint web output not found at blueprint/web" >&2
  exit 1
fi

if [[ -f "$ROOT/blueprint/print/print.pdf" ]]; then
  cp "$ROOT/blueprint/print/print.pdf" "$SITE_DIR/blueprint.pdf"
else
  echo "Blueprint PDF not found at blueprint/print/print.pdf" >&2
  exit 1
fi

cat > "$SITE_DIR/index.html" <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>lra-lean formalization</title>
</head>
<body>
  <main>
    <h1>Learning Real Analysis — Lean Formalization</h1>
    <p><a href="blueprint/">Interactive Blueprint</a></p>
    <p><a href="blueprint.pdf">Blueprint PDF</a></p>
    <p><a href="https://github.com/wsollers/lra-lean">GitHub repository</a></p>
  </main>
</body>
</html>
HTML
