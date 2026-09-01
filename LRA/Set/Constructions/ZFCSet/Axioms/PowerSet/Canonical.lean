import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Uniqueness

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)

theorem ThePowerSetIsPowerSetOf (A : Set) :
    IsPowerSetOf A (ThePowerSet A) := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
