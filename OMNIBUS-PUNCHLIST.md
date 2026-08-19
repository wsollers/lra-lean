# Omnibus Parity Punchlist

Source:
`FoundationsOfArithmeticAndAlgebraAnOmnibusOfOperationsLawsAndAxiomsInTheAxiomaticStyleOfLandau.txt`

Companion inventory:
`OMNIBUS-GAP-LIST.md`

This file is the issue-ready work order for bringing the Lean repository into
parity with the omnibus document. Each item is intended to become one GitHub
issue unless it is explicitly marked as a small follow-up under the same issue.

Proof policy: add formal statements first and use `sorry` unless a later issue
explicitly asks for proof completion.

Architectural policy: treat the omnibus as the cross-volume Landau spine, not
as a Volume I side project. Sets, relations, functions, operations, and laws
should become the reusable substrate for Volume II number-system constructions
and for later analysis/algebra volumes. Do not duplicate the same law separately
inside `N`, `Z`, `Q`, `R`, and `C` when it can be stated once abstractly and
then instantiated.

Representation policy: ordinary mathematical relations should remain
proof-friendly predicates in Lean, but every relation layer must keep the
set-of-tuples reading explicit. Concretely, use predicate relations such as
`alpha -> beta -> Prop` as the primary API, and provide bridge definitions and
theorems to `LRASet (alpha × beta)` / pair-set views where the text says
"relation is a set of ordered pairs." Functions should likewise have a
graph-based reading even when ordinary Lean functions are used for computation.

Dependency policy: before broad proof completion in Volume II or later volumes,
harden the Landau spine in this order: predicate-sets and products, relational
algebra, graph/function algebra, n-ary operations, operation laws, algebraic
structures, ordered algebra. Volume II instantiation files should consume this
spine rather than rebuilding it.

## Phase 0: Backlog And Governance Setup

- [ ] Create GitHub issues from this punchlist.
  - Home: GitHub issues.
  - Acceptance: every unchecked top-level task below has an issue number, and
    this file records those issue numbers beside the task titles.

- [ ] Add automatic `sorry` issue generation.
  - Home: `.github/workflows/` and `scripts/`.
  - Acceptance: CI can scan Lean files for new `sorry`s and open or update
    GitHub issues without manual issue creation.

- [ ] Decide omnibus numbering metadata convention.
  - Home: governance overlay and omnibus Lean files.
  - Acceptance: source-aligned declarations have comments such as
    `Omnibus: Chapter 1.2`, without forcing brittle numbering into Lean names.

## Phase 1: Volume I Sets

- [ ] Finish basic set law catalogue.
  - Home: `LRA/VolumeI/Set/Set.lean` or `LRA/VolumeI/Set/Laws.lean`.
  - Scope: subset reflexivity/transitivity/antisymmetry, union laws,
    intersection laws, empty/universal laws, complement laws, difference laws.
  - Acceptance: named PascalCase theorem statements exist and the Volume I
    build succeeds.

- [ ] Add De Morgan and indexed-family set laws.
  - Home: `LRA/VolumeI/Set/Laws.lean`.
  - Scope: finite and indexed union/intersection complement identities,
    monotonicity, absorption, distributivity.
  - Acceptance: theorem statements exist over `LRASet` and indexed families.

- [ ] Complete Cartesian product theorem catalogue.
  - Home: `LRA/VolumeI/Set/Products.lean` or `Products/Laws.lean`.
  - Scope: pair equality, product membership, product extensionality,
    product monotonicity, empty-product laws.
  - Acceptance: product layer has statements matching Chapter 0.1.

- [ ] Clarify tuple and finite power conventions.
  - Home: `LRA/VolumeI/Set/Products.lean`.
  - Scope: `S^0`, `S^n`, finite tuples, relation to existing `Tuple`.
  - Acceptance: reusable definitions exist for later n-ary relation and
    operation layers.

