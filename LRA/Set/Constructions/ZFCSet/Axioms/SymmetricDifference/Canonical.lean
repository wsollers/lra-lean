import LRA.Set.Constructions.ZFCSet.Axioms.SymmetricDifference.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Union.Theorems
import LRA.Set.Constructions.ZFCSet.Axioms.RelativeComplement.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
