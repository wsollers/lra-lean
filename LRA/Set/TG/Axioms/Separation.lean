import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

                                                                    
axiom Separation (property : TGSet -> Prop) (A : TGSet) :
  exists B : TGSet, forall x : TGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.TG
