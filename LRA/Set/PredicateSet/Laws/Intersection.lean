import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Intersection

namespace LRA.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Intersection laws for predicate sets: the backend's certificate for
`LRA.Set.IntersectionLaws`. Same discipline as `Laws/Union.lean`.
-/
/--
`IntersectionCommutative` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionCommutative :
    ∀ A B : LRASet Alpha, A ∩ B = B ∩ A
```
-/

theorem IntersectionCommutative :
    ∀ A B : LRASet Alpha, A ∩ B = B ∩ A := by
  sorry
/--
`IntersectionAssociative` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionAssociative :
    ∀ A B C : LRASet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C)
```
-/

theorem IntersectionAssociative :
    ∀ A B C : LRASet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry
/--
`EmptyIntersection` exposes this formal declaration.

Logical form:

```lean
theorem EmptyIntersection :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) ∩ A = (∅ : LRASet Alpha)
```
-/

theorem EmptyIntersection :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) ∩ A = (∅ : LRASet Alpha) := by
  sorry
/--
`IntersectionEmpty` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionEmpty :
    ∀ A : LRASet Alpha, A ∩ (∅ : LRASet Alpha) = (∅ : LRASet Alpha)
```
-/

theorem IntersectionEmpty :
    ∀ A : LRASet Alpha, A ∩ (∅ : LRASet Alpha) = (∅ : LRASet Alpha) := by
  sorry
/--
`IntersectionIdempotent` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionIdempotent : ∀ A : LRASet Alpha, A ∩ A = A
```
-/

theorem IntersectionIdempotent : ∀ A : LRASet Alpha, A ∩ A = A := by
  sorry
/--
`IntersectionMonotone` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRASet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
```
-/

theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRASet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry
/--
`SubsetIffIntersectionEqLeft` exposes this formal declaration.

Logical form:

```lean
theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRASet Alpha, A ⊆ B ↔ A ∩ B = A
```
-/

theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRASet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

/-- Registration: predicate sets satisfy the intersection laws. Pure
delegation to the theorems above. -/
instance : IntersectionLaws (LRASet Alpha) where
  IntersectionCommutative := LRA.Set.LRASet.IntersectionCommutative
  IntersectionAssociative := LRA.Set.LRASet.IntersectionAssociative
  EmptyIntersection := LRA.Set.LRASet.EmptyIntersection
  IntersectionEmpty := LRA.Set.LRASet.IntersectionEmpty
  IntersectionIdempotent := LRA.Set.LRASet.IntersectionIdempotent
  IntersectionMonotone := LRA.Set.LRASet.IntersectionMonotone
  SubsetIffIntersectionEqLeft :=
    LRA.Set.LRASet.SubsetIffIntersectionEqLeft

end LRA.Set.LRASet
