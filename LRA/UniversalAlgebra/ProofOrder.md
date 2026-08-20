# LRA.UniversalAlgebra — Proof Order

Ledger notation: see [`LRA/ProofOrderNotation.md`](../ProofOrderNotation.md).

This file replaces `LRA/UniversalAlgebra/Congruence/ProofOrder.md`, which
tracked only the `Congruence/` sub-concept in an old `- [x]`/`- [ ]`
checklist shape. Per `subject-architecture-prompt.md` §5.1 a subject owns
exactly one tracking file at its own root, covering every theorem the
subject owns — not one per concept folder.

## Narrative order

Of `UniversalAlgebra`'s many concept folders (`Signature`, `Algebra`,
`Satisfaction`, `Congruence`, `Homomorphism`, `Embedding`, `Isomorphism`,
`Subalgebra`, `Product`, `Quotient`, `KernelCongruence`,
`UniversalProperties`), only two currently own theorem/lemma declarations:
`Congruence` and `Quotient` (specifically `Quotient/RepresentativeCompatibility.lean`,
generic descent/well-definedness infrastructure that concrete quotient
constructions elsewhere in the repo — integers, rationals, reals — cite
when certifying their representative-level operations and relations).
Every other folder is definitions and structure only, no proof
obligations yet. `LRA.UniversalAlgebra`'s own aggregate import
(`UniversalAlgebra.lean`) orders `Congruence` before `Quotient`, which
this ledger follows.

Within `Congruence`: `Theorems.lean` (the basic congruence-application and
requirement-projection facts, all direct projections/applications with no
proof gap) comes first; `Consequences.lean` and `Relationships.lean` both
build on it independently of each other (no ordering constraint between
them, so they keep source-listing order); `FailureModes.lean` is an
independent worked counterexample (same parity does not license
substitution under successor) with no dependency on the other three.

## Per-theorem ledger

Status determined by direct inspection: every entry has either a real
term-mode proof (a direct field projection or function application, no
`sorry` anywhere in the chain) or a proof body that is the single tactic
`sorry`, so a textual read and an axiom-closure check (`#print axioms`)
agree exactly for all of them. Re-derive via
`scripts/GenerateProofOrderManifest.lean` once a Lean toolchain is
available, rather than trusting this by-eye pass for any future edit to
this subject.

### `Congruence/Theorems.lean`

Context: let `Carrier` be a type, `relation` an endorelation on `Carrier`.

#### UnaryOperationCongruence.apply

∀ operation : Carrier → Carrier, UnaryOperationCongruence(relation, operation) → ∀ left right : Carrier, relation(left, right) → relation(operation(left), operation(right))

**Status: COMPLETE**

#### BinaryOperationCongruence.apply

∀ operation : Carrier → Carrier → Carrier, BinaryOperationCongruence(relation, operation) → ∀ left₁ left₂ right₁ right₂ : Carrier, relation(left₁, left₂) ∧ relation(right₁, right₂) → relation(operation(left₁, right₁), operation(left₂, right₂))

**Status: COMPLETE**

#### UnaryOperationRelationRequirements.relation_is_equivalence

∀ operation : Carrier → Carrier, UnaryOperationRelationRequirements(relation, operation) → EquivalenceRelation(relation)

**Status: COMPLETE**

#### UnaryOperationRelationRequirements.operation_congruence

∀ operation : Carrier → Carrier, UnaryOperationRelationRequirements(relation, operation) → UnaryOperationCongruence(relation, operation)

**Status: COMPLETE**

#### BinaryOperationRelationRequirements.relation_is_equivalence

∀ operation : Carrier → Carrier → Carrier, BinaryOperationRelationRequirements(relation, operation) → EquivalenceRelation(relation)

**Status: COMPLETE**

#### BinaryOperationRelationRequirements.operation_congruence

∀ operation : Carrier → Carrier → Carrier, BinaryOperationRelationRequirements(relation, operation) → BinaryOperationCongruence(relation, operation)

**Status: COMPLETE**

### `Congruence/Consequences.lean`

Context: let `Carrier`, `SetObject` be types with the ambient membership/
separation/extensionality instances `Consequences.lean` assumes; let
`ambient : SetObject`, `relation` an endorelation on `Carrier`.

