import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                                    
axiom Replacement (relation : NBGSet -> NBGSet -> Prop) (A : NBGSet) :
  (forall x : NBGSet, x ∈ A ->
    exists y : NBGSet, relation x y /\
      forall other : NBGSet, relation x other -> other = y) ->
    exists B : NBGSet,
      forall y : NBGSet, y ∈ B <-> exists x : NBGSet, x ∈ A /\ relation x y

end LRA.Set.NBG
