import LRA.VolumeI.Identity.Theory
import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet

/-- The absolute typed power set over a carrier is the set of all typed subsets
of `Alpha`; equivalently, every `LRASet Alpha` is a member of `PowerSet Alpha`. -/
def PowerSet (Alpha : LRACarrier) : LRASet (LRASet Alpha) :=
  fun _ => True

/-- The relative power set of an ambient set `A` is the set of all subsets of
`A`; equivalently, `B ∈ RelativePowerSet A` iff `B ⊆ A`. -/
def RelativePowerSet {Alpha : LRACarrier} (Ambient : LRASet Alpha) :
    LRASet (LRASet Alpha) :=
  fun Subset => LRASet.Subset Subset Ambient

/-- For any typed ambient set, there is a unique typed set whose members are
exactly the typed subsets of that ambient set. This is the typed-set analogue
of the power-set output existence and uniqueness theorem. -/
theorem RelativePowerSetExistsUnique {Alpha : LRACarrier}
    (Ambient : LRASet Alpha) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun powerSet : LRASet (LRASet Alpha) =>
        ∀ Subset : LRASet Alpha,
          LRASet.Member Subset powerSet ↔ LRASet.Subset Subset Ambient) := by
  sorry

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

/-- The relative power set is monotone with respect to inclusion. If
`A ⊆ B`, then every subset of `A` is also a subset of `B`, so
`𝒫(A) ⊆ 𝒫(B)`. -/
theorem RelativePowerSetMonotoneInclusion {Alpha : LRACarrier}
    {Left Right : LRASet Alpha}
    (LeftSubsetRight : LRASet.Subset Left Right) :
    LRASet.Subset (RelativePowerSet Left) (RelativePowerSet Right) := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
