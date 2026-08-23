import LRA.Relation.Definition

namespace LRA.Morphism

universe u v

                                                                              
       

                                                                                
                                                                               
                                      
def PreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ∀ left right,
    sourceRelation left right → targetRelation (function left) (function right)

end LRA.Morphism
