import LRA.Set.Constructions.NBGSet.Axioms.EmptySet.Existence
import LRA.Set.Constructions.NBGSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.NBGSet.Axioms

theorem EmptySetIsUnique {A B : Set} (AIsEmpty : IsEmptySet A) (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

theorem EmptySetExistsAndIsUnique : ExistsAndUnique IsEmptySet := by
  sorry

end LRA.Set.Constructions.NBGSet.Axioms
