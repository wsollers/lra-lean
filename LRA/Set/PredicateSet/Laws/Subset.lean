import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Subset

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem SubsetReflexive :
    ∀ A : LRA.Set.PredicateSet Alpha, A ⊆ A := by
  sorry

theorem SubsetTransitive :
    ∀ A B C : LRA.Set.PredicateSet Alpha, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

theorem SetEqualityIffMutualSubset :
    ∀ A B : LRA.Set.PredicateSet Alpha, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

instance : SubsetLaws (LRA.Set.PredicateSet Alpha) where
  SubsetReflexive := LRA.Set.PredicateSet.SubsetReflexive
  SubsetTransitive := LRA.Set.PredicateSet.SubsetTransitive
  SetEqualityIffMutualSubset :=
    LRA.Set.PredicateSet.SetEqualityIffMutualSubset

end LRA.Set.PredicateSet

namespace LRA.Set.LRASet
export LRA.Set.PredicateSet
  (SubsetReflexive SubsetTransitive SetEqualityIffMutualSubset)
end LRA.Set.LRASet
