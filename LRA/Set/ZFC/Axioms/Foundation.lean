import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                                  
axiom Foundation (A : ZFCSet) :
  (∃ w : ZFCSet, w ∈ A) →
    ∃ x : ZFCSet, x ∈ A ∧ ∀ y : ZFCSet, y ∈ x → y ∉ A

end LRA.Set.ZFC
