import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                 
axiom PowerSet (A : TGSet) :
  exists P : TGSet, forall x : TGSet, x ∈ P <-> forall y : TGSet, y ∈ x -> y ∈ A

end LRA.Set.TG
