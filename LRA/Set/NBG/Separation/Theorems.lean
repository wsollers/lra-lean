import LRA.Set.NBG.Axioms.Separation
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

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

end LRA.Set.NBG
