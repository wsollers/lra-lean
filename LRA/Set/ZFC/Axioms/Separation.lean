import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/-- Separation schema, represented by a Lean predicate parameter. -/
axiom Separation (property : ZFCSet → Prop) (A : ZFCSet) :
  ∃ B : ZFCSet, ∀ x : ZFCSet, x ∈ B ↔ x ∈ A ∧ property x

end LRA.Set.ZFC