#### UnaryOperationRelationRequirements.quotient_projection_respects_operation

∀ operation : Carrier → Carrier, UnaryOperationRelationRequirements(relation, operation) → ∀ left right : Carrier, relation(left, right) → QuotientProjection(ambient, relation, operation(left)) = QuotientProjection(ambient, relation, operation(right))

**Status: PENDING**

#### BinaryOperationRelationRequirements.quotient_projection_respects_operation

∀ operation : Carrier → Carrier → Carrier, BinaryOperationRelationRequirements(relation, operation) → ∀ left₁ left₂ right₁ right₂ : Carrier, relation(left₁, left₂) ∧ relation(right₁, right₂) → QuotientProjection(ambient, relation, operation(left₁, right₁)) = QuotientProjection(ambient, relation, operation(left₂, right₂))

**Status: PENDING**

### `Congruence/Relationships.lean`

Context: let `Carrier` be a type, `relation` an endorelation on `Carrier`,
`operation` a binary endo-operation on `Carrier`.

#### BinaryOperationCongruence.left

Reflexive(relation) ∧ BinaryOperationCongruence(relation, operation) → ∀ right : Carrier, ∀ left₁ left₂ : Carrier, relation(left₁, left₂) → relation(operation(left₁, right), operation(left₂, right))

**Status: PENDING**

#### BinaryOperationCongruence.right

Reflexive(relation) ∧ BinaryOperationCongruence(relation, operation) → ∀ left : Carrier, ∀ right₁ right₂ : Carrier, relation(right₁, right₂) → relation(operation(left, right₁), operation(left, right₂))

**Status: PENDING**

### `Congruence/FailureModes.lean`

`SameParity(left, right) := left % 2 = right % 2`; `NaturalSuccessor(n) := n + 1`;
`FailsUnaryRelationSubstitution(relation, operation) := ¬ (∀ left right, relation(left, right) → operation(left) = operation(right))`.

#### SameParityFailsUnarySubstitutionForSuccessor

FailsUnaryRelationSubstitution(SameParity, NaturalSuccessor)

**Status: PENDING**

### `Quotient/RepresentativeCompatibility.lean`

Context: let `Carrier` be a type, `setoid : Setoid(Carrier)`. `binary_operation_respects`,
`binary_operation_respects_left`, `binary_operation_respects_right`,
`predicate_respects`, `relation_respects` are opaque predicates (see the
Lean source for their unfolded content — each is the expected
"equivalent inputs give equivalent/related outputs" condition).

#### binary_operation_respects_iff_left_and_right

∀ operation : Carrier → Carrier → Carrier, binary_operation_respects(setoid, operation) ↔ binary_operation_respects_left(setoid, operation) ∧ binary_operation_respects_right(setoid, operation)

**Status: PENDING**

#### commutative_operation_respects_of_respects_left

∀ operation : Carrier → Carrier → Carrier, (∀ first second : Carrier, operation(first, second) = operation(second, first)) ∧ binary_operation_respects_left(setoid, operation) → binary_operation_respects(setoid, operation)

**Status: PENDING**

#### induced_binary_operation_exists

∀ operation : Carrier → Carrier → Carrier, binary_operation_respects(setoid, operation) → ∃ quotient_operation : Quotient(setoid) → Quotient(setoid) → Quotient(setoid), ∀ first second : Carrier, quotient_operation(Quotient.mk(first), Quotient.mk(second)) = Quotient.mk(operation(first, second))

**Status: PENDING**

#### compatible_predicate_has_constant_truth_on_classes

∀ predicate : Carrier → Prop, predicate_respects(setoid, predicate) → ∀ first second : Carrier, setoid.r(first, second) → (predicate(first) ↔ predicate(second))

**Status: PENDING**

#### induced_relation_exists

∀ relation : Carrier → Carrier → Prop, relation_respects(setoid, relation) → ∃ quotient_relation : Quotient(setoid) → Quotient(setoid) → Prop, ∀ first second : Carrier, quotient_relation(Quotient.mk(first), Quotient.mk(second)) ↔ relation(first, second)

**Status: PENDING**
