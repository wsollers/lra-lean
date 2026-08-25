import sys
from pathlib import Path
sys.path.insert(0, str(Path('.').resolve()))
import scripts.harvest_hover_comments as h
path = Path('LRA/Function/Calculus/Evaluation/Theorems.lean')
text = path.read_text(encoding='utf-8')
for decl in h.HOVER.declarations_in(text):
    if decl.name == 'GraphRelatesValue':
        print('decl line', decl.line)
        print('module', h.module_name_for_path(path))
        print('row', h.compiled_row_for(h.COMPILED_ROWS, h.module_name_for_path(path), decl.name))
        print('fields', h.predicate_logic_fields(h.module_name_for_path(path), decl.name, h.HOVER.logical_form(decl)))
        break
