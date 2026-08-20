# LRA.NumberSystems.NaturalNumbers — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../../ProofOrderNotation.md).

## Narrative order

Four constructions, all written *generically* against
`PeanoSystem Element SetObject [Membership Element SetObject]` — the same
interface, unparameterized by backend. What differs per construction is
which concrete `Element`/`SetObject` pair gets plugged in, and how the
three Peano law fields (`one_not_successor`, `successor_injective`,
`induction`) get discharged:

| Construction | `Element` / `SetObject` | How the Peano laws are discharged |
|---|---|---|
| `VonNeumann` | `{x : ZFCSet // x ∈ Omega}` / `ZFCSet` | proved as theorems, from `LRA.Set.ZFC`'s axioms |
| `Landau` | a bare postulated `LandauElement` / `PredicateSet LandauElement` | postulated directly as `axiom`s, mirroring `ZFCSet`'s own postulation |
| `Presburger` | a fresh inductive `PresburgerElement` / `PredicateSet PresburgerElement` | proved as theorems, free via the inductive type's own generated recursor/injectivity/no-confusion |
| `WholeNumbers` | `Option Element` / `PredicateSet (Option Element)`, generic over any one-based model | proved as theorems, by adjoining a new zero (`none`) to whatever one-based system is passed in |

All four end up as values of the same `PeanoSystem Element SetObject`
type for different `Element`/`SetObject` choices — why
`PeanoSystem.Categoricity.UniquenessOfPeanoSystemsUpToIsomorphism` (owned
by the `PeanoSystem` subject, not this one) matters: it ties all four
together as "the same" natural numbers rather than four unrelated claims
sharing a name. `WholeNumbers` reads as a fourth construction of the
naturals themselves (adjoining a zero to a one-based model, the same move
`VonNeumann`/`Presburger` make by different techniques), not a new rung on
the embedding chain, which is why it lives here rather than as its own
top-level system.

`Landau`'s three base Peano properties (`LandauBaseNotSuccessor`,
`LandauSuccessorInjective`, `LandauInduction`) are genuine `axiom`
declarations by design, not proof obligations — not tracked below, the
same way `ZFCSet`'s own postulation isn't.

`VonNeumann`'s proof order additionally depends on two prerequisites
outside this subject entirely, owned by `LRA.Set` (not yet audited for its
own `ProofOrder.md`): `LRA.Set.ZFC.SeparatedSubsetExists` (needed to carve
ω out of an Infinity witness) and `LRA.Set.ZFC.NoSetIsMemberOfItself`/
`FoundationWitnessExists` (needed to rule out a 2-cycle in successor-
injectivity). Both are still `sorry` as of this pass; `VonNeumann`'s own
entries below are ordered Carrier before WellFoundedness regardless, since
that dependency is external to this subject's own proof order.

`Landau`'s and `Presburger`'s arithmetic operations (`LandauAddition`/
`LandauMultiplication`/`LandauExponentiation`, `PresburgerAddition`) are
all built via `Classical.choose`/`choose_spec` over
`LRA.NumberSystems.PeanoSystem.Recursion.BinaryIterator`'s
`ExistenceOfBinaryIteratorOperation`/`BinaryIteratorOperationWellDefined`
— both `sorry`, in the separate `PeanoSystem` subject. **Every theorem
built on them below is therefore `PENDING`, including several whose own
proof term contains no literal `sorry`** (e.g. `LandauAdditionClauses :=
Classical.choose_spec (ExistenceOfBinaryIteratorOperation ...)`): the
argument passed to `choose_spec` is itself an incomplete proof term, so
the axiom closure carries `sorryAx` transitively. This is the load-bearing
reason this repo's policy requires the axiom-closure check rather than a
textual `sorry` scan — confirmed by direct trace here, not assumed.

## Per-theorem ledger

