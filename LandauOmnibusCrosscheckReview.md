# Landau / Omnibus Cross-Check Review

## Scope

Cross-check of the historical review/backlog documents against the current `main` tree:

- `landaureview.md`
- `OMNIBUS-GAP-LIST.md`
- `OMNIBUS-PUNCHLIST.md`
- `FoundationsOfArithmeticAndAlgebraAnOmnibusOfOperationsLawsAndAxiomsInTheAxiomaticStyleOfLandau.txt`

The old documents predate the large namespace/architecture promotion from `LRA.VolumeI.*` to canonical homes such as `LRA.Set`, `LRA.Relation`, `LRA.Function`, `LRA.Operation`, `LRA.Order`, `LRA.Morphism`, and `LRA.AlgebraicStructures`. Their old paths and status labels are therefore not authoritative. This cross-check uses the mathematical requirement, then checks whether the current tree has a canonical definition/theorem surface for it.

Project rule: `sorry` is not treated as a mathematical defect. The question here is whether the concept/theorem is now stated in the correct layer and whether any earlier architectural defect remains.

---

# Executive result

A large majority of the **structural Landau spine** requested by the old reviews has now been built:

```text
Set
-> Relation
-> Function
-> Operation
-> Order
-> Morphism
-> AlgebraicStructures
-> concrete NumberSystems
```

The old omnibus documents are therefore substantially stale as gap reports.

The remaining backlog is concentrated in:

1. a few unresolved Landau cleanup items (`OperationPower`, nilpotence semantics, some order/lattice bridges);
2. theorem catalogues that have structure folders but little/no theorem content yet, especially ordered algebra;
3. omnibus Chapters 5-8: abstract absolute value, a complete generic exponentiation layer, and floor/ceiling;
4. a formal L0-L34 law catalogue and final N/Z/Q/R/C instantiation ledger;
5. several cross-layer bridges that remain pedagogically valuable even though the base concepts exist.

This document should replace the old `OMNIBUS-GAP-LIST.md` statuses as the current review ledger. The old files remain useful as historical requirements/source maps.

---

# A. `landaureview.md` blocking list — current status

The final blocking list in `landaureview.md` contained twelve items.

| # | Historical issue | Current status | Current assessment |
|---|---|---|---|
| 1 | Remove/fix `MixedOperationResultCarrier` | **ADDRESSED** | No active declaration was found. The vacuous law has been removed from the current canonical operation surface. |
| 2 | Fix `RelationEmbedding` naming/injectivity | **ADDRESSED** | `LRA.Morphism.RelationEmbedding` is now explicitly `Injective function ∧ PreservesAndReflectsRelation ...`. The weaker concept is separately named `PreservesAndReflectsRelation`. |
| 3 | Add generic relation composition | **ADDRESSED** | `LRA.Relation.Operations.Composition` now exists. Associativity, left/right identity, and converse reversal are stated in `Composition/Consequences.lean`. |
| 4 | Add generic `Relation.MaximalElement` / fix drift | **ADDRESSED** | `LRA.Relation.Properties.Definition` now contains both generic `MinimalElement` and `MaximalElement`. |
| 5 | Canonicalize `Equivalence` vs `EquivalenceRelation` | **ADDRESSED** | Canonical relation-structure owner is `LRA.Relation.EquivalenceRelation`; no competing active `Relation.Equivalence` definition was located. |
| 6 | Re-home `OperationPower` outside nilpotence | **OPEN** | `OperationPower` and `PositivePower` still live in `LRA/Operation/Laws/Nilpotent/Definition.lean`. This remains an ownership defect. |
| 7 | Decide whether nilpotence presupposes associativity | **OPEN** | `NilpotentElement` still uses the recursively left-associated `PositivePower` with no associativity hypothesis. Standard nilpotence terminology is still broader than the actual semantics. |
| 8 | Break `SignNegationLaws` into prerequisites/derived theorems | **MOSTLY ADDRESSED** | The old monolithic `SignNegationLaws` was not found. Canonical additive inverse and subtraction certificates now live in `AlgebraicStructures/AdditiveGroup/Laws/Definition.lean`. The derived sign theorem catalogue is not yet as explicit as the historical review requested. |
| 9 | Pin subtraction to addition + additive inverse | **ADDRESSED** | `SubtractionCompatibilityLaw` explicitly requires `a - b = a + -b`, with wrapper theorem `SubEqAddNeg`. |
| 10 | Add explicit `TopElement` / `BottomElement` | **ADDRESSED** | Both are canonical imported concepts under `LRA.Order.Bounds`. |
| 11 | Add relation-property implication theorem family | **ADDRESSED** | `LRA.Relation.Properties.Consequences` includes e.g. asymmetry -> irreflexivity, irreflexive+transitive -> asymmetric, asymmetry -> antisymmetry, symmetric+antisymmetric collapse, and related consequences. |
| 12 | Add Map <-> Relation bridge theorems / kernels | **SUBSTANTIALLY ADDRESSED** | `LRA.Function` has graph/evaluation/class theorems; `KernelRelationIsEquivalenceRelation` and `InjectiveIffKernelIsIdentityRelation` are present. The full historical wish-list (all section/retraction/fiber/Galois-connection bridges) should still be checked/completed individually. |

