import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Subset

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Subset laws for predicate sets: the backend's certificate for
`LRA.VolumeI.Set.SubsetLaws`. As in the interface and in
`Enderton/Laws/`, only the pure-`⊆` laws are here; the union/intersection
characterizations live in `Laws/Union.lean` and `Laws/Intersection.lean`.
-/

theorem SubsetReflexive : ∀ A : LRASet Alpha, A ⊆ A := by
  sorry

theorem SubsetTransitive :
    ∀ A B C : LRASet Alpha, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

theorem SetEqualityIffMutualSubset :
    ∀ A B : LRASet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

/-- Registration: predicate sets satisfy the subset laws. Pure delegation
to the theorems above. -/
instance : SubsetLaws (LRASet Alpha) where
  SubsetReflexive := LRA.VolumeI.Set.LRASet.SubsetReflexive
  SubsetTransitive := LRA.VolumeI.Set.LRASet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.VolumeI.Set.LRASet.SetEqualityIffMutualSubset

end LRA.VolumeI.Set.LRASet
