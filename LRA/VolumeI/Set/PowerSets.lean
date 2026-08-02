import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-- The absolute typed power set over a carrier: all typed subsets of `Alpha`. -/
def PowerSet (Alpha : LRACarrier) : LRASet (LRASet Alpha) :=
  fun _ => True

/-- The relative power set of an ambient typed set. -/
def RelativePowerSet {Alpha : LRACarrier} (Ambient : LRASet Alpha) :
    LRASet (LRASet Alpha) :=
  fun Subset => LRASet.Subset Subset Ambient

/-- Every typed set over a carrier belongs to its absolute power set. -/
theorem MemberOfPowerSet {Alpha : LRACarrier} (Subset : LRASet Alpha) :
    LRASet.Member Subset (PowerSet Alpha) := by
  sorry

/-- Membership in the relative power set is exactly inclusion in the ambient set. -/
theorem RelativePowerSetMembershipIff {Alpha : LRACarrier}
    (Ambient Subset : LRASet Alpha) :
    LRASet.Member Subset (RelativePowerSet Ambient) ↔
      LRASet.Subset Subset Ambient := by
  sorry

end LRA.VolumeI.Set