## Landau blocking verdict

Only **#6 and #7 remain clearly unresolved as original blockers**. #8 and #12 are no longer architectural blockers but retain theorem-surface follow-up work.

---

# B. Other `landaureview.md` recommendations

## Relation closures

**Partially addressed.**

The current tree has dedicated closure areas for:

- reflexive closure;
- symmetric closure;
- transitive closure.

This is a major improvement over the historical review.

Still not located as canonical closure constructions:

- reflexive-transitive closure as a named relation operation;
- equivalence closure / generated equivalence relation.

These are useful but were explicitly second-wave material in the original review, not proof-readiness blockers.

## Preorder antisymmetrization

**Addressed at the conceptual/theorem level.**

The current Order/Preorder relationship layer contains the preorder quotient/antisymmetrization material that the historical review highlighted. This should remain a prominent named construction.

## Suprema/infima uniqueness hierarchy

**Addressed substantially.**

The current `LRA.Order.Bounds` tree has separate canonical homes for upper/lower bounds, least/greatest elements, minimal/maximal elements, suprema/infima, and relationship files. Earlier review work has already verified the definitions as mathematically sound.

## Minimum/maximum aliases

**Not verified as canonical aliases.**

The semantic distinction among `LeastElement`/`GreatestElement` and `MinimalElement`/`MaximalElement` is correctly present. The optional aliases

```text
Minimum := LeastElement
Maximum := GreatestElement
```

were not located. This is pedagogical vocabulary, not a mathematical blocker.

## Chosen join/meet operations and operation-law bridge

**OPEN / PARTIAL.**

The current algebraic hierarchy now includes:

- `JoinSemilattice`;
- `MeetSemilattice`;
- `Lattice`;
- `BoundedLattice`;
- `DistributiveLattice`;
- `BooleanAlgebra`.

That addresses much of the old structural gap. However, a search did not locate a clear canonical theorem layer explicitly deriving a chosen join/meet operation and certifying it through the generic `LRA.Operation` laws as associative + commutative + idempotent, nor the converse semilattice-operation -> partial-order construction requested in the review.

This remains a high-value cross-link, not a prerequisite for the number-system spine.

## Bounded lattice

**ADDRESSED.**

`LRA.AlgebraicStructures.BoundedLattice` is now part of the canonical aggregate.

## Filtered / downward-directed dual

**OPEN / not located.**

No canonical `Filtered` / `DownwardDirected` owner was located in this cross-check. Low priority.

## Order compatibility as monotonicity of translations

**PARTIAL / theorem bridge not confirmed.**

Both operation/order compatibility concepts and monotone/antitone map concepts now exist. The explicit iff theorem identifying translation compatibility with monotonicity of every translation map was not confirmed in the current search.

## Generic intervals and order-convex subsets

**Deferred / outside current foundational cleanup boundary.**

These are appropriate consumers of Order rather than blockers for the Landau algebraic spine. They should remain with later analysis/topology work unless a generic order-only interval API is intentionally promoted.

## Relation-property independence examples/matrix

**PARTIAL.**

The repository has extensive Examples/FailureModes structure in Relation and Order, but this cross-check did not locate one explicit canonical independence matrix matching the historical table. Pedagogical addition only.

## File architecture convention

**ADDRESSED strongly.**

The current tree widely uses the refined pattern:

```text
Definition
Characterizations
Theorems
Consequences
Relationships
Examples
FailureModes
```

This is one of the clearest architectural improvements since `landaureview.md`.

## Named algebraic-structure layer

**FULLY ADDRESSED structurally.**

The historical review's largest architectural absence no longer exists. `LRA.AlgebraicStructures` now aggregates named structures including:

```text
Magma
Semigroup
Monoid
CommutativeMonoid
Group
AbelianGroup
Semiring
CommutativeSemiring
Ring
CommutativeRing
NontrivialRing
IntegralDomain
DivisionRing
Field
OrderedGroup
OrderedRing
LinearlyOrderedRing
OrderedField
CompleteOrderedField
JoinSemilattice
MeetSemilattice
Lattice
BoundedLattice
DistributiveLattice
BooleanAlgebra
```

