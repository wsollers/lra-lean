import LRA.Function.Properties.Definition
import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

                                                                   
def PreservesAndReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  PreservesRelation function sourceRelation targetRelation ∧
    ReflectsRelation function sourceRelation targetRelation

                                                                             
                          
def RelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  LRA.Function.Injective function ∧
    PreservesAndReflectsRelation function sourceRelation targetRelation

end LRA.Morphism
