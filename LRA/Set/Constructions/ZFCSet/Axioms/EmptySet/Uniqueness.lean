import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  sorry

theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
