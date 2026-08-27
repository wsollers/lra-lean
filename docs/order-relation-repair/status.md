# Relation/Order Repair Status

- Generated: 2026-08-27
- Repo: `lra-lean`
- Branch: `main`
- Source: conversation — `LRA/Order` restructure request, redirected to
  `LRA/Relation`-first after the "a relation is a set" correction
- Workflow: `docs/order-relation-repair/README.md` — one subject at a time,
  strict tier order, two passes (reorg, build), gated on
  `validate_structure.py` + `lake build`
- Standing decisions: `docs/order-relation-repair/DECISIONS.md`
- Sibling, separately-tracked coordinator: `docs/algebraic-structures-repair/`
  (mirror its shape; do not merge ledgers)

| Item | Tier | Subject | Status | Depends on | Notes |
|---|---|---|---|---|---|
| or-01 | 1 | Relation | **not_started** | — | The foundational item — `SetRelation` via `HasPairing`/`CartesianProductOf`/`HasSeparation`, plus a Mathlib `Set (Carrier × Carrier)` construction. Nothing else starts before this is done and reported back. |
| Combinators | 1 | Order/Constructions → Interface/Combinators rename | **not_started** | — | Mechanical, no math dependency, can run in parallel with or-01. |
| or-02 | 2 | Preorder | not_started | or-01 | |
| or-03 | 2 | PartialOrder / Poset | not_started | or-01 | Full model-theoretic write-up already reviewed for this one — see ledger notes. |
| or-04 | 2 | StrictOrder / StrictPoset | not_started | or-01 | |
| or-05 | 2 | JoinSemilattice (order-theoretic) | not_started | or-01 | Distinct from `AlgebraicStructures`' own JoinSemilattice (as-08, done there) — check its `Constructions/OrderTheoretic/InducedOrder.lean` bridge first. |
| or-06 | 2 | MeetSemilattice (order-theoretic) | not_started | or-01 | Dual of or-05; check as-09 first. |
| or-07 | 3 | LinearOrder | not_started | or-03 | |
| or-08 | 3 | StrictLinearOrder | not_started | or-04 | |
| or-09 | 3 | Lattice | not_started | or-05, or-06 | Algebra↔order equivalence already exists at `Order/Interop/AlgebraicLattice.lean` (as-12 found this) — reuse, don't duplicate. |
| or-10 | 4 | WellOrder + `Ax_WellOrdered` | not_started | or-07 | Axiom naming exception confirmed — see DECISIONS.md R4. |
| or-11 | 4 | DenseOrder / DenseLinearOrder | not_started | or-07 | |
| or-12 | 4 | DiscreteOrder | not_started | or-04 | |
| or-13 | 4 | BoundedLattice | not_started | or-09 | Reuse `AlgebraicStructures/BoundedLattice`; check as-16. |
| or-14 | 4 | DistributiveLattice | not_started | or-09 | Check as-17. |
| or-15 | 4 | CompleteLattice | not_started | or-09, or-01 | Arbitrary-subset join/meet — needs Relation/Set machinery directly. |
| or-16 | 5 | UniversalAlgebra wiring (Lattice family) | not_started | or-09 | `LRA.UniversalAlgebra`, not `LRA.Identity`'s copy — DECISIONS.md R9. |
| or-17 | 5 | Bounds (definability layer) | not_started | or-03, or-09 | |
| or-18 | 5 | Morphisms | not_started | or-03 | |
| or-19 | 5 | Order's own Relation/ + Directedness | not_started | or-03 | Consider renaming `Order/Relation/` → `Interface/RelationProperties/` to avoid confusion with the top-level `LRA/Relation` restructured in or-01. |

**Next step:** `or-01` (Relation) and `Combinators` (mechanical rename) are
the only two unblocked items. Start with `or-01` — it's the load-bearing
design decision everything else depends on; do the rename in parallel or
right after, it's independent. Do not start any `or-0N` (N ≥ 2) item before
`or-01` is `done` and reported back, per README.

**Baseline** (2026-08-27): `python scripts/validate_structure.py --path
LRA/Order` and `--path LRA/Relation` both pass trivially today (neither has
a `ModelTheory`/`UniversalAlgebra` dir yet to violate the validator's shape
rules — this will start being a real gate once `or-01`/`or-02`+ add one).
`LRA/Order` baseline `sorry` count: 380. `LRA/Relation` not yet counted.
