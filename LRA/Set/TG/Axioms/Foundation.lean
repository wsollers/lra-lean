import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                    
axiom Foundation (A : TGSet) :
  (exists w : TGSet, w ∈ A) ->
    exists x : TGSet, x ∈ A /\ forall y : TGSet, y ∈ x -> y ∉ A

end LRA.Set.TG
