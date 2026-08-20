import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/-- For any two sets, there exists a set containing exactly those two sets. -/
axiom Pairing (A B : TGSet) :
  exists C : TGSet, forall x : TGSet, x ∈ C <-> x = A \/ x = B

end LRA.Set.TG
