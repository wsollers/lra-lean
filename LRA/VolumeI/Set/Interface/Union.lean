namespace LRA.VolumeI.Set

universe u

/-!
The union law family as a law-carrying typeclass.

`UnionLaws α` is the *certificate* that `α`'s already-registered
operations (`Union`, `EmptyCollection`, `HasSubset` -- the machines) obey
the union laws. It is `Prop`-valued: every field is a proof, it carries
no data, so it can never conflict with the operation instances it
certifies.

A backend registers once (`instance : UnionLaws Set where ...` at the end
of its own `Laws/Union.lean`), and every theorem below becomes available
at that backend's type with the call shape `UnionCommutative A B` --
instance search supplies the certificate; nothing is threaded by hand.

`SubsetIffUnionEqRight` lives here rather than in `Subset.lean` because
its statement mentions `∪`: a law belongs to the family of the operation
it characterizes, so each family's certificate requires exactly the
operation classes its laws mention.
-/
/--
`UnionLaws` exposes this formal declaration.

Logical form:

```lean
class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B
```
-/

class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B

variable {α : Type u} [Union α] [EmptyCollection α] [HasSubset α]
variable [UnionLaws α]
/--
Union is commutative. Call site: `UnionCommutative A B`.

Logical form:

```lean
theorem UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
```
-/
theorem UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A :=
  UnionLaws.UnionCommutative
/--
Union is associative.

Logical form:

```lean
theorem UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
```
-/
theorem UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C) :=
  UnionLaws.UnionAssociative
/--
The empty set is a left identity for union.

Logical form:

```lean
theorem EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
```
-/
theorem EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A :=
  UnionLaws.EmptyUnion
/--
The empty set is a right identity for union.

Logical form:

```lean
theorem UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
```
-/
theorem UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A :=
  UnionLaws.UnionEmpty
/--
Union is idempotent.

Logical form:

```lean
theorem UnionIdempotent : ∀ A : α, A ∪ A = A
```
-/
theorem UnionIdempotent : ∀ A : α, A ∪ A = A :=
  UnionLaws.UnionIdempotent
/--
Union is monotone in both arguments.

Logical form:

```lean
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
```
-/
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ :=
  UnionLaws.UnionMonotone
/--
`A ⊆ B` exactly when `A ∪ B = B`: subset, characterized by union.

Logical form:

```lean
theorem SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B
```
-/
theorem SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B :=
  UnionLaws.SubsetIffUnionEqRight

end LRA.VolumeI.Set
