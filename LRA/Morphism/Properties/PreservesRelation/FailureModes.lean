import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Morphism

universe u v

                                                      
def FailsPreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ PreservesRelation function sourceRelation targetRelation

end LRA.Morphism
