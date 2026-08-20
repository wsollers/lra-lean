import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/-- Separation schema, represented by a Lean predicate parameter. -/
axiom Separation (property : TGSet -> Prop) (A : TGSet) :
  exists B : TGSet, forall x : TGSet, x ∈ B <-> x ∈ A /\ property x

end LRA.Set.TG
