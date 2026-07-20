# Volume I Foundation True-Up Plan

Source basis: `F:/repos/lra-volume-i/volume-i/book-sets`.

Lean scope: `LRA/Foundation` first, with `LRA/VolumeI` used only where existing
logic material already belongs there.

## Current Baseline

- Crosswalk report: `docs/foundations/volume-i-set-theory-crosswalk.md`
- Book labels scanned: 228
- Lean declarations scanned: 400
- Represented: 68
- Partial: 49
- Missing: 111

## Completed Slice: Set Operations and Set Algebra

The first low-risk foundation pass added Volume I-backed set vocabulary to
`LRA.Foundation.LRASet` and exposed constructor-level operations through the
active set implementation switch.

New or newly surfaced Lean coverage:

- `def:sym-diff`
- `def:inclusion-monotone-set-operation`
- `def:inclusion-antitone-set-operation`
- `thm:union-monotone-inclusion`
- `thm:intersection-monotone-inclusion`
- `thm:power-set-monotone-inclusion`
- `thm:complement-antitone-inclusion`
- `thm:set-difference-monotone-left`
- `thm:set-difference-antitone-right`
- `thm:de-morgan`
- `def:indexed-family`
- `thm:indexed-de-morgan`
- `thm:indexed-distributivity`
- `def:cover-full`
- `def:subcover`
- `def:finite-cover`
- `def:open-cover`
- `def:fip`

Remaining set-theory refinements:

- Split umbrella laws into all binary book clauses: associativity,
  distributivity, identity, absorption, and involution.
- Add a formal expression-level treatment only if the later text really needs
  `def:set-duality`; otherwise keep duality as theorem-schema documentation.
- Decide whether `def:arbitrary-product` belongs in sets, functions, or the
  later choice/cardinality layer before adding its Lean interface.
- Keep `prop:fip-duality` pending until finite indexed subfamilies and relative
  complements are represented cleanly.

## Next Slice: Relation Algebra

Target labels:

- identity, null, and universal relations;
- relation inclusion and equality;
- relation union, intersection, difference, and complement;
- converse laws and composition laws;
- Boolean interaction laws for composition;
- transitive and equivalence closures;
- one-to-many, many-to-one, many-to-many, and many-place relation
  classifications.

Implementation notes:

- Extend `LRA.Foundation.Relations` rather than creating a second relation
  namespace.
- Keep relation operations as operations on `LRASet (α × β)` where possible.
- Use theorem statements with `sorry` for closure minimality/universal
  properties if the proof is not immediate.

## Following Slices

Equivalence and quotient foundations:

- equivalence class, quotient set, index, canonical surjection, partition,
  representative independence, equivalence-partition correspondence, quotient
  universal property.

Function-as-relation layer:

- functional relation, total-on-domain, partial function, function equality,
  codomain, graph, empty/inclusion/constant maps, inverse and one-sided inverse
  laws, image/preimage theorem blocks.

Orders:

- comparable and incomparable elements, bounds, extremal elements, order maps,
  order isomorphisms, induced orders, suborders, embeddings, sup/inf, lattice
  vocabulary, duals, extensions, Zorn, and Hausdorff maximal principle.

Cardinality:

- equipotence, finite/infinite, countable/uncountable, cardinal comparison,
  function spaces, countability theorems, Cantor, and Schroeder-Bernstein.

## Validation Gates

After each slice:

- `lake -R build LRA.Foundation`
- `python scripts/report-volume-i-foundation-crosswalk.py`
- `python -m py_compile scripts/report-volume-i-foundation-crosswalk.py`
- `git diff --check`