Every entry not covered by the transitive note above has a proof body
that is the single tactic `sorry` with no intermediate lemmas, so for
those a textual read and an axiom-closure check agree exactly. Re-derive
via `scripts/GenerateProofOrderManifest.lean` once a Lean toolchain is
available, rather than trusting this by-eye pass (including its
dependency trace through `BinaryIterator.lean`) for any future edit to
this subject.

### `Constructions/VonNeumann/Carrier.lean`

#### TheInfinityWitnessIsInductiveSet

IsInductiveSet(TheInfinityWitness)

**Status: PENDING**

#### VonNeumannSuccessorIsSuccessorOf

∀ x : ZFCSet, IsSuccessorOf(x, VonNeumannSuccessor(x))

**Status: PENDING**

#### OmegaIsInductiveSet

IsInductiveSet(Omega)

**Status: PENDING**

#### TheEmptySetInOmega

TheEmptySet ∈ Omega

**Status: PENDING**

#### OmegaClosedUnderSuccessor

∀ x : ZFCSet, x ∈ Omega → VonNeumannSuccessor(x) ∈ Omega

**Status: PENDING**

### `Constructions/VonNeumann/WellFoundedness.lean`

#### NaturalZeroIsNotSuccessor

∀ element : NaturalElement, NaturalSuccessor(element) ≠ NaturalZero

**Status: PENDING**

#### NaturalSuccessorInjective

∀ first second : NaturalElement, NaturalSuccessor(first) = NaturalSuccessor(second) → first = second

**Status: PENDING**

#### NaturalInductionPrinciple

∀ subset : ZFCSet, NaturalZero ∈ subset ∧ (∀ element : NaturalElement, element ∈ subset → NaturalSuccessor(element) ∈ subset) → ∀ element : NaturalElement, element ∈ subset

**Status: PENDING**

### `Constructions/Presburger/Carrier.lean`

#### PresburgerZeroIsNotSuccessor

∀ n : PresburgerElement, succ(n) ≠ zero

**Status: PENDING**

#### PresburgerSuccessorInjective

∀ m n : PresburgerElement, succ(m) = succ(n) → m = n

**Status: PENDING**

#### PresburgerInductionPrinciple

∀ subset : PredicateSet(PresburgerElement), zero ∈ subset ∧ (∀ n : PresburgerElement, n ∈ subset → succ(n) ∈ subset) → ∀ n : PresburgerElement, n ∈ subset

**Status: PENDING**

### `Constructions/Presburger/Operations.lean`

Context: let `model` be a `PresburgerModel(Element, SetObject)`.

#### PresburgerAdditionClauses

BinaryIteratorOperationClauses(model.toPeanoSystem, (fun left => left), (fun _ value => model.successor(value)), PresburgerAddition(model))

Proof term is `Classical.choose_spec (ExistenceOfBinaryIteratorOperation ...)` — transitively PENDING (see narrative note above), not a literal `sorry`.

**Status: PENDING**

#### PresburgerAdditionWellDefined

∃ addition : Element → Element → Element, BinaryIteratorOperationClauses(model.toPeanoSystem, (fun left => left), (fun _ value => model.successor(value)), addition) ∧ (∀ other, BinaryIteratorOperationClauses(model.toPeanoSystem, (fun left => left), (fun _ value => model.successor(value)), other) → other = addition)

**Status: PENDING**

### `Constructions/Landau/Operations/Addition.lean`

Context: let `model` be a `PeanoSystem(Element, SetObject)`. Every entry
in this file is transitively PENDING per the narrative note above.

#### LandauAdditionClauses

BinaryIteratorOperationClauses(model, (fun left => model.successor(left)), (fun _ value => model.successor(value)), LandauAddition(model))

**Status: PENDING**

#### LandauAdditionWellDefined

∃ addition : Element → Element → Element, BinaryIteratorOperationClauses(model, (fun left => model.successor(left)), (fun _ value => model.successor(value)), addition) ∧ (∀ other, BinaryIteratorOperationClauses(model, ..., other) → other = addition)

**Status: PENDING**

#### LandauAdditionWithOne

∀ left : Element, LandauAddition(model, left, model.one) = model.successor(left)

