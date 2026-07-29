import LRA.VolumeI.Relations.Equivalence.Partition

namespace LRA.VolumeI.Relations

universe u

/-- The quotient set of equivalence classes induced by a relation. -/
def QuotientSet {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation Alpha) :
    LRA.VolumeI.Set.LRASet (LRA.VolumeI.Set.LRASet Alpha) :=
  fun subset => exists representative, subset = EquivalenceClass relation representative

/-- The canonical projection sending an element to its equivalence class. -/
def QuotientProjection {Alpha : LRA.VolumeI.Set.LRACarrier}
    (relation : Endorelation Alpha) :
    Alpha -> LRA.VolumeI.Set.LRASet Alpha :=
  fun element => EquivalenceClass relation element

end LRA.VolumeI.Relations
