# Review of `LRA/VolumeI/Order`

Date: 2026-08-14

Reviewed revision: `b2ee7de` (`main`)

Requested scope: mathematical statements and curriculum design; `sorry` proofs were intentionally ignored.

## Overall assessment

**Revision required before this is treated as the canonical Volume I order theory.**

The rework has a sound core: the definitions of preorder, non-strict partial
order, strict order, total/linear order, upper and lower bounds, least and
greatest elements, supremum and infimum, lattice, complete lattice, directed
subset, and well-order have the expected logical shapes when their displayed
relation and set backend are interpreted as documented. The strict/non-strict
conversion results are also mathematically valid.

There are, however, two statement-level defects that change the mathematics:

1. `DenseOrder` and `DenseLinearOrder` apply relation density to the same
   reflexive relation used for `PartialOrder`/`LinearOrder`. Consequently every
   partial order satisfies the current density clause, so the definitions do
   not express order density.
2. `Chain` uses the non-strict comparability formula for an arbitrary relation.
   Applied to a strict order, it makes every nonempty subset fail to be a
   chain.

The new `OrderedSets/<Concept>/...` packages follow the intended concept-file
roles only in part. Most of order theory remains in flat legacy modules, and
the failure-mode and theorem surfaces are not yet strong enough for the stated
study level. Mathlib interoperability is structurally possible and is already
demonstrated in a pilot, but it is not yet a public part of
`LRA.VolumeI.Order`.

## Priority findings

### P0 — `DenseOrder` and `DenseLinearOrder` are mathematically wrong

[`Density.lean`](LRA/VolumeI/Order/Density.lean) defines

```lean
PartialOrder relation ∧ Relations.Dense relation
```

and similarly uses `LinearOrder relation` for `DenseLinearOrder`. But
[`Relations.Dense`](LRA/VolumeI/Relations/Basic/CoreProperties.lean) says

```lean
relation left right →
  ∃ middle, relation left middle ∧ relation middle right
```

For any reflexive relation, choose `middle := left`. Thus every preorder, every
partial order, and every linear order is “dense” under the current definition.
In particular, the current non-strict integer order satisfies the density
clause, even though [`Examples.lean`](LRA/VolumeI/Order/Examples.lean) correctly
states that integer **strict** order is not dense. The example and the public
definition therefore talk about different relations and do not test each
other.

Recommended canonical choices:

- Strict presentation:
  `StrictOrder lt ∧ Relations.Dense lt`, and for the linear case
  `StrictLinearOrder lt ∧ Relations.Dense lt`.
- Non-strict presentation:
  require a partial/linear order `le`, form its strict part, and require
  density of that strict part.

The strict and non-strict presentations should be proved equivalent under the
strict/non-strict correspondence. A regression example should prove that
`Rat` is dense and `Int` is not dense in the appropriate presentation.

### P0 — `Chain` is valid only for a reflexive comparison, but its type permits a strict one

[`Directed.lean`](LRA/VolumeI/Order/Directed.lean) defines a chain by

```lean
∀ first second,
  first ∈ subset → second ∈ subset →
    Comparable relation first second
```

where [`Comparable`](LRA/VolumeI/Order/Relations.lean) is
`relation first second ∨ relation second first`. This is canonical for a
non-strict order. For a strict order, taking `first = second` demands
`x < x ∨ x < x`; hence a strict-order chain must be empty.

The API should either:

- accept a bundled non-strict partial order/poset and retain the present
  comparison formula; or
- define strict comparability as `x < y ∨ x = y ∨ y < x` and expose a
  separate strict-chain predicate.

Add equivalence theorems between the strict and non-strict formulations.

### P1 — Backend-relative subset quantification needs canonical `Set` specializations

[`Completeness.lean`](LRA/VolumeI/Order/Completeness.lean),
[`WellOrder.lean`](LRA/VolumeI/Order/WellOrder.lean), and
[`WellFounded.lean`](LRA/VolumeI/Order/WellFounded.lean) quantify over an
arbitrary `SetObject` having only a `Membership Element SetObject` instance.
This is useful for supporting both LRA set models and predicate sets, and the
files commendably make `SetObject` explicit. It is not, by itself, the
unqualified statement “for every subset of the carrier.” It means “for every
member of this chosen family of set objects.”

This distinction is mathematically material. For example, a backend with one
set object whose membership relation is always false makes every
least-upper-bound property vacuous, and makes the subset clause of every total
order's `WellOrder` vacuous. Nothing in `Membership` says that all predicate
subsets are represented.

Recommended resolution:

- Keep the backend-relative predicates, but name/document them explicitly as
  relative predicates (for example, `WellOrderOnSets` or
  `LeastUpperBoundPropertyOver`).
