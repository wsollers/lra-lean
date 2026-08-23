import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                                    
axiom Union (A : TGSet) :
  exists U : TGSet, forall x : TGSet, x ∈ U <-> exists B : TGSet, B ∈ A /\ x ∈ B

end LRA.Set.TG
