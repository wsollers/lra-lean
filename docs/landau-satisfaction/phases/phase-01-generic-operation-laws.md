# Phase 1 - Generic Operation Laws

Updated: 2026-08-30

## Objective

Define the canonical law predicates and law-bridge rules that generic operators
must satisfy before operator-specific realizations are introduced. This phase
exists because `Addition` and `Multiplication` should not invent their own law
vocabulary; they must discharge a pre-existing generic law surface one law at a
time.

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/foundations/06-operations.md`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/foundations/06b-model-theory-boundary.md`
- `docs/foundations/16-landau-cert-naming-history.md`
- `LANDAU-SATISFACTION-PLAN.md`

## Placement Contract

Phase 1 owns the generic operation-law layer. It may clarify or extend the
bridging surfaces under:

- `LRA/Operation/Laws/*`
- `LRA/AlgebraicStructures/*/Laws/*`
- `LRA/UniversalAlgebra/Satisfaction/*`

It does not yet create `Addition` / `Multiplication` realization scaffolding
unless needed for a minimal example of how the law layer is consumed.

## Required Outcomes

- A fixed list of generic operator laws that the new operator layer is expected
  to discharge individually.
- A placement rule for each law:
  - canonical predicate owner
  - operator-specific bridge location
  - structure-level consumer location
  - UA restatement location
- An explicit rule for which law families are equational and which are not.
- An explicit statement that these laws are predicates on operator data and that
  later operator realizations must export proofs discharging them.

## Law Form

The law layer should be treated as a predicate layer over operations.

- Unary-operator laws are predicates on one operation witness.
- Mixed-operator laws are predicates on a pair of operation witnesses.
- The operator phases must not invent a second law vocabulary or a competing
  notion of satisfaction.
- The discharge contract is: a realized operator artifact exports proofs of the
  canonical predicates that apply to it.

Examples:

- associativity is a predicate on one binary operation
- commutativity is a predicate on one binary operation
- identity is a predicate on one operation together with a designated element
- distributivity is a predicate on an addition witness and a multiplication
  witness together

## Canonical Law Families In Scope

- associative
- commutative
- identity
- inverse
- distributive
- absorbing
- idempotent
- closure
- quotient compatibility

Out-of-scope for `Cert_*` unless later decided otherwise:

- cancellation
- trichotomy
- order compatibility
- dense order
- completeness

These may still be required by structures or subjects, but they should not be
mixed into the equational cert vocabulary without an explicit decision.

## Law Ownership Table

