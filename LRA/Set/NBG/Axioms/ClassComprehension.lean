import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- NBG class-comprehension schema, represented by a Lean predicate parameter. -/
axiom ClassComprehension (property : NBGSet -> Prop) :
  exists C : NBGClass, forall x : NBGSet, x ∈ C <-> property x

end LRA.Set.NBG
