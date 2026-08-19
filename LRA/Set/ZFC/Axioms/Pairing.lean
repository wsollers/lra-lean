import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/-- For any two sets, there exists a set containing exactly those two sets. -/
axiom Pairing (A B : ZFCSet) :
  ∃ C : ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B

end LRA.Set.ZFC
