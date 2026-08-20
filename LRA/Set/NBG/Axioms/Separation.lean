import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- Separation schema, represented by a Lean predicate parameter. -/
axiom Separation (property : NBGSet -> Prop) (A : NBGSet) :
  exists B : NBGSet, forall x : NBGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.NBG
