import LRA.Set.Constructions.NBGSet.Axioms.EmptySet.Uniqueness

namespace LRA.Set.Constructions.NBGSet.Axioms

noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