- [ ] Add set-of-tuples bridge conventions.
  - Home: `LRA/VolumeI/Set/Products.lean` and
    `LRA/VolumeI/Relations/RelationalAlgebra.lean`.
  - Scope: canonical pair-set view for binary relations, tuple-set view for
    n-ary relations, and extensional membership lemmas connecting predicates
    to tuple membership.
  - Acceptance: later relation/function files can say precisely how a
    predicate relation is "a set of ordered pairs" without changing the primary
    relation representation.

- [ ] Add set algebra and field-of-sets layer.
  - Home: `LRA/VolumeI/Set/Algebras.lean` and, where later-volume topology or
    measure material already owns the terminology,
    `LRA/VolumeIV/AlgebrasOfSets/Foundations/AlgebraOfSets.lean`.
  - Scope: set algebra over a universe, field of sets, closure under finite
    union/intersection/complement/difference, generated algebra placeholder,
    subalgebra, homomorphism of set algebras if needed.
  - Acceptance: finite Boolean set-operation structures have canonical Lean
    declarations before topology/measure chapters consume them.

- [ ] Clarify predicate-set versus ZFC set-object architecture before deep set proofs.
  - Home: `LRA/VolumeI/Set/Set.lean`, a future
    `LRA/VolumeI/Set/PredicateSet.lean`, `LRA/VolumeI/Set/ZFC/Model/`,
    and bridge files such as `LRA/VolumeI/Set/ZFC/Semantics/SetObjectBridge.lean`.
  - Problem: the current public `LRASet Alpha := Alpha -> Prop` is a
    predicate-set over a Lean carrier, not an object inside a `ZFCModel`.
    That is the right working surface for set algebra over an ambient carrier,
    but the name can be mistaken for the LRA-native ZFC set-object
    implementation analogous to a concrete number-system model.
  - Scope: decide whether to rename the current `LRASet` API to
    `PredicateSet` or equivalent; reserve `LRASet` for a later canonical
    set-object implementation if desired; add `ToPredicateSet` from
    `M.Domain`/`ModelSet M` to predicate-sets; and document that the reverse
    direction needs a set-existence theorem such as Separation, Pairing, Union,
    or Replacement rather than an arbitrary predicate.
  - ZFC bridge target: state model-internal existence theorems such as
    `UnionSetExists` and `BinaryUnionSetExists` from the ZFC axioms, then prove
    that any chosen witness maps through `ToPredicateSet` to the corresponding
    predicate-set union. Do the same later for bounded separation,
    intersections, relative complements, products, and indexed constructions.
  - Volume IV target: keep `SetAlgebra`/`AlgebraOfSets` as the consumer-facing
    structure used by topology, measure, and metric-space chapters; it should
    depend on the predicate-set law catalogue first, with optional ZFC-object
    realization theorems added as bridges rather than prerequisites.
  - Acceptance: proof work can proceed over predicate-sets without claiming
    every predicate is a ZFC set-object, and later ZFC/model bridges can reuse
    the same algebraic laws through `ToPredicateSet` instead of rewriting them.

- [ ] Add sigma-algebra compatibility bridge.
  - Home: `LRA/VolumeI/Set/Algebras.lean` or
    `LRA/VolumeIV/MeasureSpaces/Foundations/`.
  - Scope: distinguish finite set algebras from sigma-algebras, record that a
    sigma-algebra is a set algebra with countable-union closure, and align with
    Mathlib `MeasurableSpace` where later volumes use Mathlib.
  - Acceptance: measure-theory tags can point either to the finite algebra
    layer or to the sigma-algebra/measurable-space layer without ambiguity.

## Phase 2: Volume I Relations

- [ ] Add relational algebra API.
  - Home: `LRA/VolumeI/Relations/RelationalAlgebra.lean`.
  - Scope: empty relation, universal relation, union, intersection, difference,
    complement relative to a product, converse, composition, identity relation,
    domain, range, image, preimage, restriction.
  - Acceptance: each operation is defined on predicate relations and has a
    bridge statement to the corresponding set operation on pair-sets.

