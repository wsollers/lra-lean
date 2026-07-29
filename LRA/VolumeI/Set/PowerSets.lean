import LRA.VolumeI.Set.Set

namespace LRA.VolumeI.Set

universe u

/-!
Public interface home for power-set vocabulary.
-/

/-- The absolute predicate power set over a carrier: all predicate-subsets of `Alpha`. -/
def PowerSet (Alpha : LRACarrier) : LRASet (LRASet Alpha) :=
  fun _ => True

/-- The relative power set of an ambient predicate-set. -/
def RelativePowerSet {Alpha : LRACarrier} (Ambient : LRASet Alpha) :
    LRASet (LRASet Alpha) :=
  fun Subset => LRASet.subset Subset Ambient

/-- Every predicate-set over a carrier belongs to its absolute power set. -/
theorem MemberOfPowerSet {Alpha : LRACarrier} (Subset : LRASet Alpha) :
    LRASet.member Subset (PowerSet Alpha) := by
  trivial

/-- Membership in the relative power set is exactly inclusion in the ambient set. -/
theorem RelativePowerSetMembershipIff {Alpha : LRACarrier}
    (Ambient Subset : LRASet Alpha) :
    LRASet.member Subset (RelativePowerSet Ambient) ↔
      LRASet.subset Subset Ambient := by
  rfl

end LRA.VolumeI.Set