- Define the ordinary canonical specialization using `Set Element`.
- If an LRA set backend is meant to represent all relevant subsets, state the
  required adequacy/surjectivity interface and prove transfer theorems.
- For well-foundedness, connect the `Set Element` minimal-element formulation
  to Lean/Mathlib `WellFounded`; note explicitly where classical logic is used.

Without these specializations and transfer theorems, later readers can easily
mistake a backend-relative certificate for ordinary well-foundedness,
well-ordering, or completeness.

### P1 — Failure-mode packages do not yet satisfy the repository contract

The architecture requires a named failure predicate or witness construction
to be followed immediately by a theorem showing that it realizes the
advertised failure. It also recommends existential counterexamples for failed
implications.

Current issues:

- [`Preorder/FailureModes.lean`](LRA/VolumeI/Order/OrderedSets/Preorder/FailureModes.lean)
  defines `FailsPreorder` but gives no relation theorem satisfying it. The only
  theorem says that a valid preorder is not antisymmetric. That is a useful
  boundary between preorders and partial orders, but it is not a failure of
  the preorder laws and belongs under a relationship or partial-order failure.
- [`StrictOrder/FailureModes.lean`](LRA/VolumeI/Order/OrderedSets/StrictOrder/FailureModes.lean)
  covers failure of irreflexivity with `Nat`'s `≤`, but has no case that is
  irreflexive and fails transitivity.
- [`PartialOrder/FailureModes.lean`](LRA/VolumeI/Order/OrderedSets/PartialOrder/FailureModes.lean)
  introduces three failure predicates before any witness theorem, so the
  definition/theorem pairing is not local. Its examples are sensible, but
  their statements generally prove only the failed property, not that the
  other axioms hold. As written, they demonstrate failure, not independence of
  the axioms.
- `FailsTotality` and the Boolean equality example are not failures of being a
  partial order; they show that a partial order need not be total. They belong
  in a future `TotalOrder/FailureModes.lean` or in a relationship module.
- [`Poset/FailureModes.lean`](LRA/VolumeI/Order/OrderedSets/Poset/FailureModes.lean)
  repeats the strict-`Nat` failure already present for partial orders instead
  of testing something specific to the bundled-poset interface.

For each axiom family, provide exact independence witnesses:

- preorder: non-reflexive but transitive; reflexive but non-transitive;
- strict order: transitive but non-irreflexive; irreflexive but
  non-transitive;
- partial order: one witness for each of reflexivity, antisymmetry, and
  transitivity, with the theorem stating that the other two hold;
- total order: a genuine partial order that fails totality, such as equality
  on `Bool` or divisibility on suitable naturals.

Each named witness should be immediately followed by the theorem proving its
full advertised property profile.

### P1 — The topic/concept reorganization is only partially applied

The repository architecture requires concept-facing material under
`Order/<Topic>/<Concept>/` with semantic files such as `Definition.lean`,
`Characterizations.lean`, `Theorems.lean`, `FailureModes.lean`,
`Examples.lean`, `Relationships.lean`, and `All.lean` as needed.

`Order/OrderedSets/{OrderRelation,Preorder,PartialOrder,StrictOrder,Poset}`
conforms to that directory shape. The following still sit flat under `Order/`:

`Relations`, `TotalOrder`, `LinearOrder`, `StrictLinearOrder`,
`StrictTotalOrder`, `StrictPoset`, `Correspondence`, `Bounds`, `Lattices`,
`Completeness`, `Density`, `Directed`, `WellOrder`, `WellFounded`, and
`Examples`.

A coherent target map is:

| Topic | Concepts or packages |
|---|---|
| `OrderedSets` | `OrderRelation`, `Preorder`, `PartialOrder`, `StrictOrder`, `Poset`, `LinearOrder`, `WellOrder` |
| `Bounds` | `UpperBound`, `LowerBound`, `BoundedAbove`, `BoundedBelow`, `LeastElement`, `GreatestElement`, `MinimalElement`, `MaximalElement`, `Supremum`, `Infimum` |
| `Lattices` | `Join`, `Meet`, `Semilattice`, `Lattice`, `CompleteLattice` |
| `OrderProperties` | `DenseOrder`, `DirectedSet`, `Chain`, `WellFoundedRelation`, `CoverRelation` |
| `Constructions` | `DualOrder`, `StrictNonStrictCorrespondence`, and later suborders/products/lexicographic orders |
| `OrderMaps` | `Monotone`, `Antitone`, `OrderEmbedding`, `OrderIsomorphism` |

The exact topic names may be adjusted, but every public concept should have one
canonical owner. The volume root should import topic aggregates; topic
aggregates should import only concept `All.lean` modules.

