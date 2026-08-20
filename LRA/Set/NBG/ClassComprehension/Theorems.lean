import LRA.Set.NBG.Axioms.ClassComprehension
import LRA.Set.NBG.Definitions

namespace LRA.Set.NBG

theorem ClassComprehensionExists (property : Set -> Prop) :
    exists C : Class, IsClassComprehension property C := by
  sorry

noncomputable def TheClassComprehension (property : Set -> Prop) : Class :=
  Classical.choose (ClassComprehensionExists property)

theorem TheClassComprehensionIsClassComprehension (property : Set -> Prop) :
    IsClassComprehension property (TheClassComprehension property) := by
  sorry

end LRA.Set.NBG
