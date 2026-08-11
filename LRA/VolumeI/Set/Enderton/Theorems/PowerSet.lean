import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen power set.
-/

namespace LRA.VolumeI.Set.Enderton

/-- There exists a power set of `A`. -/
theorem PowerSetOfExists (A : Set) :
    ∃ P : Set, IsPowerSetOf A P := by
  sorry

/-- Any power set of `A` is equal to any other power set of `A`. -/
theorem PowerSetOfIsUnique
    {A P Q : Set}
    (PIsPowerSetOf : IsPowerSetOf A P)
    (QIsPowerSetOf : IsPowerSetOf A Q) :
    Q = P := by
  sorry

/-- TeX label: `thm:power-set-output-exists-unique`.

For any set, there exists exactly one power set of it. -/
theorem PowerSetOfExistsAndIsUnique (A : Set) :
    ExistsAndUnique (fun P : Set => IsPowerSetOf A P) := by
  sorry

/-- The power set of `A`, chosen after its existence has been established. -/
noncomputable def ThePowerSet (A : Set) : Set :=
  Classical.choose (PowerSetOfExists A)

/-- The chosen power set of `A` has the expected members. -/
theorem ThePowerSetIsPowerSetOf (A : Set) :
    IsPowerSetOf A (ThePowerSet A) := by
  sorry

/-- Every power set of `A` is equal to the chosen power set of `A`. -/
theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A := by
  sorry

end LRA.VolumeI.Set.Enderton
