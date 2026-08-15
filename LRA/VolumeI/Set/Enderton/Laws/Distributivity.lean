import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Interface.Distributivity

namespace LRA.Set.Enderton

/-!
Distributivity and absorption laws for Enderton sets: the backend's
certificate for `LRA.Set.DistributivityLaws`.
-/
/--
`IntersectionDistributesOverUnion` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
```
-/

theorem IntersectionDistributesOverUnion :
    ∀ A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry
/--
`UnionDistributesOverIntersection` exposes this formal declaration.

Logical form:

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
```
-/

theorem UnionDistributesOverIntersection :
    ∀ A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry
/--
`AbsorptionUnionIntersection` exposes this formal declaration.

Logical form:

```lean
theorem AbsorptionUnionIntersection :
    ∀ A B : Set, A ∪ (A ∩ B) = A
```
-/

theorem AbsorptionUnionIntersection :
    ∀ A B : Set, A ∪ (A ∩ B) = A := by
  sorry
/--
`AbsorptionIntersectionUnion` exposes this formal declaration.

Logical form:

```lean
theorem AbsorptionIntersectionUnion :
    ∀ A B : Set, A ∩ (A ∪ B) = A
```
-/

theorem AbsorptionIntersectionUnion :
    ∀ A B : Set, A ∩ (A ∪ B) = A := by
  sorry

/-- Registration: Enderton sets satisfy the distributivity and absorption
laws. Pure delegation to the theorems above. -/
instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion :=
    LRA.Set.Enderton.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.Set.Enderton.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.Set.Enderton.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.Set.Enderton.AbsorptionIntersectionUnion

end LRA.Set.Enderton
