import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Separation.Theorems

namespace LRA.Set.NBG

noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B) := by
  sorry


theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B <-> x ∈ A /\ x ∈ B := by
  sorry

end LRA.Set.NBG
