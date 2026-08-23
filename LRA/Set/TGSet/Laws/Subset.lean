import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.TGSet

                                                             

theorem SubsetReflexive : forall A : Set, A ⊆ A := by
  sorry


theorem SubsetTransitive :
    forall A B C : Set, A ⊆ B -> B ⊆ C -> A ⊆ C := by
  sorry


theorem SetEqualityIffMutualSubset :
    forall A B : Set, A = B <-> A ⊆ B /\ B ⊆ A := by
  sorry

instance : SubsetLaws Set where
  SubsetReflexive := SubsetReflexive
  SubsetTransitive := SubsetTransitive
  SetEqualityIffMutualSubset := SetEqualityIffMutualSubset

end LRA.Set.TGSet
