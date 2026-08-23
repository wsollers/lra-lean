import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                                    
axiom Replacement (relation : TGSet -> TGSet -> Prop) (A : TGSet) :
  (forall x : TGSet, x ∈ A ->
    exists y : TGSet, relation x y /\
      forall other : TGSet, relation x other -> other = y) ->
    exists B : TGSet,
      forall y : TGSet, y ∈ B <-> exists x : TGSet, x ∈ A /\ relation x y

end LRA.Set.TG
