import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                                              
axiom Pairing (A B : TGSet) :
  exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A \/ x = B

end LRA.Set.TG
