import LRA.Set.Constructions.ZFCSet.Axioms.Replacement.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EveryReplacementImageEqualsTheReplacementImage
    {A : Set} {relation : Set → Set → Prop}
    (functional : IsFunctionalOn A relation)
    {B : Set}
    (BIsReplacementImageOf : IsReplacementImageOf A relation B) :
    B = TheReplacementImage A relation functional := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
