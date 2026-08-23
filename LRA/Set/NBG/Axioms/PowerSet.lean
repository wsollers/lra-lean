import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

                                 
axiom PowerSet (A : NBGSet) :
  exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A

end LRA.Set.NBG
