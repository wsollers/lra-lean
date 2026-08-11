-- LRA/VolumeI/Algebra/Models/CharacteristicCardinality.lean
-- Characteristic and cardinality obligations for the number-system tower.

import LRA.VolumeI.Algebra.Models.Models

namespace LRA.VolumeI.Algebra.Models.CharacteristicCardinality

/-!
Volume II label: characteristic-and-cardinality
Lean module: LRA.VolumeI.Algebra.Models.CharacteristicCardinality
Source: docs/number-systems/gpt-09a-characteristic-cardinality.md
Verification status: statement-accepted-proof-pending
-/
/--
`CharacteristicZero` exposes this formal declaration.

Logical form:

```lean
def CharacteristicZero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.addition previous signature.one)
        n ≠ signature.zero
```
-/

def CharacteristicZero (signature : OrderedRingSignature) : Prop :=
  ∀ n : Nat,
    n ≠ 0 →
      Nat.rec signature.zero
        (fun _ previous => signature.addition previous signature.one)
        n ≠ signature.zero
/--
`Countable` exposes this formal declaration.

Logical form:

```lean
def Countable (α : Type u) : Prop :=
  ∃ enumerate : Nat → α, ∀ value : α, ∃ index, enumerate index = value
```
-/

def Countable (α : Type u) : Prop :=
  ∃ enumerate : Nat → α, ∀ value : α, ∃ index, enumerate index = value
/--
`Uncountable` exposes this formal declaration.

Logical form:

```lean
def Uncountable (α : Type u) : Prop :=
  ¬ Countable α
```
-/

def Uncountable (α : Type u) : Prop :=
  ¬ Countable α
/--
`IntegerRationalRealHaveCharacteristicZero` exposes this formal declaration.

Logical form:

```lean
theorem IntegerRationalRealHaveCharacteristicZero
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) :
    CharacteristicZero SelectedIntegerModel.signature ∧
      CharacteristicZero SelectedRationalModel.signature.toOrderedRingSignature ∧
      CharacteristicZero SelectedRealModel.signature.toOrderedRingSignature
```
-/

theorem IntegerRationalRealHaveCharacteristicZero
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) :
    CharacteristicZero SelectedIntegerModel.signature ∧
      CharacteristicZero SelectedRationalModel.signature.toOrderedRingSignature ∧
      CharacteristicZero SelectedRealModel.signature.toOrderedRingSignature := by
  sorry
/--
`RationalsAreCountable` exposes this formal declaration.

Logical form:

```lean
theorem RationalsAreCountable
    (SelectedRationalModel : RationalModel) :
    Countable SelectedRationalModel.signature.carrier
```
-/

theorem RationalsAreCountable
    (SelectedRationalModel : RationalModel) :
    Countable SelectedRationalModel.signature.carrier := by
  sorry
/--
`RealsAreUncountable` exposes this formal declaration.

Logical form:

```lean
theorem RealsAreUncountable
    (SelectedRealModel : RealModel) :
    Uncountable SelectedRealModel.signature.carrier
```
-/

theorem RealsAreUncountable
    (SelectedRealModel : RealModel) :
    Uncountable SelectedRealModel.signature.carrier := by
  sorry

end LRA.VolumeI.Algebra.Models.CharacteristicCardinality
