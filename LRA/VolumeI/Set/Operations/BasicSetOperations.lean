import LRA.VolumeI.Set.LRASet.LRASet

/-!
Basic typed-set operation facts.
-/

namespace LRA.VolumeI.Set.Operations.BasicSetOperations

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem UnionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Union Left Right) ↔
      Member Element Left ∨ Member Element Right := by
  sorry

theorem IntersectionMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Intersection Left Right) ↔
      Member Element Left ∧ Member Element Right := by
  sorry

theorem ComplementMembershipIff {Alpha : LRACarrier}
    (Comp : LRASet Alpha) (Element : Alpha) :
    Member Element (Complement Comp) ↔
      ¬ Member Element Comp := by
  sorry

theorem DifferenceMembershipIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) (Element : Alpha) :
    Member Element (Difference Left Right) ↔
      Member Element Left ∧ ¬ Member Element Right := by
  sorry

theorem SubsetMembershipImplication {Alpha : LRACarrier}
    (Left Right : LRASet Alpha)
    (LeftSubsetRight : Subset Left Right) :
    ∀ Element : Alpha, Member Element Left → Member Element Right := by
  sorry

end LRA.VolumeI.Set.Operations.BasicSetOperations
