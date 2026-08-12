import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Set.Enderton.Definitions
import LRA.VolumeI.Set.Enderton.Theorems.Extensionality

/-!
Existence, uniqueness, and the chosen Enderton pair set.
-/

namespace LRA.VolumeI.Set.Enderton
/--
For any two sets, there exists a set containing exactly those two sets.

Logical form:

```lean
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P
```
-/
theorem PairSetExists (x1 x2 : Set) :
    ∃ P : Set, IsPairSet x1 x2 P := by
  have pairing := Pairing x1 x2
  exact pairing

/--
Any pair set of `x1` and `x2` is equal to any other pair set of them.

Logical form:

```lean
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P
```
-/
theorem PairSetIsUnique
    {x1 x2 P G : Set}
    (PIsPairSet : IsPairSet x1 x2 P)
    (GIsPairSet : IsPairSet x1 x2 G) :
    G = P := by
  apply Extensionality
  intro x
  constructor
  · -- mp
    intro xInG
    have xInX1OrX2 := GIsPairSet x
    have xInP := PIsPairSet x
    have xInPOrX1OrX2 := xInX1OrX2.mp xInG
    cases xInPOrX1OrX2 with
    | inl xEqX1 =>
      apply xInP.mpr
      left
      exact xEqX1
      -- done
    | inr xEqX2 =>
      apply xInP.mpr
      right
      exact xEqX2
  . -- mpr
    intro xInP
    have xInX1OrX2 := PIsPairSet x
    have xInG := GIsPairSet x
    have xInGOrX1OrX2 := xInX1OrX2.mp xInP
    cases xInGOrX1OrX2 with
    | inl xEqX1 =>
      apply xInG.mpr
      left
      exact xEqX1
      -- done
    | inr xEqX2 =>
      apply xInG.mpr
      right
      exact xEqX2




/-- TeX label: `thm:pairing-output-exists-unique`.

For any two sets, there exists exactly one set whose members are precisely
those two sets. Its proof combines `PairSetExists` with `PairSetIsUnique`.

Logical form:

```lean
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P)
```
-/
theorem PairingOutputExistsAndIsUnique (x1 x2 : Set) :
    ExistsAndUnique (fun P : Set => IsPairSet x1 x2 P) := by
  constructor
  · -- exists
    have pairing := PairSetExists x1 x2
    exact pairing
  · -- unique
    intro P G PIsPairSet GIsPairSet
    exact PairSetIsUnique GIsPairSet PIsPairSet


/-- The pair set of `x1` and `x2`, chosen after its existence has been
established.

Logical form:

```lean
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)
```
-/
noncomputable def PairSet (x1 x2 : Set) : Set :=
  Classical.choose (PairSetExists x1 x2)

/-- Membership in the chosen pair set means equality to one of its two given
sets.

Logical form:

```lean
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2
```
-/
theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  have pairing := PairSetExists x1 x2
  have pairingSpec := Classical.choose_spec pairing
  exact pairingSpec w
/--
Every pair set of `x1` and `x2` is equal to the chosen pair set.

Logical form:

```lean
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2
```
-/
theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  have pairing := PairSetExists x1 x2
  have pairingSpec := Classical.choose_spec pairing
  exact PairSetIsUnique pairingSpec PIsPairSet
/--
The singleton of `x` is the pair set of `x` with itself.

Logical form:

```lean
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x
```
-/
noncomputable def TheSingleton (x : Set) : Set :=
  PairSet x x
/--
The chosen singleton of `x` has `x` as its only member.

Logical form:

```lean
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x)
```
-/
theorem TheSingletonIsSingletonSet (x : Set) :
    IsSingletonSet x (TheSingleton x) := by
  unfold IsSingletonSet
  unfold TheSingleton
  have pairing := PairSet x x
  intro w
  constructor
  · -- mp
    intro wInPairSet
    have wInXOrX := PairSetMembership x x w
    have wEqXOrWEqX := wInXOrX.mp wInPairSet
    cases wEqXOrWEqX with
    | inl wEqX =>
      exact wEqX
    | inr wEqX =>
      exact wEqX
  . -- mpr
    intro wEqX
    have wInXOrX := PairSetMembership x x w
    have wInPairSet := wInXOrX.mpr (Or.inl wEqX)
    exact wInPairSet







end LRA.VolumeI.Set.Enderton
