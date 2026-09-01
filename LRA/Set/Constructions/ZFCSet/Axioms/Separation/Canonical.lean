import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheSeparatedSubset (A : Set) (property : Set → Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set → Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