- [ ] Add missing named relation predicates.
  - Home: `LRA/VolumeI/Relations/Basic/Properties.lean`.
  - Scope: asymmetric, left-Euclidean, right-Euclidean, dense, well-founded,
    exact trichotomy.
  - Acceptance: definitions are available for homogeneous binary relations and
    use PascalCase source-facing names when appropriate.

- [ ] Add relation-property theorem catalogue.
  - Home: `LRA/VolumeI/Relations/Basic/Theorems.lean`.
  - Scope: asymmetry equivalences, irreflexive plus transitive implies
    asymmetric, reflexive plus transitive plus Euclidean consequences,
    trichotomy consequences.
  - Acceptance: statements cover omnibus Chapter 0.3 / Satz 0.8 style facts.

- [ ] Finish composite relation types.
  - Home: `LRA/VolumeI/Relations/Order/Laws.lean`.
  - Scope: strict total order, total preorder if needed, well-order,
    strict/non-strict correspondence.
  - Acceptance: order law bundles use named relation predicates directly.

- [ ] Add equivalence classes and partitions.
  - Home: `LRA/VolumeI/Relations/Equivalence/`.
  - Scope: equivalence class, quotient carrier placeholder if needed,
    partition, class membership laws, equivalence-relation/partition theorem.
  - Acceptance: Chapter 0.4 equivalence material has formal definitions and
    theorem statements.

- [ ] Add relation-as-set documentation tests.
  - Home: `LRA/VolumeI/Relations/Examples.lean` or lightweight theorem files.
  - Scope: examples showing relation union/intersection/composition as both
    predicate operations and operations on subsets of products.
  - Acceptance: future tags for "relation is a set" and "relational algebra"
    have stable Lean targets and examples.

## Phase 3: Volume I Map Layer

- [x] Create graph-based map definitions.
  - Home: `LRA/VolumeI/Map/Typed/`, `LRA/VolumeI/Map/Graph/`, and
    `LRA/VolumeI/Relations/`.
  - Scope: graph, domain, codomain, single-valuedness, totality, function from
    one carrier to another, and the bridge between graph relations and ordinary
    Lean functions.
  - Acceptance: functions are explicitly modeled as set-like graphs without
    hiding that they are constructed from relations.

- [x] Add image, preimage, and fiber definitions.
  - Home: `LRA/VolumeI/Map/Image/`, `LRA/VolumeI/Map/Preimage/`, and
    `LRA/VolumeI/Map/Fiber/`.
  - Scope: image of a set, preimage of a set, fibers of values.
  - Acceptance: later injective/surjective/bijective definitions can use these.

- [x] Add injective, surjective, bijective, and inverse definitions.
  - Home: `LRA/VolumeI/Map/Injective/`, `Surjective/`, `Bijective/`, and
    `Inverse/`.
  - Scope: fiber-based injectivity, surjectivity, bijectivity, inverse relation,
    inverse function when bijective.
  - Acceptance: theorem statements include inverse uniqueness and basic
    round-trip laws.

- [x] Add composition, identity, restriction, and extension.
  - Home: `LRA/VolumeI/Map/Composition/`, `Identity/`, `Restriction/`,
    `Extension/`, `Section/`, and `Retraction/`.
  - Scope: identity function, composition, associativity, left/right identity,
    restriction, extension, graph-of-composite, graph-of-restriction.
  - Acceptance: reusable function algebra exists before algebraic structures
    consume it.

- [x] Add image/preimage set-operation laws.
  - Home: `LRA/VolumeI/Map/Image/Theorems.lean` and
    `LRA/VolumeI/Map/Preimage/Theorems.lean`.
  - Scope: image/preimage union, intersection, difference, complement,
    monotonicity, round-trip laws.
  - Acceptance: omnibus Chapter 0A and law catalogue L29-L34 are represented.

## Phase 4: Volume I Operations

