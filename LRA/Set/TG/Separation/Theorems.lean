import LRA.Set.TG.Axioms.Separation
import LRA.Set.TG.Definitions
import LRA.Set.TG.Extensionality.Theorems

namespace LRA.Set.TG

theorem SeparatedSubsetExists (A : Set) (property : Set -> Prop) :
    exists B : Set, IsSeparatedSubset A property B := by
  sorry


theorem SeparatedSubsetIsUnique {A : Set} {property : Set -> Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

noncomputable def TheSeparatedSubset (A : Set) (property : Set -> Prop) : Set :=
  Classical.choose (SeparatedSubsetExists A property)

theorem TheSeparatedSubsetIsSeparatedSubset (A : Set) (property : Set -> Prop) :
    IsSeparatedSubset A property (TheSeparatedSubset A property) := by
  sorry

end LRA.Set.TG
