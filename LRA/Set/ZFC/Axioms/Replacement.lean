import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                                                    
axiom Replacement (relation : ZFCSet → ZFCSet → Prop) (A : ZFCSet) :
  (∀ x : ZFCSet, x ∈ A →
    ∃ y : ZFCSet, relation x y ∧
      ∀ other : ZFCSet, relation x other → other = y) →
    ∃ B : ZFCSet,
      ∀ y : ZFCSet, y ∈ B ↔ ∃ x : ZFCSet, x ∈ A ∧ relation x y

end LRA.Set.ZFC
