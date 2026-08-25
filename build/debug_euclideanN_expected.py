import json
import sys
from pathlib import Path
repo = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(repo))
import scripts.apply_hover_comments as ah

path = repo / 'LRA/EuclideanSpace/Model/EuclideanN.lean'
data = json.loads((repo / 'docs/commentary/hover_comments.json').read_text(encoding='utf-8'))
entries = [e for e in data['declarations'] if e['file'] == 'LRA/EuclideanSpace/Model/EuclideanN.lean']
text = path.read_text(encoding='utf-8')
decls = ah.declaration_index(path)
names = ah.declaration_name_index(path)
edits = []
for entry in entries:
    entry_id = entry.get('id', f"{entry['file']}:{entry['line']}:{entry['name']}")
    declaration = decls.get(entry_id)
    if declaration is None:
        same = names.get(entry['name'], [])
        if len(same) == 1:
            declaration = same[0]
        else:
            declaration = min(same, key=lambda c: abs(c.line - int(entry.get('line', c.line))))
    comment = ah.normalized_comment(entry['generated_comment'])
    if declaration.doc is not None:
        edits.append((declaration.doc.start, ah.doc_removal_end(text, declaration), ''))
    start = ah.insertion_start(text, declaration)
    edits.append((start, start, comment))
new_text = text
for start, end, replacement in sorted(edits, reverse=True):
    new_text = new_text[:start] + replacement + new_text[end:]
new_text = new_text.replace('\r\n', '\n').replace('\r', '\n')
print('len(text)=', len(text))
print('len(new_text)=', len(new_text))
for i, (a, b) in enumerate(zip(text, new_text)):
    if a != b:
        print('first_diff', i, repr(text[max(0, i-20):i+20]), repr(new_text[max(0, i-20):i+20]))
        break
else:
    if len(text) != len(new_text):
        print('prefix_equal_length_diff')
    else:
        print('no_diff_found')
