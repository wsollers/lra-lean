
import Mathlib.Data.EReal.Basic
import Mathlib.Data.NNReal.Basic
import Mathlib.Data.ENNReal.Basic
import LRA.NumberSystems.RealNumbers.Extended
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Extended

/--
`NonNegativeRealMathlibBridgeExists` TODO

Predicate logic:

  Exists fun toNNReal => Exists fun fromNNReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromNNReal (toNNReal value) = value) ∧ ((∀ (value : NNReal), toNNReal (fromNNReal value) = value) ∧ ((∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.le LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ NNReal.instPartialOrder.le (toNNReal first) (toNNReal second)) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), toNNReal (LRA.NumberSystems.RealNumbers.Extended.add LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second) = instHAdd.hAdd (toNNReal first) (toNNReal second)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun toNNReal => Exists fun fromNNReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromNNReal (toNNReal value) = value) ∧ ((∀ (value : NNReal), toNNReal (fromNNReal value) = value) ∧ ((∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.le LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ NNReal.instPartialOrder.le (toNNReal first) (toNNReal second)) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), toNNReal (LRA.NumberSystems.RealNumbers.Extended.add LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second) = instHAdd.hAdd (toNNReal first) (toNNReal second)))))

Logical form (Lean):

```lean
theorem NonNegativeRealMathlibBridgeExists :
    ∃ toNNReal : NonNegativeReal mathlibRealModel → NNReal,
    ∃ fromNNReal : NNReal → NonNegativeReal mathlibRealModel,
      (∀ value, fromNNReal (toNNReal value) = value) ∧
      (∀ value, toNNReal (fromNNReal value) = value) ∧
      (∀ first second, le mathlibRealModel first second ↔
        toNNReal first ≤ toNNReal second) ∧
      (∀ first second,
        toNNReal (add mathlibRealModel first second) =
          toNNReal first + toNNReal second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem NonNegativeRealMathlibBridgeExists :
    ∃ toNNReal : NonNegativeReal mathlibRealModel → NNReal,
    ∃ fromNNReal : NNReal → NonNegativeReal mathlibRealModel,
      (∀ value, fromNNReal (toNNReal value) = value) ∧
      (∀ value, toNNReal (fromNNReal value) = value) ∧
      (∀ first second, le mathlibRealModel first second ↔
        toNNReal first ≤ toNNReal second) ∧
      (∀ first second,
        toNNReal (add mathlibRealModel first second) =
          toNNReal first + toNNReal second) := by
  sorry
/--
`ExtendedRealMathlibBridgeExists` TODO

Predicate logic:

  Exists fun toEReal => Exists fun fromEReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromEReal (toEReal value) = value) ∧ ((∀ (value : EReal), toEReal (fromEReal value) = value) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.nonstrict_order LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ instPartialOrderEReal.le (toEReal first) (toEReal second))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun toEReal => Exists fun fromEReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromEReal (toEReal value) = value) ∧ ((∀ (value : EReal), toEReal (fromEReal value) = value) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.nonstrict_order LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ instPartialOrderEReal.le (toEReal first) (toEReal second))))

Logical form (Lean):

```lean
theorem ExtendedRealMathlibBridgeExists :
    ∃ toEReal : ExtendedReal mathlibRealModel → EReal,
    ∃ fromEReal : EReal → ExtendedReal mathlibRealModel,
      (∀ value, fromEReal (toEReal value) = value) ∧
      (∀ value, toEReal (fromEReal value) = value) ∧
      (∀ first second,
        nonstrict_order mathlibRealModel first second ↔
          toEReal first ≤ toEReal second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem ExtendedRealMathlibBridgeExists :
    ∃ toEReal : ExtendedReal mathlibRealModel → EReal,
    ∃ fromEReal : EReal → ExtendedReal mathlibRealModel,
      (∀ value, fromEReal (toEReal value) = value) ∧
      (∀ value, toEReal (fromEReal value) = value) ∧
      (∀ first second,
        nonstrict_order mathlibRealModel first second ↔
          toEReal first ≤ toEReal second) := by
  sorry
/--
`NonNegativeExtendedRealMathlibBridgeExists` TODO

Predicate logic:

  Exists fun toENNReal => Exists fun fromENNReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromENNReal (toENNReal value) = value) ∧ ((∀ (value : ENNReal), toENNReal (fromENNReal value) = value) ∧ ((∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.leExtended LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ ENNReal.instLE.le (toENNReal first) (toENNReal second)) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), toENNReal (LRA.NumberSystems.RealNumbers.Extended.addExtended LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second) = instHAdd.hAdd (toENNReal first) (toENNReal second)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun toENNReal => Exists fun fromENNReal => ((∀ (value : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), fromENNReal (toENNReal value) = value) ∧ ((∀ (value : ENNReal), toENNReal (fromENNReal value) = value) ∧ ((∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.leExtended LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second ↔ ENNReal.instLE.le (toENNReal first) (toENNReal second)) ∧ (∀ (first second : LRA.NumberSystems.RealNumbers.Extended.NonNegativeExtendedReal LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel), toENNReal (LRA.NumberSystems.RealNumbers.Extended.addExtended LRA.NumberSystems.RealNumbers.Interface.ModelTheory.mathlibRealModel first second) = instHAdd.hAdd (toENNReal first) (toENNReal second)))))

Logical form (Lean):

```lean
theorem NonNegativeExtendedRealMathlibBridgeExists :
    ∃ toENNReal : NonNegativeExtendedReal mathlibRealModel → ENNReal,
    ∃ fromENNReal : ENNReal → NonNegativeExtendedReal mathlibRealModel,
      (∀ value, fromENNReal (toENNReal value) = value) ∧
      (∀ value, toENNReal (fromENNReal value) = value) ∧
      (∀ first second, leExtended mathlibRealModel first second ↔
        toENNReal first ≤ toENNReal second) ∧
      (∀ first second,
        toENNReal (addExtended mathlibRealModel first second) =
          toENNReal first + toENNReal second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem NonNegativeExtendedRealMathlibBridgeExists :
    ∃ toENNReal : NonNegativeExtendedReal mathlibRealModel → ENNReal,
    ∃ fromENNReal : ENNReal → NonNegativeExtendedReal mathlibRealModel,
      (∀ value, fromENNReal (toENNReal value) = value) ∧
      (∀ value, toENNReal (fromENNReal value) = value) ∧
      (∀ first second, leExtended mathlibRealModel first second ↔
        toENNReal first ≤ toENNReal second) ∧
      (∀ first second,
        toENNReal (addExtended mathlibRealModel first second) =
          toENNReal first + toENNReal second) := by
  sorry
end LRA.NumberSystems.RealNumbers.Interop.Mathlib
