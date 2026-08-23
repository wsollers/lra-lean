import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                                                                 
axiom ClassComprehension (property : NBGSet -> Prop) :
  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x

end LRA.Set.NBG