- [ ] Add general n-ary relation and operation layer.
  - Home: `LRA/VolumeI/Relations/Basic/Relations.lean` and
    `LRA/VolumeI/Operations/Operations.lean`.
  - Scope: arity-indexed relations and operations over finite powers, with
    nullary operations as distinguished elements and binary operations as
    ordinary functions on products.
  - Acceptance: unary/binary definitions remain simple special cases or
    documented aliases.

- [ ] Add cancellation and elementwise laws.
  - Home: `LRA/VolumeI/Operations/Laws.lean`.
  - Scope: left/right cancellation, elementwise idempotence, elementwise
    inverse relation, uniqueness of identity, uniqueness of inverse,
    uniqueness of absorbing element.
  - Acceptance: Chapter 1.2 through 1.6 has named theorem statements.

- [ ] Add left/right law collapse theorems.
  - Home: `LRA/VolumeI/Operations/Laws.lean`.
  - Scope: commutativity turns left identity into right identity, left
    absorbing into right absorbing, left inverse into right inverse, and
    left cancellation into right cancellation where appropriate.
  - Acceptance: Chapter 1.7 has theorem statements.

- [ ] Add divisibility relation induced by a monoid.
  - Home: `LRA/VolumeI/Operations/Divisibility.lean`.
  - Scope: divisibility, unit equivalence, preorder-like properties under the
    needed hypotheses.
  - Acceptance: omnibus induced divisibility preorder material is represented.

## Phase 5: Algebraic Structures

- [ ] Normalize `Structures` versus `UniversalAlgebra/Models/AbstractLaws`.
  - Home: `LRA/VolumeI/AlgebraicStructures/` and
    `LRA/VolumeI/UniversalAlgebra/Models/AbstractLaws.lean`.
  - Scope: decide which files define structures, which files define law
    bundles, which files define first-order model signatures, and which files
    are only number-system instantiation ledgers.
  - Acceptance: README or module comments explain the distinction and no
    duplicate hierarchy names compete.

- [ ] Make abstract structures the canonical source of reusable laws.
  - Home: `LRA/VolumeI/AlgebraicStructures/` and `LRA/VolumeI/UniversalAlgebra/`.
  - Scope: semigroup, monoid, group, abelian group, ring, integral domain,
    field, ordered group, ordered ring, ordered field are stated once over an
    arbitrary carrier and operation data.
  - Acceptance: Volume II files reference or instantiate these structures
    rather than restating the same laws ad hoc.

- [ ] Add Boolean algebra hierarchy.
  - Home: `LRA/VolumeI/AlgebraicStructures/BooleanAlgebra.lean`.
  - Scope: bounded distributive lattice, complement operation, Boolean algebra
    laws, Boolean ring bridge if useful, homomorphisms and subalgebras if
    needed by later chapters.
  - Acceptance: propositional logic, set algebras, and algebra-of-sets chapters
    have one canonical Boolean-algebra target.

- [ ] Prove or state set algebras instantiate Boolean algebras.
  - Home: `LRA/VolumeI/Set/Algebras.lean` and
    `LRA/VolumeI/AlgebraicStructures/BooleanAlgebra.lean`.
  - Scope: union as join, intersection as meet, complement as Boolean
    complement, empty set as bottom, universe as top, difference as derived
    meet-with-complement.
  - Acceptance: the powerset of a carrier and every set algebra/field of sets
    has a documented Boolean-algebra instance or theorem statement.

- [ ] Fill basic algebra hierarchy variants.
  - Home: `LRA/VolumeI/AlgebraicStructures/Elementary/` and
    `LRA/VolumeI/AlgebraicStructures/RingLike/`.
  - Scope: commutative semigroup, abelian group, ring with unity, commutative
    ring, nontrivial ring, integral domain, field.
  - Acceptance: Chapter 3 hierarchy can be stated without importing Volume II.

- [ ] Add two-operation law catalogue.
  - Home: `LRA/VolumeI/Operations/TwoOperations.lean`.
  - Scope: left/right/two-sided distributivity, equivalence under commutative
    multiplication, zero absorption from distributivity hypotheses, abstract
    law of signs, zero has no inverse in a nontrivial structure.
  - Acceptance: Chapter 2 theorem statements exist generically.

