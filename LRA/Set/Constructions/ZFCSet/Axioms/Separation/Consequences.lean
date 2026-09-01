import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EverySeparatedSubsetEqualsTheSeparatedSubset
    {A : Set} {property : Set → Prop} {B : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B) :
    B = TheSeparatedSubset A property := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
