import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                    
axiom Foundation (A : NBGSet) :
  (exists w : NBGSet, w ∈ A) ->
    exists x : NBGSet, x ∈ A /\ forall y : NBGSet, y ∈ x -> y ∉ A

end LRA.Set.NBG
