import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-- The absolute typed power set over a carrier is the set of all typed subsets
of `Alpha`; equivalently, every `LRASet Alpha` is a member of `PowerSet Alpha`. -/
def PowerSet (Alpha : LRACarrier) : LRASet (LRASet Alpha) :=
  fun _ => True

/-- The relative power set of an ambient set `A` is the set of all subsets of
`A`; equivalently, `B ∈ RelativePowerSet A` iff `B ⊆ A`. -/
def RelativePowerSet {Alpha : LRACarrier} (Ambient : LRASet Alpha) :
    LRASet (LRASet Alpha) :=
  fun Subset => LRASet.Subset Subset Ambient

/-- Let `A` be a typed set over `Alpha`. Then `A` belongs to the absolute power
set of `Alpha`; equivalently, every subset of `Alpha` is an element of
`PowerSet Alpha`. -/
theorem MemberOfPowerSet {Alpha : LRACarrier} (Subset : LRASet Alpha) :
    LRASet.Member Subset (PowerSet Alpha) := by
  sorry

/-- Let `A` be an ambient set and `B` a candidate subset. Membership in the
relative power set is exactly inclusion in the ambient set; equivalently,
`B ∈ RelativePowerSet A` iff `B ⊆ A`. -/
theorem RelativePowerSetMembershipIff {Alpha : LRACarrier}
    (Ambient Subset : LRASet Alpha) :
    LRASet.Member Subset (RelativePowerSet Ambient) ↔
      LRASet.Subset Subset Ambient := by
  sorry

end LRA.VolumeI.Set
