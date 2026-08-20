import LRA.Set.NBG.Axioms.EmptySet
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems

namespace LRA.Set.NBG

theorem EmptySetExists : exists A : Set, IsEmptySet A := by
  sorry


theorem EmptySetIsUnique {A B : Set} (AIsEmpty : IsEmptySet A) (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry


theorem EmptySetExistsAndIsUnique : ExistsAndUnique IsEmptySet := by
  sorry

noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet := by
  sorry

end LRA.Set.NBG
