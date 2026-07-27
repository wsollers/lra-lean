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

## Phase 2: Volume I Relations

- [ ] Add missing named relation predicates.
  - Home: `LRA/VolumeI/Relations/NamedRelations.lean`.
  - Scope: asymmetric, left-Euclidean, right-Euclidean, dense, well-founded,
    exact trichotomy.
  - Acceptance: definitions are available for homogeneous binary relations and
    use PascalCase source-facing names when appropriate.

- [ ] Add relation-property theorem catalogue.
  - Home: `LRA/VolumeI/Relations/Laws.lean`.
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
  - Home: `LRA/VolumeI/Relations/Equivalence.lean`.
  - Scope: equivalence class, quotient carrier placeholder if needed,
    partition, class membership laws, equivalence-relation/partition theorem.
  - Acceptance: Chapter 0.4 equivalence material has formal definitions and
    theorem statements.

## Phase 3: Volume I Function Layer

- [ ] Create graph-based function definitions.
  - Home: `LRA/VolumeI/Functions/Functions.lean`.
  - Scope: graph, domain, codomain, single-valuedness, totality, function from
    one carrier to another.
  - Acceptance: functions are explicitly modeled as set-like graphs without
    hiding that they are constructed from relations.

- [ ] Add image, preimage, and fiber definitions.
  - Home: `LRA/VolumeI/Functions/ImagePreimage.lean`.
  - Scope: image of a set, preimage of a set, fibers of values.
  - Acceptance: later injective/surjective/bijective definitions can use these.

- [ ] Add injective, surjective, bijective, and inverse definitions.
  - Home: `LRA/VolumeI/Functions/Bijections.lean`.
  - Scope: fiber-based injectivity, surjectivity, bijectivity, inverse relation,
    inverse function when bijective.
  - Acceptance: theorem statements include inverse uniqueness and basic
    round-trip laws.

- [ ] Add composition, identity, restriction, and extension.
  - Home: `LRA/VolumeI/Functions/Composition.lean`.
  - Scope: identity function, composition, associativity, left/right identity,
    restriction, extension.
  - Acceptance: reusable function algebra exists before algebraic structures
    consume it.

- [ ] Add image/preimage set-operation laws.
  - Home: `LRA/VolumeI/Functions/Laws.lean`.
  - Scope: image/preimage union, intersection, difference, complement,
    monotonicity, round-trip laws.
  - Acceptance: omnibus Chapter 0A and law catalogue L29-L34 are represented.

## Phase 4: Volume I Operations

- [ ] Add general n-ary relation and operation layer.
  - Home: `LRA/VolumeI/Relations/Relations.lean` and
    `LRA/VolumeI/Operations/Operations.lean`.
  - Scope: arity-indexed relations and operations over finite powers.
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

- [ ] Normalize `Structures` versus `Algebra/Models/AbstractLaws`.
  - Home: `LRA/VolumeI/Structures/Structures.lean` and
    `LRA/VolumeI/Algebra/Models/AbstractLaws.lean`.
  - Scope: decide which files define structures, which files define law
    bundles, and which files define first-order model signatures.
  - Acceptance: README or module comments explain the distinction and no
    duplicate hierarchy names compete.

- [ ] Fill basic algebra hierarchy variants.
  - Home: `LRA/VolumeI/Structures/Structures.lean`.
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
  - Home: `LRA/VolumeI/Structures/OrderedGroup.lean`.
  - Scope: translation invariance, adding inequalities, sign of negatives,
    compatibility with subtraction.
  - Acceptance: Chapter 4 ordered group material has generic statements.

- [ ] Add ordered ring and field theorem catalogue.
  - Home: `LRA/VolumeI/Structures/OrderedRing.lean`.
  - Scope: sign rules, products of positives/negatives, multiplying
    inequalities by positive or negative elements, no compatible ordered field
    structure on complex numbers as a later instantiation statement.
  - Acceptance: Chapter 4 ordered ring/field material has generic statements.

## Phase 7: Absolute Value, Subtraction, Division, Powers

- [ ] Add abstract absolute-value layer.
  - Home: `LRA/VolumeI/Structures/AbsoluteValue.lean`.
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
  - Home: `LRA/VolumeI/Structures/Archimedean.lean`.
  - Scope: embedded integers, Archimedean property, integer cofinality.
  - Acceptance: floor/ceiling files can state existence without importing
    Volume II constructions.

- [ ] Add floor and ceiling definitions and laws.
  - Home: `LRA/VolumeI/Structures/FloorCeiling.lean`.
  - Scope: existence, uniqueness, floor, ceiling, ceiling duality,
    idempotence, monotonicity, integer shifts, floor sum bounds, fractional
    part.
  - Acceptance: Chapter 8 theorem statements exist.

## Phase 9: Volume II Basic Arithmetic

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
  - Home: `LRA/VolumeI/Algebra/LawCatalogue.lean`.
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
  - Scope: semigroup, monoid, ordered semiring-style properties, not group.
  - Acceptance: active switch and custom construction status are both recorded.

- [ ] Add `W` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/WholeNumbers/Instantiation.lean`.
  - Scope: relationship to `N`, additive/multiplicative structure,
    order properties.
  - Acceptance: dependency on `N` is explicit and documented.

- [ ] Add `Z` hierarchy instantiation statements.
  - Home: `LRA/VolumeII/IntegerNumbers/Instantiation.lean`.
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

- [ ] Remove or relocate obsolete Volume II model cruft.
  - Home: `LRA/VolumeII/` and `LRA/VolumeI/Algebra/Models/`.
  - Scope: delete duplicate model files only after replacement Volume I model
    builders and Volume II instantiation ledgers exist.
  - Acceptance: no duplicate or stale model layer remains.

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