The machine/certificate/bundle split is now the canonical architecture and was one of the strongest parts of the later audit.

---

# C. `OMNIBUS-GAP-LIST.md` / `OMNIBUS-PUNCHLIST.md` — phase cross-check

The old omnibus files still refer heavily to obsolete paths such as `LRA/VolumeI/Operations` and `LRA/VolumeI/Relations`. The requirements should now be mapped to canonical promoted namespaces.

## Phase 1 — Sets

### Basic set law catalogue

**LARGELY ADDRESSED.**

The canonical set layer is now backend-agnostic through `LRA.Set.Interface` and `LRA.Set.SetClass`, with PredicateSet/ZF/NBG/TG/Mathlib implementations separated from the semantic interface. The later set audit found the machine/certificate split strong.

The old predicate-set-vs-ZFC architecture concern is **addressed structurally**: `LRA.Set` explicitly selects no concrete ontology and exposes shared laws, while concrete realizations are opt-in.

### Set algebra / sigma-algebra bridge

**STRUCTURALLY ADDRESSED BUT WITH KNOWN P0 ELSEWHERE.**

`LRA.SetSystems` now owns Ring/Algebra/SigmaRing/SigmaAlgebra-style set systems. However, the generated-sigma-algebra construction has the independently documented admissibility/vacuity P0. That issue is already tracked in `SetSystemsReview.md` and is not a missing omnibus concept.

### Boolean algebra instantiation

**PARTIAL.**

A canonical `BooleanAlgebra` hierarchy now exists, but this cross-check did not confirm a canonical theorem/instance saying the generic predicate-set/set-algebra implementation instantiates that hierarchy. Keep this as an open omnibus bridge unless another file is identified.

## Phase 2 — Relations

### Relational algebra API

**ADDRESSED substantially.**

Current canonical relation operations include boolean operations, converse, composition, identity/empty/universal canonical relations, classes/images/preimages, and closure operations.

### Missing named properties

**ADDRESSED.**

Asymmetric, Euclidean, dense, exact trichotomy, and well-founded/order-related vocabulary now exist.

### Relation-property theorem catalogue

**ADDRESSED substantially.**

The canonical `Properties/Consequences` layer includes the main implication family specifically requested by both the omnibus and Landau review.

### Equivalence classes / partitions

**ADDRESSED structurally.**

The current Relation/Order quotient architecture contains the necessary equivalence/quotient concepts. Proof completion is separate.

## Phase 3 — Function/Map layer

**ADDRESSED strongly.**

The old Map layer has been promoted/reorganized under canonical `LRA.Function` + `LRA.Relation` concepts. Current theorem inventory contains graph, image, preimage, fibers, kernel relation, product/curry operations, inverse/composition, and class-theoretic statements.

Still useful to complete/verify explicitly:

- section/retraction -> surjective/injective theorem family;
- fiber characterizations of injective/surjective/bijective;
- image/preimage Galois connection;
- complete order-isomorphism/map-bijectivity bridge.

These are theorem-surface gaps, not missing foundational representations.

## Phase 4 — Operations

### n-ary operations

**PARTIAL.**

The canonical `LRA.Operation` owner cleanly covers nullary, unary, binary, heterogeneous, endo-, external, and partial operations. A general finite-arity `S^n -> S` operation abstraction corresponding literally to omnibus Definition 0.6 was not confirmed in the canonical owner.

### Cancellation

**ADDRESSED.**

Generic left/right/two-sided cancellation concepts and restricted cancellation are present in `LRA.Operation.Laws.Cancellation`.

### Identity/absorber/inverse/idempotent law families

**ADDRESSED structurally.**

These now have dedicated law modules, examples, failure modes, and theorem surfaces.

### Left/right collapse theorems

**PARTIAL / not exhaustively verified.**

The law modules are now sufficiently granular to support them, but this cross-check did not confirm every omnibus-requested commutativity-collapse theorem.

### Divisibility preorder

**Present conceptually; proof/theorem status not exhaustively rechecked here.**

## Phase 5 — Algebraic Structures

### Normalize competing structure owners

**MOSTLY ADDRESSED.**

`LRA.AlgebraicStructures` is now clearly the canonical algebra/order certificate hierarchy. `LRA.UniversalAlgebra` remains for genuinely universal-algebra concepts such as homomorphisms, subalgebras, congruences, kernels, etc. Some older reference/facade definitions remain, but the canonical ownership is now far clearer than when the punchlist was written.

### Abstract structures canonical

