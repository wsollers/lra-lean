import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen Enderton pair set.
-/

namespace LRA.VolumeI.Set.Enderton

/-- For any two sets, there exists a set containing exactly those two sets. -/
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P := by
  sorry

/-- Any pair set of `x1` and `x2` is equal to any other pair set of them. -/
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  sorry

/-- TeX label: `thm:pairing-output-exists-unique`.

For any two sets, there exists exactly one set whose members are precisely
those two sets. Its proof combines `PairSetExists` with `PairSetIsUnique`. -/
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

/-- The pair set of `x1` and `x2`, chosen after its existence has been
established. -/
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

/-- Membership in the chosen pair set means equality to one of its two given
sets. -/
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  sorry

/-- Every pair set of `x1` and `x2` is equal to the chosen pair set. -/
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  sorry

/-- The singleton of `x` is the pair set of `x` with itself. -/
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x

/-- The chosen singleton of `x` has `x` as its only member. -/
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  sorry

end LRA.VolumeI.Set.Enderton