**Status: PENDING**

#### LandauAdditionSuccessorOnRight

∀ left right : Element, LandauAddition(model, left, model.successor(right)) = model.successor(LandauAddition(model, left, right))

**Status: PENDING**

#### LandauAdditionIsAssociative

Associative(LandauAddition(model))

**Status: PENDING**

#### LandauAdditionIsCommutative

Commutative(LandauAddition(model))

**Status: PENDING**

### `Constructions/Landau/Operations/Multiplication.lean`

Context: let `model` be a `PeanoSystem(Element, SetObject)`. Every entry
in this file is transitively PENDING per the narrative note above.

#### LandauMultiplicationClauses

BinaryIteratorOperationClauses(model, (fun left => left), (fun left value => LandauAddition(model, value, left)), LandauMultiplication(model))

**Status: PENDING**

#### LandauMultiplicationWellDefined

∃ multiplication : Element → Element → Element, BinaryIteratorOperationClauses(model, (fun left => left), (fun left value => LandauAddition(model, value, left)), multiplication) ∧ (∀ other, ... → other = multiplication)

**Status: PENDING**

#### LandauMultiplicationWithOne

∀ left : Element, LandauMultiplication(model, left, model.one) = left

**Status: PENDING**

#### LandauMultiplicationSuccessorOnRight

∀ left right : Element, LandauMultiplication(model, left, model.successor(right)) = LandauAddition(model, LandauMultiplication(model, left, right), left)

**Status: PENDING**

#### LandauMultiplicationDistributesOverAddition

RightDistributive(LandauMultiplication(model), LandauAddition(model))

**Status: PENDING**

#### LandauLeftDistributivityOfMultiplicationOverAddition

LeftDistributive(LandauMultiplication(model), LandauAddition(model))

**Status: PENDING**

#### LandauMultiplicationDistributesOverAdditionBothSides

TwoSidedDistributive(LandauMultiplication(model), LandauAddition(model))

**Status: PENDING**

#### LandauMultiplicationIsAssociative

Associative(LandauMultiplication(model))

**Status: PENDING**

#### LandauMultiplicationIsCommutative

Commutative(LandauMultiplication(model))

**Status: PENDING**

### `Constructions/Landau/Operations/Exponentiation.lean`

Context: let `model` be a `PeanoSystem(Element, SetObject)`. Every entry
in this file is transitively PENDING per the narrative note above.

#### LandauExponentiationClauses

BinaryIteratorOperationClauses(model, (fun base => base), (fun base value => LandauMultiplication(model, value, base)), LandauExponentiation(model))

**Status: PENDING**

#### LandauExponentiationWellDefined

∃ exponentiation : Element → Element → Element, BinaryIteratorOperationClauses(model, (fun base => base), (fun base value => LandauMultiplication(model, value, base)), exponentiation) ∧ (∀ other, ... → other = exponentiation)

**Status: PENDING**

#### LandauExponentiationWithOne

∀ base : Element, LandauExponentiation(model, base, model.one) = base

**Status: PENDING**

#### LandauExponentiationSuccessorOnRight

∀ base exponent : Element, LandauExponentiation(model, base, model.successor(exponent)) = LandauMultiplication(model, LandauExponentiation(model, base, exponent), base)

**Status: PENDING**

### `Constructions/WholeNumbers/WellFoundedness.lean`

Context: let `natural_data : NaturalArithmeticForWholeNumbers(Element, SetObject)`.

#### basic_decomposition

∀ value : Carrier(natural_data), (value = zero(natural_data) ∨ ∃ n, value = naturalEmbedding(natural_data, n)) ∧ ¬(value = zero(natural_data) ∧ ∃ n, value = naturalEmbedding(natural_data, n)) ∧ (∀ first second, value = naturalEmbedding(natural_data, first) ∧ value = naturalEmbedding(natural_data, second) → first = second)

**Status: PENDING**

#### zero_is_not_successor

∀ value : Carrier(natural_data), successor(natural_data, value) ≠ zero(natural_data)

