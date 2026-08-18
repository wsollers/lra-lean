import LRA.VolumeI.Function.Morphisms.ReflectsRelation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- Failure of relation reflection by a map. -/
def FailsReflectsRelation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  Not (ReflectsRelation map sourceRelation targetRelation)

end LRA.Function.Morphisms