| Law family | Shape | Canonical predicate owner | Primary structure-level consumer | UA restatement status | Phase 2 discharge target |
|---|---|---|---|---|---|
| associative | unary | `LRA/Operation/Laws/Associative/Definition.lean` (`Associative`) | `LRA/AlgebraicStructures/AdditiveSemigroup/Laws/Definition.lean`, `LRA/AlgebraicStructures/Semigroup/Interface/Laws/Definition.lean` | no dedicated operator-law bridge recorded in this plan yet | `Addition/Laws.lean`, `Multiplication/Laws.lean` |
| commutative | unary | `LRA/Operation/Laws/Commutative/Definition.lean` (`Commutative`) | `LRA/AlgebraicStructures/AdditiveCommutativeSemigroup/Laws/Definition.lean`, `LRA/AlgebraicStructures/CommutativeSemigroup/Interface/Laws/Definition.lean` | no dedicated operator-law bridge recorded in this plan yet | `Addition/Laws.lean`, `Multiplication/Laws.lean` |
| identity | unary with designated element | `LRA/Operation/Laws/Identity/Definition.lean` (`LeftIdentity`, `RightIdentity`, `TwoSidedIdentity`) | `LRA/AlgebraicStructures/AdditiveMonoid/Interface/Laws/Definition.lean`, `LRA/AlgebraicStructures/Monoid/Interface/Laws/Definition.lean` | equational in principle; no dedicated bridge file recorded yet | `Addition/Laws.lean`, `Multiplication/Laws.lean` |
| inverse | unary with designated identity and inverse witness | `LRA/Operation/Laws/Inverse/Definition.lean` (`LeftInverse`, `RightInverse`, `TwoSidedInverse`, related predicates) | `LRA/AlgebraicStructures/AdditiveGroup/Interface/Laws/Definition.lean`, `LRA/AlgebraicStructures/DivisionRing/Laws/Definition.lean`, `LRA/AlgebraicStructures/Group/Interface/Laws/Definition.lean` | partially equational depending on chosen witness; no dedicated bridge file recorded yet | `Addition/Laws.lean` for additive inverse, `Multiplication/Laws.lean` for multiplicative inverse |
| distributive | mixed | `LRA/Operation/Laws/Distributive/Definition.lean` (`LeftDistributive`, `RightDistributive`, `TwoSidedDistributive`) | `LRA/AlgebraicStructures/Semiring/Laws/Distributive.lean` | equational in principle; no dedicated bridge file recorded yet | deferred to later arithmetic bridge phase |
| absorbing | unary with designated absorber | `LRA/Operation/Laws/Absorbing/Definition.lean` (`LeftAbsorbing`, `RightAbsorbing`, `TwoSidedAbsorbing`) | `LRA/AlgebraicStructures/Semiring/Laws/Definition.lean` (`ZeroAbsorbingLaws`) | equational in principle; no dedicated bridge file recorded yet | `Multiplication/Laws.lean` when an absorber witness is part of the unary multiplication package; mixed zero-linking remains deferred |
| idempotent | unary | `LRA/Operation/Laws/Idempotent/Definition.lean` (`Idempotent`) | no single scalar-chain consumer is fixed yet; likely later lattice / special-purpose consumers | equational in principle; no dedicated bridge file recorded yet | operator-local `Laws.lean` only when a concrete consumer is in scope |
| closure | unary or mixed, homogeneous or heterogeneous | `LRA/Operation/Laws/Closure/Definition.lean` (`UnaryClosedUnder`, `BinaryClosedUnder`, `BinaryEndoClosedOn`) | typically consumed by operator and subject realization layers before structure bundling | not an equation law in the same sense; no UA bridge expected by default | `Addition/Existence.lean`, `Multiplication/Existence.lean`, and related realization files |
| quotient compatibility | unary or mixed transport predicate | `LRA/Operation/Laws/QuotientCompatible/Definition.lean` (`BinaryOperationIsProper`, related induced-operation theorems) | quotient-based constructions and later UA transport work | transport-facing, not a direct equation law | only when an operator realization is quotient-derived |

## Law Table Notes

- `associative`, `commutative`, `identity`, `inverse`, `distributive`,
  `absorbing`, and `idempotent` are all predicates on operation witnesses.
- `distributive` is intentionally deferred to a later arithmetic bridge phase
  because it depends on both unary operator realizations already existing.
- `closure` is a prerequisite-style predicate for constructing an operation on a
  carrier, not a structure cert in the same sense as associativity.
- `quotient compatibility` is a transport-enabling correctness predicate and
  should only be required for quotient-derived realizations.
- `involution` is not listed here as a primitive Phase 1 law. For inverse-based
  arithmetic structures it should be treated as a later derived theorem.

## Phase 1 Classification Table

| Law family | Classification | Equational status | Phase status | Notes |
|---|---|---|---|---|
| associative | unary operator law | equational | required in Phase 2 where the operator claims associativity | applies separately to addition and multiplication |
| commutative | unary operator law | equational | required in Phase 2 only for operator packages that claim commutativity | addition usually yes; multiplication depends on target family |
| identity | unary operator law with witness | equational | required in Phase 2 when the operator package includes a designated identity | separate left/right and bundled two-sided forms already exist |
| inverse | unary operator law with witness | equational after choosing identity and inverse witness | deferred unless the operator package is intended to include inverse structure in Phase 2 | group/ring/field level consumers need this later |
| involution | derived unary theorem | derived from inverse package, not primitive here | deferred | should be proved later rather than axiomatized here for the arithmetic chain |
| distributive | mixed operator law | equational | deferred to arithmetic bridge phase | requires both addition and multiplication realizations |
| absorbing | unary operator law with witness | equational | deferred except where a unary multiplication package explicitly carries an absorber witness | additive-zero linkage is mixed and therefore later |
| idempotent | unary operator law | equational | deferred unless a concrete consumer is in scope | relevant outside the main scalar chain |
| closure | realization prerequisite | not an equational cert in the same sense | required in Phase 2 existence / realization files | supports construction of the operator on the carrier |
| quotient compatibility | transport predicate | not a direct equation cert | deferred unless the realization is quotient-derived | supports induced operations on quotients |
| cancellation | unary operator predicate | quasi-equational | out of core cert scope; later if needed | predicate exists already but is not part of the equational cert core |

