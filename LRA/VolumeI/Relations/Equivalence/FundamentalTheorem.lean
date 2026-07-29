import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.VolumeI.Relations

universe u

/-- A partition determines the relation of belonging to a common block. -/
def EquivalenceFromPartition {Alpha : LRA.VolumeI.Set.LRACarrier}
    (partition : Partition Alpha) : Endorelation Alpha :=
  fun first second =>
    exists index, partition.block index first /\ partition.block index second

/--
Equivalence relations and partitions determine one another.

This is the textbook fundamental theorem of equivalence relations, stated as
the interface contract for the detailed proof pass.
-/
theorem FundamentalTheoremOfEquivalenceRelations
    {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation Alpha)
    (relationIsEquivalence : EquivalenceRelation relation) :
    EquivalenceRelation
      (EquivalenceFromPartition
        (PartitionFromEquivalence relation relationIsEquivalence)) := by
  sorry

end LRA.VolumeI.Relations
