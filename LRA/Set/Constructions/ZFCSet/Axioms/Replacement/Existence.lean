import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem ReplacementImageExists
    (A : Set) (relation : Set → Set → Prop)
    (functional : IsFunctionalOn A relation) :
    ∃ B : Set, IsReplacementImageOf A relation B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
