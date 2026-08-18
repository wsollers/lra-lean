import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Separation.Theorems

/-!
Binary intersection, derived from Separation.
-/

namespace LRA.Set.ZFC

/-- The intersection of `A` and `B`, derived as the subset of `A` separated
by membership in `B`. -/
noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

/-- The chosen intersection has the expected members. -/
theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B) := by
  sorry

/-- Membership in the chosen intersection. -/
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/-- Every intersection equals the chosen one. -/
theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B := by
  sorry

end LRA.Set.ZFC
