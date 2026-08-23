import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                                    
axiom Separation (property : NBGSet -> Prop) (A : NBGSet) :
  exists B : NBGSet, forall x : NBGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.NBG
