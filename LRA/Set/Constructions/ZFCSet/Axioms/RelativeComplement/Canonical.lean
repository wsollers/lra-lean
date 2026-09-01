import LRA.Set.Constructions.ZFCSet.Axioms.RelativeComplement.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
