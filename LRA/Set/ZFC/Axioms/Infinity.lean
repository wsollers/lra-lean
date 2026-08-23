import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                               
axiom Infinity :
  ∃ A : ZFCSet,
    (∃ empty : ZFCSet, empty ∈ A ∧ ∀ w : ZFCSet, w ∉ empty) ∧
    ∀ x : ZFCSet, x ∈ A →
      ∃ successor : ZFCSet,
        successor ∈ A ∧
        ∀ w : ZFCSet, w ∈ successor ↔ w ∈ x ∨ w = x

end LRA.Set.ZFC
