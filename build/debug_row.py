import csv
from pathlib import Path
rows = list(csv.DictReader(Path('build/proofs-todo-environment.tsv').open(encoding='utf-8', newline=''), delimiter='\t'))
for row in rows:
    if row['fq_name'] == 'LRA.Function.GraphRelatesValue':
        print(repr(row['pretty_type_uncurried']))
        print(repr(row['pretty_type_unfolded']))
        print(repr(row['unfold_status']))
        break
