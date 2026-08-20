import LRA.Set.ZFC.Axioms.Pairing
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

/-!
Existence, uniqueness, and the chosen ZFC pair set.
-/

namespace LRA.Set.ZFC

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
For any two sets, there exists exactly one pair set. -/
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  sorry

/-- The chosen pair set of `x1` and `x2`. -/
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

/-- Membership in the chosen pair set. -/
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  sorry

/-- Every pair set equals the chosen pair set. -/
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

end LRA.Set.ZFC