## Phase 6: Ordered Algebra

- [ ] Centralize derived order relations.
  - Home: `LRA/VolumeI/Relations/Order/Derived.lean`.
  - Scope: derive `>`, `<=`, `>=` from `<` and connect strict/non-strict laws.
  - Acceptance: later ordered structures do not redefine these ad hoc.

- [ ] Add ordered group theorem catalogue.
  - Home: `LRA/VolumeI/AlgebraicStructures/Ordered/OrderedGroup.lean`.
  - Scope: translation invariance, adding inequalities, sign of negatives,
    compatibility with subtraction.
  - Acceptance: Chapter 4 ordered group material has generic statements.

- [ ] Add ordered ring and field theorem catalogue.
  - Home: `LRA/VolumeI/AlgebraicStructures/Ordered/OrderedRing.lean` and
    `LRA/VolumeI/AlgebraicStructures/Ordered/OrderedField.lean`.
  - Scope: sign rules, products of positives/negatives, multiplying
    inequalities by positive or negative elements, no compatible ordered field
    structure on complex numbers as a later instantiation statement.
  - Acceptance: Chapter 4 ordered ring/field material has generic statements.

## Phase 7: Absolute Value, Subtraction, Division, Powers

- [ ] Add abstract absolute-value layer.
  - Home: `LRA/VolumeI/AlgebraicStructures/Ordered/AbsoluteValue.lean`.
  - Scope: absolute value operation on ordered algebraic structures,
    nonnegativity, zero iff zero, negation invariance, multiplicativity,
    triangle inequality, reverse triangle inequality.
  - Acceptance: Chapter 5 is represented by definitions and theorem statements.

- [ ] Add subtraction and division as inverse-operation layers.
  - Home: `LRA/VolumeI/Operations/Subtraction.lean` and
    `LRA/VolumeI/Operations/Division.lean`.
  - Scope: subtraction as additive inverse operation, division as partial
    multiplicative inverse operation, cancellation, division by zero impossible.
  - Acceptance: Chapter 6 generic statements exist.

- [ ] Add monoid exponentiation layer.
  - Home: `LRA/VolumeI/Operations/Exponentiation.lean`.
  - Scope: natural powers in a monoid, zero power, successor power,
    product-of-powers, power-of-power.
  - Acceptance: Chapter 7 natural exponent laws are represented.

- [ ] Add integer exponent layer.
  - Home: `LRA/VolumeI/Operations/IntegerExponentiation.lean`.
  - Scope: powers of invertible elements, negative exponents, integer exponent
    laws.
  - Acceptance: Chapter 7 integer exponent material is represented.

## Phase 8: Floor And Ceiling

- [ ] Add Archimedean ordered-field abstraction for floor work.
  - Home: `LRA/VolumeI/AlgebraicStructures/Ordered/Archimedean.lean`.
  - Scope: embedded integers, Archimedean property, integer cofinality.
  - Acceptance: floor/ceiling files can state existence without importing
    Volume II constructions.

- [ ] Add floor and ceiling definitions and laws.
  - Home: `LRA/VolumeI/AlgebraicStructures/Ordered/FloorCeiling.lean`.
  - Scope: existence, uniqueness, floor, ceiling, ceiling duality,
    idempotence, monotonicity, integer shifts, floor sum bounds, fractional
    part.
  - Acceptance: Chapter 8 theorem statements exist.

## Phase 9: Volume II Basic Arithmetic

- [ ] Reframe Volume II as instantiation of the Landau spine.
  - Home: `LRA/VolumeII/` module comments and instantiation files.
  - Scope: `N`, `W`, `Z`, `Q`, `R`, and `C` should be presented as concrete
    or switched instances of the abstract relation/function/operation/algebra
    hierarchy.
  - Acceptance: each number-system construction has a documented route from
    construction data to the relevant abstract structure.

