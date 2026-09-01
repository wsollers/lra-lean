import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
