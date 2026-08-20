import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- Every set has a power set. -/
axiom PowerSet (A : NBGSet) :
  exists P : NBGSet, forall x : NBGSet, x ∈ P <-> forall y : NBGSet, y ∈ x -> y ∈ A

end LRA.Set.NBG
