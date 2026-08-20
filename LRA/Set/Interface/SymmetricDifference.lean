import LRA.Set.Interface.Operations

namespace LRA.Set

universe u

/-!
The symmetric-difference law family as a law-carrying typeclass. Same
design as `UnionLaws` (see `Interface/Union.lean`).

The operation itself comes from `HasSymmDiff` (`Interface/Operations.lean`)
-- Lean core has no symmetric-difference notation class -- so `A ∆ B`
resolves by instance search exactly like `A ∪ B` does. No universal set is
required: any backend with union and relative complement can derive
`∆` and register this certificate; both Enderton and `LRASet` qualify.
-/
/--
`SymmDiffLaws` exposes this formal declaration.

Logical form:

```lean
class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B
```
-/

class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B

variable {α : Type u}
variable [HasSymmDiff α] [Union α] [Inter α] [SDiff α]
variable [EmptyCollection α] [HasSubset α]
variable [SymmDiffLaws α]
/--
`A ∆ B` is the union of the two relative complements.

Logical form:

```lean
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
```
-/
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

/--
`A ∆ B` is the union minus the intersection.

Logical form:

```lean
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
```
-/
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

/--
Symmetric difference is commutative.

Logical form:

```lean
theorem SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
```
-/
theorem SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A := by
  sorry

/--
Symmetric difference is associative.

Logical form:

```lean
theorem SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
```
-/
theorem SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

/--
The empty set is a right identity for symmetric difference.

Logical form:

```lean
theorem SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
```
-/
theorem SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A := by
  sorry

/--
The empty set is a left identity for symmetric difference.

Logical form:

```lean
theorem EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
```
-/
theorem EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A := by
  sorry

/--
Every set is its own inverse under symmetric difference.

Logical form:

```lean
theorem SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
```
-/
theorem SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α) := by
  sorry

/--
`A ∆ B` is empty exactly when `A = B`.

Logical form:

```lean
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
```
-/
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B := by
  sorry

/--
`A ∆ B` is a subset of `A ∪ B`.

Logical form:

```lean
theorem SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B
```
-/
theorem SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set