### P1 — Mathlib interoperability has a viable path, but it is not public

There are two distinct interoperability questions.

**Using Mathlib sets.** The bound predicates are generic over `Membership`, so
they can already accept `Set α`. The pilot exercises this with `Set.Iic`,
`Set.Iio`, and `Set.univ`. This is a real path, not a structural blocker.
Production order theory should nevertheless include smoke theorems and named
equivalences for the standard Mathlib predicates:

- `UpperBound (· ≤ ·) s a ↔ a ∈ upperBounds s`;
- `LowerBound (· ≤ ·) s a ↔ a ∈ lowerBounds s`;
- `LeastElement (· ≤ ·) s a ↔ IsLeast s a`;
- `GreatestElement (· ≤ ·) s a ↔ IsGreatest s a`;
- `Supremum (· ≤ ·) s a ↔ IsLUB s a`;
- `Infimum (· ≤ ·) s a ↔ IsGLB s a`.

`BoundedAbove`, `BoundedBelow`, and two-sided `Bounded` are absent from the
production package even though the pilot already contains them. They should be
canonical concepts and should bridge to `BddAbove`/`BddBelow`.

**Letting Mathlib use an LRA order.**
[`LRA/Pilot/OrderBounds.lean`](LRA/Pilot/OrderBounds.lean) already contains the
right design pattern:

- `PosetFromPartialOrder` converts a Mathlib/Lean `_root_.PartialOrder` to an
  LRA `Poset`;
- `PartialOrderFromPoset` constructs `_root_.PartialOrder poset.Carrier`, which
  can be installed locally with `letI`.

These adapters are not imported by `LRA.VolumeI.Order`, so downstream Mathlib
cannot rely on them as production API. Promote reviewed versions into an
explicit interoperability/relationships module. Keep reverse adapters as
ordinary definitions used with local instances, not global instances, to
avoid instance loops and conflicting order structures. The existing
[`AlgebraicStructures/MathlibAdapters.lean`](LRA/VolumeI/AlgebraicStructures/MathlibAdapters.lean)
uses this safe pattern for `LinearOrder`, but it is based on a separate
certificate hierarchy rather than the definitions reviewed here. The two
order APIs need explicit equivalence/adaptation theorems or one canonical
ownership decision.

### P2 — The theorem surface is dominated by projections and duplicates

Several files named `Characterizations.lean` contain only one-way field
projections, not equivalent characterizations. Several `Theorems.lean` files
then restate those projections pointwise. For example:

- `PartialOrderIsReflexive` and `PartialOrderRelationIsReflexive` project the
  same axiom at two packaging levels;
- `NonStrictMutualRelationImpliesEqual` and
  `PartialOrderHasNoNontrivialTwoElementCycles` have the same statement;
- example theorems often merely project the law already stored in the example
  structure;
- the poset theorem file contains only reflexivity, antisymmetry, and
  transitivity in pointwise form.

These accessors are useful as API conveniences, but they are not a sufficient
study theorem set. `Characterizations.lean` should contain genuine `↔`
statements or equivalent axiom systems; routine projections can be generated
or kept near the definition. Preserve descriptive aliases only when they teach
a distinct interpretation.

The first useful theorem spine should include at least:

- uniqueness of least/greatest elements and of suprema/infima in a partial
  order;
- least implies minimal and greatest implies maximal, with converses under a
  linear order;
- maximum implies supremum and minimum implies infimum;
- monotonicity of bounds under subset inclusion;
- duality results for bounds, extrema, joins/meets, and completeness;
- strict/non-strict conversions for both partial and total orders;
- dual involution and order-preservation results;
- chains are directed in a non-strict order;
- well-founded induction and its relationship to the minimal-element
  principle;
- complete lattice implies lattice, and uniqueness/commutativity/idempotence
  consequences for joins and meets.

### P2 — Some statements are correct but unnecessarily restrictive or pedagogically misleading

- [`Correspondence.lean`](LRA/VolumeI/Order/Correspondence.lean) assumes a
  `StrictLinearOrder` for `StrictNonStrictInverseCorrespondence`. The equality
  only needs irreflexivity (and is naturally exposed for any `StrictOrder`).
  The stronger hypothesis excludes useful non-total strict orders.
- `StrictOrderIsAntisymmetric` is logically true because a strict order is
  asymmetric, but it risks teaching antisymmetry as a central strict-order
  law. Keep it as a secondary relation-theoretic consequence, not a headline
  characterization.
- `StrictLinearOrder` asks for exact trichotomy in addition to irreflexivity
  and transitivity. This is equivalent to the usual presentation, but stronger
  than needed at the raw axiom level because transitivity plus ordinary
  trichotomy already rules out overlapping alternatives. State and prove the
  equivalence between the standard presentations.
