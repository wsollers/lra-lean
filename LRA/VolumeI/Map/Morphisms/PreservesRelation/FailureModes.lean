import LRA.VolumeI.Map.Morphisms.PreservesRelation.Definition

namespace LRA.Map.Morphisms

universe u v

/-- Failure of relation preservation by a map. -/
def FailsPreservesRelation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  Not (PreservesRelation map sourceRelation targetRelation)

end LRA.Map.Morphisms
