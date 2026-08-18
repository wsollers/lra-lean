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
  have pairing := Pairing x1 x2
  exact pairing

/-- Any pair set of `x1` and `x2` is equal to any other pair set of them. -/
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  apply Extensionality
  intro x
  constructor
  · intro xInG
    have xInX1OrX2 := GIsPairSet x
    have xInP := PIsPairSet x
    have xInPOrX1OrX2 := xInX1OrX2.mp xInG
    cases xInPOrX1OrX2 with
    | inl xEqX1 =>
      apply xInP.mpr
      left
      exact xEqX1
    | inr xEqX2 =>
      apply xInP.mpr
      right
      exact xEqX2
  · intro xInP
    have xInX1OrX2 := PIsPairSet x
    have xInG := GIsPairSet x
    have xInGOrX1OrX2 := xInX1OrX2.mp xInP
    cases xInGOrX1OrX2 with
    | inl xEqX1 =>
      apply xInG.mpr
      left
      exact xEqX1
    | inr xEqX2 =>
      apply xInG.mpr
      right
      exact xEqX2

/-- TeX label: `thm:pairing-output-exists-unique`.
For any two sets, there exists exactly one pair set. -/
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  constructor
  · have pairing := PairSetExists x1 x2
    exact pairing
  · intro P G PIsPairSet GIsPairSet
    exact PairSetIsUnique GIsPairSet PIsPairSet

/-- The chosen pair set of `x1` and `x2`. -/
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

/-- Membership in the chosen pair set. -/
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  have pairing := PairSetExists x1 x2
  have pairingSpec := Classical.choose_spec pairing
  exact pairingSpec w

/-- Every pair set equals the chosen pair set. -/
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  have pairing := PairSetExists x1 x2
  have pairingSpec := Classical.choose_spec pairing
  exact PairSetIsUnique pairingSpec PIsPairSet

/-- The singleton of `x` is the pair set of `x` with itself. -/
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x

/-- The chosen singleton of `x` has `x` as its only member. -/
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  unfold IsSingletonSet
  unfold TheSingleton
  have pairing := PairSet x x
  intro w
  constructor
  · intro wInPairSet
    have wInXOrX := PairSetMembership x x w
    have wEqXOrWEqX := wInXOrX.mp wInPairSet
    cases wEqXOrWEqX with
    | inl wEqX =>
      exact wEqX
    | inr wEqX =>
      exact wEqX
  · intro wEqX
    have wInXOrX := PairSetMembership x x w
    have wInPairSet := wInXOrX.mpr (Or.inl wEqX)
    exact wInPairSet

end LRA.Set.ZFC
