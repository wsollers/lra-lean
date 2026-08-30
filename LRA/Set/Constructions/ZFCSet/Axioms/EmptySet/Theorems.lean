import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Axiom
import LRA.Set.Constructions.ZFCSet.Axioms.Definitions
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  exact  EmptySet

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

noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
