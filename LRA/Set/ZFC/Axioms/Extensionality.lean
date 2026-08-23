import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                            
axiom Extensionality (A B : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A ↔ x ∈ B) → A = B

end LRA.Set.ZFC
