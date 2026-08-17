import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Difference

namespace LRA.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Difference (`\`) laws for predicate sets: the backend's certificate for
`LRA.Set.DifferenceLaws`. The universal-set difference laws are
not missing -- they live in `Laws/Complement.lean`, with the rest of the
family only this backend can register.
-/
/--
`DifferenceMonotoneLeft` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : LRASet Alpha, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
```
-/

theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : LRASet Alpha, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry
/--
`DifferenceAntitoneRight` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : LRASet Alpha, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
```
-/

theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : LRASet Alpha, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry
/--
`DifferenceEmpty` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceEmpty :
    ∀ A : LRASet Alpha, A \ (∅ : LRASet Alpha) = A
```
-/

theorem DifferenceEmpty :
    ∀ A : LRASet Alpha, A \ (∅ : LRASet Alpha) = A := by
  sorry
/--
`EmptyDifference` exposes this formal declaration.

Logical form:

```lean
theorem EmptyDifference :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) \ A = (∅ : LRASet Alpha)
```
-/

theorem EmptyDifference :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) \ A = (∅ : LRASet Alpha) := by
  sorry
/--
`DifferenceSelf` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceSelf :
    ∀ A : LRASet Alpha, A \ A = (∅ : LRASet Alpha)
```
-/

theorem DifferenceSelf :
    ∀ A : LRASet Alpha, A \ A = (∅ : LRASet Alpha) := by
  sorry
/--
`DifferenceUnion` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceUnion :
    ∀ A B C : LRASet Alpha, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
```
-/

theorem DifferenceUnion :
    ∀ A B C : LRASet Alpha, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry
/--
`DifferenceIntersection` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceIntersection :
    ∀ A B C : LRASet Alpha, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
```
-/

theorem DifferenceIntersection :
    ∀ A B C : LRASet Alpha, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry
/--
`UnionDifferenceDistributes` exposes this formal declaration.

Logical form:

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
```
-/

theorem UnionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry
/--
`IntersectionDifferenceDistributes` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
```
-/

theorem IntersectionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry
/--
`DifferenceSubsetLeft` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceSubsetLeft : ∀ A B : LRASet Alpha, A \ B ⊆ A
```
-/

theorem DifferenceSubsetLeft : ∀ A B : LRASet Alpha, A \ B ⊆ A := by
  sorry
/--
`DifferenceDisjointRight` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceDisjointRight :
    ∀ A B : LRASet Alpha, (A \ B) ∩ B = (∅ : LRASet Alpha)
```
-/

theorem DifferenceDisjointRight :
    ∀ A B : LRASet Alpha, (A \ B) ∩ B = (∅ : LRASet Alpha) := by
  sorry

/-- Registration: predicate sets satisfy the difference laws. Pure
delegation to the theorems above. -/
instance : DifferenceLaws (LRASet Alpha) where
  DifferenceMonotoneLeft := LRA.Set.LRASet.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.Set.LRASet.DifferenceAntitoneRight
  DifferenceEmpty := LRA.Set.LRASet.DifferenceEmpty
  EmptyDifference := LRA.Set.LRASet.EmptyDifference
  DifferenceSelf := LRA.Set.LRASet.DifferenceSelf
  DifferenceUnion := LRA.Set.LRASet.DifferenceUnion
  DifferenceIntersection := LRA.Set.LRASet.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.Set.LRASet.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.Set.LRASet.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.Set.LRASet.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.Set.LRASet.DifferenceDisjointRight

end LRA.Set.LRASet
