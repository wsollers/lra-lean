import LRA.Set.TG.Union.Theorems
import LRA.Set.TG.Separation.Theorems

namespace LRA.Set.TG

noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A) (fun x => forall B : Set, B ∈ A -> x ∈ B)

theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : exists B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A <-> forall B : Set, B ∈ A -> x ∈ B := by
  sorry

end LRA.Set.TG
