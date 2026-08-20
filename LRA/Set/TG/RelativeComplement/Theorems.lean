import LRA.Set.TG.Definitions
import LRA.Set.TG.Separation.Theorems

namespace LRA.Set.TG

noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry


theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B <-> x ∈ A /\ x ∉ B := by
  sorry

end LRA.Set.TG
