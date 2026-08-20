import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- For any two sets, there exists a set containing exactly those two sets. -/
axiom Pairing (A B : NBGSet) :
  exists C : NBGSet, forall x : NBGSet, x ∈ C <-> x = A \/ x = B

end LRA.Set.NBG
