
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

  ∃ toEReal ∈ ExtendedReal mathlibRealModel → EReal, ∃ fromEReal ∈ EReal → ExtendedReal mathlibRealModel, (∀ value, fromEReal (toEReal value) = value) ∧ (∀ value, toEReal (fromEReal value) = value) ∧ (∀ first second, nonstrict_order mathlibRealModel first second ↔ toEReal first ≤ toEReal second)

Predicate logic (unfolded):

  Exists fun toEReal => Exists fun fromEReal => (∀ (value : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel), fromEReal (toEReal value) = value ∧ (∀ (value : EReal), toEReal (fromEReal value) = value ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => ((Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → False) → (fun x => (fun x x_1 => Prop) x second) t) → (fun x => (fun x x_1 => Prop) x second) t) (fun «else» => (fun x => True) second) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 6 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second) value) (fun «else» => «else» ⋯) first fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 4 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) first x) t) → (fun x => (fun x x_1 => Prop) first x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first) second fun h => (fun x x_1 => False) first second ↔ instPartialOrderEReal.toLE.1 (toEReal first) (toEReal second)))

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