## Execution Checklist

### 1. Freeze the law inventory

- [x] Enumerate the exact law families the new generic operator layer must be
  able to discharge.
- [x] Mark which law families are unary-operator, binary-operator, or
  multi-operator obligations.
- [x] Mark which law families are equational and which are implication-shaped
  or relation-shaped.
- [x] Confirm or revise the `Law Ownership Table` above against the intended
  first operator consumers.

Success criteria:
- The inventory is fixed enough that `Addition/Laws.lean` and
  `Multiplication/Laws.lean` can target it without redefining it.

### 2. Record canonical law ownership

- [x] For each in-scope law family, record the owning file under
  `LRA/Operation/Laws/*`.
- [x] Record whether `LRA/AlgebraicStructures/*` already packages that law in a
  way later phases should consume directly.
- [x] Record where UA equation-level restatements already exist and where they
  are still missing.
- [x] Treat the `Law Ownership Table` above as the current baseline and update
  it when a more precise consumer or bridge target is identified.

Success criteria:
- Later phases have an unambiguous import target for each law.

### 3. Define operator-law bridge rules

- [x] State how `Addition/Laws.lean` is allowed to expose associative,
  commutative, identity, and related evidence without becoming a duplicate law
  owner.
- [x] State the corresponding rule for `Multiplication/Laws.lean`.
- [x] State how binary-law bridges such as distributivity should be owned when
  they mention both addition and multiplication.

Required rule:
- binary-law ownership must be decided before Phase 2 starts, so that
  distributive results do not end up duplicated under both operators.
- unary-law discharge must be phrased as proof export of canonical predicates,
  not as new definitions.

### 4. Decide the binary-law placement

- [x] Defer mixed-operator bridges such as distributivity to a later arithmetic
  bridge phase after unary operator realizations exist.
- [x] Record the decision in `DECISIONS.md`.

Recommendation:
- use a shared arithmetic bridge file in the later arithmetic bridge phase if
  distributivity and similar mixed laws would otherwise force asymmetric
  ownership.

### 5. Define the discharge contract for later operator phases

- [x] State that `Addition` must discharge its required laws individually.
- [x] State that `Multiplication` must discharge its required laws individually.
- [x] State that structure bundles consume the resulting evidence only by
  conjunction, not by restating proofs.
- [x] State that law discharge means exporting proofs of predicates on the
  realized operations, one law at a time.

Success criteria:
- Phase 2 can be expressed as “create the operator artifacts and discharge these
  named law obligations.”

### 6. Record resumable progress

- [x] Update `docs/landau-satisfaction/status.md`.
- [x] Update `docs/landau-satisfaction/ledger.json`.
- [x] Record blocked decisions in `DECISIONS.md`.

## Deliverables

Phase 1 is complete only when all of the following are true:

- the generic law inventory is frozen
- canonical law ownership is recorded
- mixed-law deferral and later placement policy are decided
- the discharge contract for Phase 2 is explicit

## Build Gates

Run after each Lean change block if code is touched:

- `lake build LRA.Operation.Laws`
- `lake build LRA.AlgebraicStructures`
- `lake build LRA.UniversalAlgebra`

Run at phase completion if code is touched:

- `lake build`

If the phase remains documentation-only, no build gate is required.

## Out of Scope

- Full `Addition` / `Multiplication` operator scaffolding
- Subject-specific realization proofs
- Concrete number-system cert population