**ADDRESSED strongly.**

Concrete complex and Gaussian integer construction audits demonstrate the intended pattern: prove operation laws, register `AlgebraicStructures` certificates, then consume them downstream.

### Boolean algebra hierarchy

**ADDRESSED structurally.**

Canonical `BooleanAlgebra`, `BoundedLattice`, and `DistributiveLattice` exist.

### Basic hierarchy variants

**ADDRESSED.**

The canonical aggregate contains all major variants requested in the old punchlist, including nontrivial rings, domains, division rings, fields, and ordered variants.

### Two-operation theorem catalogue

**PARTIAL.**

Distributive/absorbing/nonzero structure certificates are present. A dedicated pedagogical theorem catalogue containing every old omnibus Chapter 2 consequence (zero absorption derivation, full law-of-signs chain, zero has no inverse, etc.) is not yet complete as a single layer.

## Phase 6 — Ordered Algebra

### Ordered group/ring/field structures

**ADDRESSED structurally.**

Canonical structures and law modules exist.

### Ordered algebra theorem catalogues

**OPEN / THIN.**

For example, `LRA/AlgebraicStructures/OrderedGroup/Consequences.lean` currently contains only the namespace/comment skeleton. Thus the old omnibus request for named generic consequences such as adding inequalities, sign of negatives, and subtraction/order interactions is not fully addressed despite the structure existing.

The same warning should be applied to OrderedRing/OrderedField consequence surfaces until individually populated.

## Phase 7 — Absolute Value, Subtraction, Division, Powers

### Abstract absolute value

**OPEN.**

No canonical general `AlgebraicStructures/AbsoluteValue` layer was located. This remains a real omnibus gap. Existing real-analysis absolute value material or construction-specific metric absolute values do not replace the requested abstract ordered-algebra concept.

Required eventual theorem surface remains:

- nonnegativity;
- zero iff zero;
- `|-x| = |x|`;
- multiplicativity (at field/ring strength);
- triangle inequality;
- reverse triangle inequality.

### Subtraction

**CORE BRIDGE ADDRESSED.**

`SubtractionCompatibilityLaw` now formally pins subtraction to addition and negation. Additional subtraction theorem catalogue can be derived from this.

### Division

**PARTIAL.**

Field/division-ring structures and inverse/division operations exist, but this cross-check did not locate a standalone generic Chapter-6-style division theorem layer analogous to the subtraction compatibility certificate. Keep generic division-law presentation as an open pedagogical item.

### Natural exponentiation

**OPEN / MIS-OWNED.**

`OperationPower` exists, but still inside `Operation/Laws/Nilpotent`. It does not yet serve as the clean generic monoid exponentiation layer requested by the omnibus.

Required repair:

```text
Operation/Power or Operation/Iteration
  OperationPower
  pow_zero
  pow_succ
  pow_add
  pow_mul / power-of-power
```

with associativity/identity hypotheses stated explicitly.

### Integer exponentiation

**OPEN.**

No canonical generic negative/integer exponent layer was located.

## Phase 8 — Floor / Ceiling

**OPEN.**

No canonical floor/ceiling hierarchy matching the omnibus was located.

Still needed if this chapter remains in scope:

- an Archimedean ordered-field/embedded-integer abstraction suitable for floor;
- floor existence/uniqueness;
- ceiling;
- duality;
- monotonicity;
- integer shifts;
- floor-sum bounds;
- fractional part.

This is independent of the later analysis research phase: it is elementary ordered-number-system infrastructure in the omnibus.

## Phase 9 — Volume II as instantiation of the spine

**PARTIALLY ADDRESSED, architecture now much better.**

The concrete Complex and Gaussian constructions demonstrate correct certificate consumption. The natural/integer/rational/real audits found more uneven construction-to-model bridges.

Outstanding issues are already documented elsewhere:

- weak input contracts in WholeNumbers / quotient integers / quotient rationals;
- detached `...Realizes...Model` return types;
- rational/real extension bridges not consistently tied to the constructed carrier;
- universal-property uniqueness omissions.

Thus the omnibus architectural direction is correct, but the full N/Z/Q/R/C instantiation story is not yet closed.

## Phase 10 — L0-L34 law catalogue

**OPEN.**

No canonical `LawCatalogue` or equivalent stable L0-L34 mapping was located. The underlying concepts are now mostly present, but the omnibus asked for a reference catalogue with stable pointers.

This is now mostly documentation/re-export work, not new foundational mathematics.

## Phase 11 — Number-system instantiation ledger

**PARTIAL / NOT YET A SINGLE TRUSTWORTHY LEDGER.**

