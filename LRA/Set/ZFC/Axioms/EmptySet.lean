import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/-- There exists a set with no members. -/
axiom EmptySet : ∃ A : ZFCSet, ∀ x : ZFCSet, x ∉ A

end LRA.Set.ZFC
