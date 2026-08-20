import LRA.Set.TGSet.Primitives

namespace LRA.Set.TG

/-- There exists a set with no members. -/
axiom EmptySet : exists A : TGSet, forall x : TGSet, x ∉ A

end LRA.Set.TG
