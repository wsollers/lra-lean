import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Distributivity

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Distributivity and absorption laws for predicate sets: the backend's
certificate for `LRA.VolumeI.Set.DistributivityLaws`.
-/
/--
`IntersectionDistributesOverUnion` exposes this formal declaration.

Logical form:

```lean
theorem IntersectionDistributesOverUnion :
    ∀ A B C : LRASet Alpha, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
```
-/

theorem IntersectionDistributesOverUnion :
    ∀ A B C : LRASet Alpha, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry
/--
`UnionDistributesOverIntersection` exposes this formal declaration.

Logical form:

```lean
theorem UnionDistributesOverIntersection :
    ∀ A B C : LRASet Alpha, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
```
-/

theorem UnionDistributesOverIntersection :
    ∀ A B C : LRASet Alpha, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry
/--
`AbsorptionUnionIntersection` exposes this formal declaration.

Logical form:

```lean
theorem AbsorptionUnionIntersection :
    ∀ A B : LRASet Alpha, A ∪ (A ∩ B) = A
```
-/

theorem AbsorptionUnionIntersection :
    ∀ A B : LRASet Alpha, A ∪ (A ∩ B) = A := by
  sorry
/--
`AbsorptionIntersectionUnion` exposes this formal declaration.

Logical form:

```lean
theorem AbsorptionIntersectionUnion :
    ∀ A B : LRASet Alpha, A ∩ (A ∪ B) = A
```
-/

theorem AbsorptionIntersectionUnion :
    ∀ A B : LRASet Alpha, A ∩ (A ∪ B) = A := by
  sorry

/-- Registration: predicate sets satisfy the distributivity and absorption
laws. Pure delegation to the theorems above. -/
instance : DistributivityLaws (LRASet Alpha) where
  IntersectionDistributesOverUnion :=
    LRA.VolumeI.Set.LRASet.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.VolumeI.Set.LRASet.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.VolumeI.Set.LRASet.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.VolumeI.Set.LRASet.AbsorptionIntersectionUnion

end LRA.VolumeI.Set.LRASet