The older `ComparisonMatrix`/ledger work was previously audited as too detached from actual carriers. Current construction-specific certificates are improving, but a final source-of-truth ledger that says exactly which concrete carrier satisfies which canonical law bundle is still needed.

Do not repair this with bare `Prop` fields. It should point to actual typeclass/certificate instances or carrier-tied theorems.

## Phase 12 — Cleanup / extraction inventory

**PARTIAL.**

The repository now has:

- generated `ProofsToDo.md` inventories;
- proof-readiness checker;
- namespace/ownership documentation;
- multiple review ledgers.

Still open:

- update or supersede the stale omnibus gap/punchlist statuses;
- extend automated proof-readiness checks to semantic placeholders (`:= 0`, tautologies, detached realization return types, name/statement mismatches);
- optionally generate an omnibus-specific source-label -> canonical Lean declaration crosswalk.

---

# D. Current unresolved omnibus / Landau list

These are the items from the historical Landau/omnibus documents that remain worth tracking after removing issues already addressed by the promoted architecture.

## High priority foundational cleanup

1. **Move `OperationPower` out of `Laws/Nilpotent`.**
2. **Make ordinary nilpotence require/assume associativity, or rename current concept to left-associated nilpotence.**
3. **Finish the abstract sign/negation consequence chain from additive inverses + distributivity rather than merely relying on structure instances.**
4. **Populate ordered-group/ring/field consequence theorem files.**
5. **Finish important Function/Relation bridges**: section/retraction, fiber characterizations, image/preimage Galois connection, order-isomorphism/bijection characterization.
6. **Add/verify the semilattice <-> associative/commutative/idempotent-operation bridge.**
7. **Add `Filtered`/downward-directed dual if maintaining full relation/order symmetry.**

## Omnibus chapter gaps

8. **Abstract absolute-value layer.**
9. **Generic division theorem layer.**
10. **Generic monoid exponentiation theorem layer.**
11. **Generic integer/negative exponent layer.**
12. **Floor/ceiling/Archimedean integer-part layer.**
13. **Literal general n-ary operation/relation layer** if the omnibus's `S^n` formulation is to be represented directly rather than only through nullary/unary/binary specializations.
14. **L0-L34 law catalogue/crosswalk.**
15. **Carrier-tied N/Z/Q/R/C instantiation ledger.**
16. **Predicate-set/set-algebra -> canonical BooleanAlgebra bridge**, if not already present under a name missed by this search.

## Lower priority pedagogical additions from `landaureview.md`

17. Minimum/maximum aliases for least/greatest.
18. Reflexive-transitive and equivalence closure as named general relation operations.
19. Relation-property independence matrix.
20. Generic interval/order-convex API (can remain in later analysis-facing work).

---

# E. Historical documents that should no longer be read literally

`OMNIBUS-GAP-LIST.md` and `OMNIBUS-PUNCHLIST.md` contain many obsolete paths and many `Missing`/`Partial` labels that are no longer true after the canonical namespace promotion.

Examples of old gaps now structurally solved include:

- asymmetric/Euclidean/dense/exact relation predicates;
- relation-property implication family;
- general relation composition;
- relation closures;
- canonical function layer;
- cancellation laws;
- algebraic structure hierarchy;
- bounded/distributive lattices;
- Boolean algebra;
- ordered group/ring/field structures;
- subtraction compatibility;
- top/bottom elements.

Recommendation: retain the old files as historical source/planning documents, but put a banner at their top pointing to this cross-check or regenerate them from the current tree. Otherwise they now materially overstate the remaining foundational work.

---

# F. Choice audit implications from the omnibus

The source omnibus explicitly notes that constructing a right inverse from surjectivity uses the Axiom of Choice. That is a genuine family-wise selection principle when performed for an arbitrary surjection/family of fibers.

This matches the review policy already used elsewhere:

- a theorem obtaining an inverse by selecting one preimage in every fiber may use genuine Choice;
- extracting a single witness from an already-given existential/unique-existence proof is not itself AC.

No additional current Choice defect was discovered in this cross-check.

---

# Final assessment

The historical reviews did their job: most of their architectural recommendations have been implemented.

The current state is no longer "build the Landau spine." The spine largely exists.

The remaining work is better described as:

```text
finish a few ownership/semantic cleanups
+ populate missing consequence theorem catalogues
+ implement omnibus Chapters 5-8
+ make the concrete number-system instantiation ledger carrier-tied
+ add a stable omnibus law/source crosswalk
```

The two clearest unresolved items that survived unchanged from the original `landaureview.md` blocking list are the location/ownership of `OperationPower` and the associativity semantics of `NilpotentElement`.