- [ ] Keep the initial basic arithmetic section statement-only.
  - Home: `LRA/VolumeII/BasicArithmetic/`.
  - Scope: algebraic identities, parity, fractions, multiplicative inverses,
    examples/tests in separate files.
  - Acceptance: theorem statements use active number-system switches and proofs
    remain `sorry` unless a proof issue explicitly requests completion.

- [ ] Add more Lang-style arithmetic facts.
  - Home: `LRA/VolumeII/BasicArithmetic/`.
  - Scope: parity multiplication, divisibility basics, prime/composite
    vocabulary, simple square and factorization identities, fraction sign
    rules.
  - Acceptance: statements are grouped by topic and examples stay outside
    implementation files.

- [ ] Decide whether `BasicArithmetic` may import Mathlib directly.
  - Home: governance overlay and `lakefile.lean` comment.
  - Scope: resolve the current tension between Mathlib-free construction
    modules and proof-working sections that use active Mathlib-backed switches.
  - Acceptance: policy is explicit and build comments match governance.

## Phase 10: Law Catalogue

- [ ] Create omnibus law catalogue module.
  - Home: `LRA/VolumeI/AlgebraicStructures/LawCatalogue.lean`.
  - Scope: declarations or re-exported aliases for L0-L34.
  - Acceptance: every L-number has a stable Lean declaration or documented
    pointer to its canonical declaration.

- [ ] Add catalogue coverage tests.
  - Home: `scripts/` or lightweight Lean examples.
  - Scope: grep or Lean import check that every catalogue label resolves.
  - Acceptance: CI fails if a catalogue label silently disappears.

## Phase 11: Number-System Instantiation Ledger

- [ ] Add `N` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/NaturalNumbers/Instantiation.lean`.
  - Scope: semigroup, monoid, ordered semiring-style properties, recursion and
    induction interfaces, not group.
  - Acceptance: active switch and custom construction status are both recorded.

- [ ] Add `W` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/WholeNumbers/Instantiation.lean`.
  - Scope: relationship to `N`, additive/multiplicative structure,
    order properties.
  - Acceptance: dependency on `N` is explicit and documented.

- [ ] Add `Z` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/Integers/Instantiation.lean`.
  - Scope: commutative ring with unity, integral domain, ordered ring, not
    field.
  - Acceptance: active `Int` switch statements compile with `sorry`s.

- [ ] Add `Q` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/RationalNumbers/Instantiation.lean`.
  - Scope: ordered field, Archimedean ordered field, not complete.
  - Acceptance: active `Rat` switch statements compile with `sorry`s.

- [ ] Add `R` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/RealNumbers/Instantiation.lean`.
  - Scope: complete Archimedean ordered field, uniqueness/isomorphism target
    against Mathlib `Real`.
  - Acceptance: active `Real` switch statements compile with `sorry`s.

- [ ] Add `C` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/ComplexNumbers/Instantiation.lean`.
  - Scope: field, algebraically closed field placeholder, no compatible order
    statement.
  - Acceptance: active `Complex` switch statements compile with `sorry`s.

## Phase 12: Validation And Cleanup

- [ ] Audit and relocate obsolete model/construction cruft.
  - Home: `LRA/VolumeII/` and `LRA/VolumeI/UniversalAlgebra/Models/`.
  - Scope: distinguish first-order model theory, algebraic structure models,
    number-system construction models, and instantiation ledgers; delete or
    relocate duplicate files only after replacements exist.
  - Acceptance: no duplicate or stale model layer remains, and remaining model
    files have clear ownership comments.

- [ ] Add omnibus extraction inventory.
  - Home: `scripts/` and generated report ignored or checked in by policy.
  - Scope: list omnibus declarations, proof status, issue number, and source
    chapter.
  - Acceptance: one command reports parity progress.

- [ ] Run full Lean validation.
  - Home: build tooling.
  - Scope: `.\build.ps1 build-all` or documented equivalent.
  - Acceptance: active Lean libraries build, with expected `sorry` warnings
    only.
