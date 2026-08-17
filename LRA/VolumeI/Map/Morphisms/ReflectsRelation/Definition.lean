import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Map.Morphisms

universe u v

/-- A map reflects a relation when target-related mapped values came from source-related values. -/
def ReflectsRelation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  forall left right,
    targetRelation (map left) (map right) -> sourceRelation left right

end LRA.Map.Morphisms
