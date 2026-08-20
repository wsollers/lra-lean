import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- For every set of sets, there exists the union of its members. -/
axiom Union (A : NBGSet) :
  exists U : NBGSet, forall x : NBGSet, x ∈ U <-> exists B : NBGSet, B ∈ A /\ x ∈ B

end LRA.Set.NBG
