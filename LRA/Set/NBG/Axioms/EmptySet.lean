import LRA.Set.NBGSet.Primitives

namespace LRA.Set.NBG

/-- There exists a set with no members. -/
axiom EmptySet : exists A : NBGSet, forall x : NBGSet, x ∉ A

end LRA.Set.NBG
