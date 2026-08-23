import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                                      
axiom Choice (A : NBGSet) :
  (forall B : NBGSet, B ∈ A -> exists x : NBGSet, x ∈ B) ->
  (forall B C : NBGSet,
    B ∈ A -> C ∈ A -> B ≠ C ->
      forall x : NBGSet, x ∈ B -> x ∉ C) ->
    exists choiceSet : NBGSet,
      forall B : NBGSet, B ∈ A ->
        exists x : NBGSet,
          (x ∈ B /\ x ∈ choiceSet) /\
          forall other : NBGSet,
            (other ∈ B /\ other ∈ choiceSet) -> other = x

end LRA.Set.NBG
