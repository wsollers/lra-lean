import LRA.Set.TG.Axioms.PowerSet
import LRA.Set.TG.Definitions
import LRA.Set.TG.Extensionality.Theorems

namespace LRA.Set.TG

theorem PowerSetOfExists (A : Set) : exists P : Set, IsPowerSetOf A P := by
  sorry


theorem PowerSetOfIsUnique {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)

theorem ThePowerSetIsPowerSetOf (A : Set) : IsPowerSetOf A (ThePowerSet A) := by
  sorry

end LRA.Set.TG
