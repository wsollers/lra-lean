import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Morphisms.PreservesRelation.Definition
import LRA.VolumeI.Function.Morphisms.ReflectsRelation.Definition

namespace LRA.Function.Morphisms

universe u v

/-- A map both preserves and reflects a displayed relation. -/
def PreservesAndReflectsRelation {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  PreservesRelation map sourceRelation targetRelation /\
    ReflectsRelation map sourceRelation targetRelation

/--
A relation embedding is an injective map that preserves and reflects the
displayed relation.
-/
def RelationEmbedding {Source : Type u} {Target : Type v}
    (map : Source -> Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  LRA.Function.Injective.Injective map /\
    PreservesAndReflectsRelation map sourceRelation targetRelation

end LRA.Function.Morphisms
