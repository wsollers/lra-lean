import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                                                    
axiom Union (A : ZFCSet) :
  ∃ U : ZFCSet, ∀ x : ZFCSet, x ∈ U ↔ ∃ B : ZFCSet, B ∈ A ∧ x ∈ B

end LRA.Set.ZFC
