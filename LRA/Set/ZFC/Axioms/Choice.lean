import LRA.Set.ZFCSet.Primitives

namespace LRA.Set.ZFC

                                                                      
axiom Choice (A : ZFCSet) :
  (∀ B : ZFCSet, B ∈ A → ∃ x : ZFCSet, x ∈ B) →
  (∀ B C : ZFCSet,
    B ∈ A → C ∈ A → B ≠ C →
      ∀ x : ZFCSet, x ∈ B → x ∉ C) →
    ∃ choiceSet : ZFCSet,
      ∀ B : ZFCSet, B ∈ A →
        ∃ x : ZFCSet,
          (x ∈ B ∧ x ∈ choiceSet) ∧
          ∀ other : ZFCSet,
            (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.Set.ZFC
