import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/-- For every set of sets, there exists the union of its members. -/
axiom Union (A : ZFCSet) :
  ∃ U : ZFCSet, ∀ x : ZFCSet, x ∈ U ↔ ∃ B : ZFCSet, B ∈ A ∧ x ∈ B

end LRA.Set.ZFC
