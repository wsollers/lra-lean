import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

/-- Every nonempty set has an ∈-minimal member. -/
axiom Foundation (A : ZFCSet) :
  (∃ w : ZFCSet, w ∈ A) →
    ∃ x : ZFCSet, x ∈ A ∧ ∀ y : ZFCSet, y ∈ x → y ∉ A

end LRA.Set.ZFC
