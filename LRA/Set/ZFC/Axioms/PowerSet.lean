import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                 
axiom PowerSet (A : ZFCSet) :
  ∃ P : ZFCSet, ∀ x : ZFCSet, x ∈ P ↔ ∀ y : ZFCSet, y ∈ x → y ∈ A

end LRA.Set.ZFC
