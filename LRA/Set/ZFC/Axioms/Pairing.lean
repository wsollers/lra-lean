import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                                                              
axiom Pairing (A B : ZFCSet) :
  ∃ C : ZFCSet, ∀ x : ZFCSet, x ∈ C ↔ x = A ∨ x = B

end LRA.Set.ZFC
