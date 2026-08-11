import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Separation

/-!
Binary intersection, derived from Separation.

Same move as `RelativeComplement.lean`: no fresh axiom, no fresh
existence/uniqueness proof. `A ∩ B` is exactly
`TheSeparatedSubset A (fun x => x ∈ B)`, so its existence and uniqueness are
already covered by `Separation.lean`.
-/

namespace LRA.VolumeI.Set.Enderton

/-- The intersection of `A` and `B`, derived as the subset of `A` separated
by membership in `B`. -/
noncomputable def TheIntersection (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∈ B)

/-- The chosen intersection has the expected members. -/
theorem TheIntersectionIsIntersectionOf (A B : Set) :
    IsIntersectionOf A B (TheIntersection A B) := by
  sorry

/-- `x` belongs to `A ∩ B` iff `x` belongs to `A` and `x` belongs to `B`.

Derived from `TheSeparatedSubsetIsSeparatedSubset`, not from a separate
axiom. -/
theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

/-- Every intersection of `A` and `B` equals the chosen one.

Follows directly from `EverySeparatedSubsetEqualsTheSeparatedSubset`, since
`IsIntersectionOf A B D` and `IsSeparatedSubset A (fun x => x ∈ B) D` are the
same proposition. -/
theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B := by
  sorry

end LRA.VolumeI.Set.Enderton