**Status: PENDING**

#### successor_is_injective

∀ first second : Carrier(natural_data), successor(natural_data, first) = successor(natural_data, second) → first = second

**Status: PENDING**

#### induction_from_zero

∀ predicate : Carrier(natural_data) → Prop, predicate(zero(natural_data)) ∧ (∀ value, predicate(value) → predicate(successor(natural_data, value))) → ∀ value, predicate(value)

**Status: PENDING**

#### strong_induction

∀ predicate : Carrier(natural_data) → Prop, (∀ value, (∀ smaller, strictOrder(natural_data, smaller, value) → predicate(smaller)) → predicate(value)) → ∀ value, predicate(value)

**Status: PENDING**

### `Constructions/WholeNumbers/Laws.lean`

Context: let `natural_data : NaturalArithmeticForWholeNumbers(Element, SetObject)`.

#### additive_structure

Associative(addition(natural_data)) ∧ Commutative(addition(natural_data)) ∧ (∀ value, addition(natural_data, zero(natural_data), value) = value ∧ addition(natural_data, value, zero(natural_data)) = value) ∧ (∀ first second common, addition(natural_data, first, common) = addition(natural_data, second, common) → first = second)

**Status: PENDING**

#### semiring_structure

zero(natural_data) ≠ one(natural_data) ∧ Associative(multiplication(natural_data)) ∧ Commutative(multiplication(natural_data)) ∧ (∀ value, multiplication(natural_data, one(natural_data), value) = value ∧ multiplication(natural_data, value, one(natural_data)) = value) ∧ (∀ value, multiplication(natural_data, zero(natural_data), value) = zero(natural_data) ∧ multiplication(natural_data, value, zero(natural_data)) = zero(natural_data)) ∧ LeftDistributive(multiplication(natural_data), addition(natural_data)) ∧ (∀ first second, multiplication(natural_data, first, second) = zero(natural_data) → first = zero(natural_data) ∨ second = zero(natural_data))

**Status: PENDING**

#### ordered_semiring_structure

(∀ value, nonstrictOrder(natural_data, zero(natural_data), value)) ∧ (∀ first second, strictOrder(natural_data, first, second) ∨ first = second ∨ strictOrder(natural_data, second, first)) ∧ Transitive(strictOrder(natural_data)) ∧ (∀ first second translation, strictOrder(natural_data, first, second) ↔ strictOrder(natural_data, addition(natural_data, first, translation), addition(natural_data, second, translation))) ∧ (∀ first second positive, positive ≠ zero(natural_data) → (strictOrder(natural_data, first, second) ↔ strictOrder(natural_data, multiplication(natural_data, first, positive), multiplication(natural_data, second, positive))))

**Status: PENDING**

#### well_ordering

∀ subset : Carrier(natural_data) → Prop, (∃ value, subset(value)) → ∃ least, subset(least) ∧ (∀ value, subset(value) → nonstrictOrder(natural_data, least, value))

**Status: PENDING**

### `Constructions/WholeNumbers/Behavior.lean`

Context: let `natural_data : NaturalArithmeticForWholeNumbers(Element, SetObject)`.

#### natural_embedding_preserves_structure

(∀ value, naturalEmbedding(natural_data, natural_data.model.successor(value)) = successor(natural_data, naturalEmbedding(natural_data, value))) ∧ (∀ first second, naturalEmbedding(natural_data, LandauAddition(natural_data.model, first, second)) = addition(natural_data, naturalEmbedding(natural_data, first), naturalEmbedding(natural_data, second))) ∧ (∀ first second, naturalEmbedding(natural_data, LandauMultiplication(natural_data.model, first, second)) = multiplication(natural_data, naturalEmbedding(natural_data, first), naturalEmbedding(natural_data, second))) ∧ (∀ first second, strictOrder(natural_data, naturalEmbedding(natural_data, first), naturalEmbedding(natural_data, second)) ↔ natural_data.strictOrder(first, second))

**Status: PENDING**
