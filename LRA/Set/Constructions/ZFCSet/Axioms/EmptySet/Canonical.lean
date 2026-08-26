import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