- `Directed` explicitly requires nonemptiness. This is a legitimate
  convention, but the convention should be prominent and paired with a
  theorem comparing it with a possibly-empty pairwise-directed predicate.
- `MinimalElement`/`MaximalElement` use a strict relation while most neighboring
  bound definitions use a non-strict relation. Both formulations are
  canonical; the API should name the polarity and prove equivalence through
  the strict-part construction.

### P2 — Positive examples do not yet teach the hierarchy

Natural-number `<` and `≤` are valid examples, but they are both total and do
not teach why partial orders matter. The useful divisibility example remains
in the flat [`Order/Examples.lean`](LRA/VolumeI/Order/Examples.lean) rather than
the appropriate concept packages.

Add a small, deliberate example matrix:

| Example | Concepts illustrated |
|---|---|
| equality on `Bool` | partial order, not total |
| divisibility on positive naturals (or a carefully chosen natural domain) | non-total partial order |
| subset inclusion on `Set α` | canonical set-based poset and Mathlib bridge |
| `Nat`/`Int` usual order | discrete linear orders; well-order only for `Nat` |
| `Rat` usual order | dense linear order, not complete |
| a finite powerset | bounded/distributive/complete lattice |
| universal relation on `Bool` | preorder not partial order |

Every negative row should state both the properties that hold and the exact
property that fails.

### P3 — Source traceability is too coarse for canonicalization

[`Sources.md`](LRA/VolumeI/Order/Sources.md) lists two appropriate textbooks,
but does not map definitions, conventions, or theorem selections to chapters
or sections. This matters where conventions differ: strict versus non-strict
orders, whether directed sets are nonempty, the meaning of dense order,
subset-minimal versus accessibility-based well-foundedness, and complete
versus conditionally complete orders.

Add section-level citations and a short conventions table before freezing the
public vocabulary.

## Confirmed sound components

Subject to the relation-polarity and backend qualifications above, the
following current statements have the standard mathematical content:

- `Preorder`: reflexive and transitive;
- `PartialOrder`: reflexive, antisymmetric, and transitive;
- `StrictOrder`: irreflexive and transitive (the usual strict partial order);
- `TotalOrder`/`LinearOrder`: partial order plus totality;
- `LessThanOrEqual`, `StrictPart`, and their partial-order correspondence;
- `UpperBound`, `LowerBound`, `LeastElement`, `GreatestElement`, `Supremum`,
  and `Infimum`;
- pairwise `Join`, `Meet`, and relational `Lattice`;
- the all-subsets relational form of `CompleteLattice`, when instantiated with
  the intended full subset backend;
- nonempty directed subset under a non-strict order;
- non-strict well-order as a total order in which every represented nonempty
  subset has a least element;
- the subset-minimal form of well-foundedness when the represented subset
  family is understood;
- strict/non-strict conversion and dual-order constructions.

The core also avoids unnecessary decidability and computational order
assumptions, which is appropriate for a mathematical development at this
level.

## Recommended implementation order

1. Correct density and chain before adding proofs; their present statements
   formalize the wrong concepts.
2. Decide and document strict/non-strict polarity for every order property.
3. Make ordinary `Set α` specializations canonical and keep backend-relative
   variants explicitly named.
4. Complete the `Order/<Topic>/<Concept>/` migration, assigning one owner to
   each declaration and removing duplicate representations or documenting
   their roles.
5. Rebuild failure modes as exact, locally paired witnesses proving both the
   surviving laws and the failed law.
6. Promote the pilot's local-instance mathlib adapters and add equivalences to
   Mathlib's bounds predicates.
7. Add the theorem spine and example matrix above.
8. Add section-level source/convention metadata, then freeze canonical names.

## Acceptance criteria for the next review

- No density predicate is applied directly to a reflexive order relation.
- Strict and non-strict chain definitions agree through a proved conversion.
- Canonical all-subset statements use `Set α`, with explicitly named transfer
  results for other set backends.
- Every failure predicate/witness is immediately paired with a theorem and
  each order axiom has an independence example.
- Every public order concept lives at `Order/<Topic>/<Concept>/...` and has a
  single canonical owner.
- Production modules demonstrate both `Set α` use and local conversion to/from
  Mathlib order classes.
- The theorem set contains derived results, not only projections of bundled
  fields.
- `lake build` succeeds; `sorry` remains acceptable during the design phase as
  requested.

## Verification note

The repository's literal `lake build` command currently reports that no
default targets are configured and performs no compilation. The explicit
Volume I gate `lake build LRAVolumeI` completed successfully (1270 jobs). Its
warnings were pre-existing `sorry`, linter, deprecation, and locally modified
dependency warnings; no build error was reported.
