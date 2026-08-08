import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.VolumeI.Relations

universe u

/-- A partition determines the relation of belonging to a common block. -/
def EquivalenceFromPartition
    {interface : LRA.VolumeI.Set.SetInterface.{u, u}}
    (partition : Partition interface) : Endorelation interface.Element :=
  fun first second =>
    exists index,
      interface.member first (partition.Block index) /\
        interface.member second (partition.Block index)

/--
Equivalence relations and partitions determine one another.

This is the textbook fundamental theorem of equivalence relations, stated as
the interface contract for the detailed proof pass.
-/
theorem FundamentalTheoremOfEquivalenceRelations
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u})
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    EquivalenceRelation
      (EquivalenceFromPartition
        (PartitionFromEquivalence operations ambient relation relationIsEquivalence)) := by
  sorry

end LRA.VolumeI.Relations
