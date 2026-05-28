#!/usr/bin/env bash
# ============================================================
# scripts/lint_doccomments.sh
# ============================================================
set -euo pipefail

TARGET="${1:-LRA/VolumeII}"
ERRORS=0
FILES=0

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

check_file() {
    local path="$1"
    FILES=$((FILES + 1))

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
        print(f"  {path}:{lineno}: {kind} '{name}' — missing display name doc-comment")
    sys.exit(len(missing))
PYEOF
    local ret=$?
    if [[ $ret -gt 0 ]]; then ERRORS=$((ERRORS + ret)); fi
}

if [[ -f "$TARGET" ]]; then
    check_file "$TARGET"
else
    while IFS= read -r f; do check_file "$f"; done < <(find "$TARGET" -name "*.lean" | sort)
fi

echo ""
echo "── Doc-comment lint results ────────────────────────────"
echo "  Files checked : $FILES"
if [[ $ERRORS -eq 0 ]]; then
    echo -e "  ${GREEN}✓ All items have display name doc-comments${NC}"
    exit 0
else
    echo -e "  ${RED}✗ $ERRORS item(s) missing display name doc-comments${NC}"
    echo "  See DESIGN.md §17 for the doc-comment template."
    exit 1
fi
