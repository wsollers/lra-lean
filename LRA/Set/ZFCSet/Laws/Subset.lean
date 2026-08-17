import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.ZFCSet

/-! Subset-law certificate for the concrete ZFCSet backend. -/

theorem SubsetReflexive : ∀ A : Set, A ⊆ A := by
  sorry

theorem SubsetTransitive :
    ∀ A B C : Set, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

theorem SetEqualityIffMutualSubset :
    ∀ A B : Set, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

instance : SubsetLaws Set where
  SubsetReflexive := SubsetReflexive
  SubsetTransitive := SubsetTransitive
  SetEqualityIffMutualSubset := SetEqualityIffMutualSubset

end LRA.Set.ZFCSet

namespace LRA.Set.Enderton

abbrev SubsetReflexive := LRA.Set.ZFCSet.SubsetReflexive
abbrev SubsetTransitive := LRA.Set.ZFCSet.SubsetTransitive
abbrev SetEqualityIffMutualSubset := LRA.Set.ZFCSet.SetEqualityIffMutualSubset

end LRA.Set.Enderton
