import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem SeparatedSubsetIsUnique
    {A : Set} {property : Set → Prop} {B C : Set}
    (BIsSeparatedSubset : IsSeparatedSubset A property B)
    (CIsSeparatedSubset : IsSeparatedSubset A property C) :
    C = B := by
  sorry

theorem SeparatedSubsetExistsAndIsUnique (A : Set) (property : Set → Prop) :
    ExistsAndUnique (fun B : Set => IsSeparatedSubset A property B) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
