import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.UpperLowerBounds

/-!
Set operations and inherited bounds.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {S : Type*}

/-- Let `A B : Set S` and `u : S`. If `[LE S]`, `leftUpperBound : IsUpperBound u A`, and
`rightUpperBound : IsUpperBound u B`. Then `IsUpperBound u (A ∪ B)`.

Logical form:

```lean
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B)
```
-/
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B) := by
  sorry

/-- Let `A B : Set S` and `l : S`. If `[LE S]`, `leftLowerBound : IsLowerBound l A`, and
`rightLowerBound : IsLowerBound l B`. Then `IsLowerBound l (A ∪ B)`.

Logical form:

```lean
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B)
```
-/
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B) := by
  sorry

/-- Let `A B : Set S`. If `[LE S]`. Then `IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove
B`.

Logical form:

```lean
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B
```
-/
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B := by
  sorry

/-- Let `A B : Set S`. If `[LE S]`. Then `IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow
B`.

Logical form:

```lean
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B
```
-/
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B := by
  sorry

/-- Let `A B : Set S`. If `[LE S]`. Then `IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B`.

Logical form:

```lean
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B
```
-/
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B := by
  sorry

/-- Let `C A : Set S` and `u : S`. If `[Preorder S]`, `subsetHypothesis : C ⊆ A`, and
`upperBoundHypothesis : IsUpperBound u A`. Then `IsUpperBound u C`.

Logical form:

```lean
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C
```
-/
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C := by
  sorry

/-- Let `C A : Set S` and `l : S`. If `[Preorder S]`, `subsetHypothesis : C ⊆ A`, and
`lowerBoundHypothesis : IsLowerBound l A`. Then `IsLowerBound l C`.

Logical form:

```lean
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C
```
-/
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C := by
  sorry

/-- Let `A B : Set S` and `u : S`. If `[LE S]` and `upperBoundHypothesis : IsUpperBound u A`. Then
`IsUpperBound u (A ∩ B)`.

Logical form:

```lean
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B)
```
-/
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B) := by
  sorry

/-- Let `A B : Set S` and `l : S`. If `[LE S]` and `lowerBoundHypothesis : IsLowerBound l A`. Then
`IsLowerBound l (A ∩ B)`.

Logical form:

```lean
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B)
```
-/
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B) := by
  sorry

/-- Let `A B : Set S` and `u : S`. If `[LE S]` and `upperBoundHypothesis : IsUpperBound u A`. Then
`IsUpperBound u (A \ B)`.

Logical form:

```lean
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B)
```
-/
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B) := by
  sorry

/-- Let `A B : Set S` and `l : S`. If `[LE S]` and `lowerBoundHypothesis : IsLowerBound l A`. Then
`IsLowerBound l (A \ B)`.

Logical form:

```lean
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B)
```
-/
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B) := by
  sorry

/-- Let `A T : Set S` and `u : S`. If `[LE S]` and `upperBoundHypothesis : IsUpperBound u T`. Then
`IsUpperBound u (T \ A)`.

Logical form:

```lean
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A)
```
-/
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A) := by
  sorry

/-- Let `A T : Set S` and `l : S`. If `[LE S]` and `lowerBoundHypothesis : IsLowerBound l T`. Then
`IsLowerBound l (T \ A)`.

Logical form:

```lean
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A)
```
-/
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
