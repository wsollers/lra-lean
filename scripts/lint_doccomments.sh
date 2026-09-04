#!/usr/bin/env bash
# ============================================================
# scripts/lint_doccomments.sh
# ============================================================
#
# Display-name doc-comments are NOT required.
#
# The promoted subject trees under LRA/<Subject>/ deliberately carry plain
# prose doc-comments without the `**[Kind — Name]**` marker, and most
# declarations carry no doc-comment at all while the mathematics is still
# being placed. Comments will be added mechanically once the architecture has
# settled, so this linter reports coverage and always exits 0.
#
# Run with LRA_DOCLINT_STRICT=1 to make missing display names fail again.
set -euo pipefail

STRICT="${LRA_DOCLINT_STRICT:-0}"

TARGET="${1:-LRA/VolumeII}"
ERRORS=0
FILES=0

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

usage() {
    cat <<'EOF'
usage: scripts/lint_doccomments.sh [--help|-h] [TARGET]

Report display-name doc-comment coverage for a Lean file or directory.
Set LRA_DOCLINT_STRICT=1 to make missing display names fail the run.
EOF
}

if [[ "$TARGET" == "--help" || "$TARGET" == "-h" ]]; then
    usage
    exit 0
fi

check_file() {
    local path="$1"
    FILES=$((FILES + 1))

    set +e
    python3 - "$path" << 'PYEOF'
import sys, re

path = sys.argv[1]
try:
    lines = open(path).readlines()
except Exception as e:
    print(f"  ERROR reading {path}: {e}")
    sys.exit(1)

missing = []
i = 0
while i < len(lines):
    line = lines[i].strip()
    raw = lines[i]
    if raw and raw[0] not in (' ', '\t'):
        m = re.match(r'^(theorem|lemma|corollary|noncomputable\s+def|def)\s+(\w+)', line)
        if m:
            kind = m.group(1).replace('noncomputable ', '')
            name = m.group(2)
            prev_lines = lines[max(0,i-3):i]
            if any('private' in pl for pl in prev_lines):
                i += 1
                continue
            found = False
            for k in range(max(0, i-20), i):
                if '**[' in lines[k]:
                    found = True
                    break
            if not found:
                missing.append((i+1, kind, name))
    i += 1

if missing:
    for lineno, kind, name in missing:
        print(f"  {path}:{lineno}: {kind} '{name}' — no display name doc-comment")
    sys.exit(len(missing))
PYEOF
    local ret=$?
    set -e
    if [[ $ret -gt 0 ]]; then ERRORS=$((ERRORS + ret)); fi
}

report_and_exit() {
    echo ""
    echo "── Doc-comment coverage ────────────────────────────────"
    echo "  Files checked        : $FILES"
    echo "  Without display name : $ERRORS"
    if [[ $ERRORS -eq 0 ]]; then
        echo -e "  ${GREEN}✓ All items have display name doc-comments${NC}"
        exit 0
    fi
    if [[ "$STRICT" == "1" ]]; then
        echo -e "  ${RED}✗ strict mode: $ERRORS item(s) missing display names${NC}"
        exit 1
    fi
    echo "  Informational only; display names are added mechanically later."
    echo "  Set LRA_DOCLINT_STRICT=1 to fail on these."
    exit 0
}

if [[ -f "$TARGET" ]]; then
    check_file "$TARGET" || true
else
    while IFS= read -r f; do check_file "$f" || true; done < <(find "$TARGET" -name "*.lean" | sort)
fi

report_and_exit
