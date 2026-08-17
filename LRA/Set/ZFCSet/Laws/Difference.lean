import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.Enderton

/-!
Difference (`\`) laws for Enderton sets: the backend's certificate for
`LRA.Set.DifferenceLaws`.

`DifferenceUniversal`/`UniversalDifference` are not here -- and no longer
need a prose apology: they now live in the interface's complement family
(`Interface/Complement.lean`), whose certificate requires
`HasUniversal`/`HasComplement` instances Enderton can never register
(Russell's paradox). The type system enforces the carve-out.
-/
/--
`DifferenceMonotoneLeft` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
```
-/

theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry
/--
`DifferenceAntitoneRight` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
```
-/

theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry
/--
`DifferenceEmpty` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceEmpty : ∀ A : Set, A \ (∅ : Set) = A
```
-/

theorem DifferenceEmpty : ∀ A : Set, A \ (∅ : Set) = A := by
  sorry
/--
`EmptyDifference` exposes this formal declaration.

Logical form:

```lean
theorem EmptyDifference : ∀ A : Set, (∅ : Set) \ A = (∅ : Set)
```
-/

theorem EmptyDifference : ∀ A : Set, (∅ : Set) \ A = (∅ : Set) := by
  sorry
/--
`DifferenceSelf` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceSelf : ∀ A : Set, A \ A = (∅ : Set)
```
-/

theorem DifferenceSelf : ∀ A : Set, A \ A = (∅ : Set) := by
  sorry
/--
`DifferenceUnion` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceUnion :
    ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
```
-/

theorem DifferenceUnion :
    ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry
/--
`DifferenceIntersection` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceIntersection :
    ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
```
-/

theorem DifferenceIntersection :
    ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry
/--
`UnionDifferenceDistributes` exposes this formal declaration.

Logical form:

```lean
theorem UnionDifferenceDistributes :
    ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
```
-/

theorem UnionDifferenceDistributes :
    ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry
/--
`IntersectionDifferenceDistributes` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionDifferenceDistributes :
    ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
```
-/

theorem IntersectionDifferenceDistributes :
    ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry
/--
`DifferenceSubsetLeft` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceSubsetLeft : ∀ A B : Set, A \ B ⊆ A
```
-/

theorem DifferenceSubsetLeft : ∀ A B : Set, A \ B ⊆ A := by
  sorry
/--
`DifferenceDisjointRight` exposes this formal declaration.

Logical form:

```lean
theorem DifferenceDisjointRight :
    ∀ A B : Set, (A \ B) ∩ B = (∅ : Set)
```
-/

theorem DifferenceDisjointRight :
    ∀ A B : Set, (A \ B) ∩ B = (∅ : Set) := by
  sorry

/-- Registration: Enderton sets satisfy the difference laws. Pure
delegation to the theorems above. -/
instance : DifferenceLaws Set where
  DifferenceMonotoneLeft := LRA.Set.Enderton.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.Set.Enderton.DifferenceAntitoneRight
  DifferenceEmpty := LRA.Set.Enderton.DifferenceEmpty
  EmptyDifference := LRA.Set.Enderton.EmptyDifference
  DifferenceSelf := LRA.Set.Enderton.DifferenceSelf
  DifferenceUnion := LRA.Set.Enderton.DifferenceUnion
  DifferenceIntersection := LRA.Set.Enderton.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.Set.Enderton.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.Set.Enderton.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.Set.Enderton.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.Set.Enderton.DifferenceDisjointRight

end LRA.Set.Enderton
