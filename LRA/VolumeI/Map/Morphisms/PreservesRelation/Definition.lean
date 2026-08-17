import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Map.Morphisms

universe u v

/-- A map preserves a displayed relation. -/
def PreservesRelation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  LRA.Order.Monotone sourceRelation targetRelation map

end LRA.Map.Morphisms
