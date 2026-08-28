
import Mathlib.Data.NNReal.Basic
import Mathlib.Data.ENNReal.Basic
import LRA.NumberSystems.RealNumbers.Interop.NonNegative
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interop.Mathlib

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.NonNegative

/--
`NonNegativeRealMathlibBridgeExists` TODO

Predicate logic:

  ∃ toNNReal ∈ NonNegativeReal mathlibRealModel → NNReal, ∃ fromNNReal ∈ NNReal → NonNegativeReal mathlibRealModel, (∀ value, fromNNReal (toNNReal value) = value) ∧ (∀ value, toNNReal (fromNNReal value) = value) ∧ (∀ first second, le mathlibRealModel first second ↔ toNNReal first ≤ toNNReal second) ∧ (∀ first second, toNNReal (add mathlibRealModel first second) = toNNReal first + toNNReal second)

Predicate logic (unfolded):

  Exists fun toNNReal => Exists fun fromNNReal => (∀ (value : Subtype fun value => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2 value), fromNNReal (toNNReal value) = value ∧ (∀ (value : NNReal), toNNReal (fromNNReal value) = value ∧ (∀ (first second : Subtype fun value => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2 value), LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first.1 second.1 ↔ NNReal.instPartialOrder.toLE.1 (toNNReal first) (toNNReal second) ∧ ∀ (first second : Subtype fun value => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2 value), toNNReal ⟨LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toBooleanRingOperationBundle.2 first.1 second.1, ⋯⟩ = instHAdd.1 (toNNReal first) (toNNReal second))))

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
`NonNegativeExtendedRealMathlibBridgeExists` TODO

Predicate logic:

  ∃ toENNReal ∈ NonNegativeExtendedReal mathlibRealModel → ENNReal, ∃ fromENNReal ∈ ENNReal → NonNegativeExtendedReal mathlibRealModel, (∀ value, fromENNReal (toENNReal value) = value) ∧ (∀ value, toENNReal (fromENNReal value) = value) ∧ (∀ first second, leExtended mathlibRealModel first second ↔ toENNReal first ≤ toENNReal second) ∧ (∀ first second, toENNReal (addExtended mathlibRealModel first second) = toENNReal first + toENNReal second)

Predicate logic (unfolded):

  Exists fun toENNReal => Exists fun fromENNReal => (∀ (value : Subtype fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x value) t) → (fun x => (fun x x_1 => Prop) x value) t) (fun «else» => (fun x => True) value) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) value) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) value), fromENNReal (toENNReal value) = value ∧ (∀ (value : ENNReal), toENNReal (fromENNReal value) = value ∧ (∀ (first second : Subtype fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x value) t) → (fun x => (fun x x_1 => Prop) x value) t) (fun «else» => (fun x => True) value) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) value) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) value), LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x second.1) t) → (fun x => (fun x x_1 => Prop) x second.1) t) (fun «else» => (fun x => True) second.1) (fun value «else» => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) x) t) (fun «else» => «else» ⋯) (fun value_1 «else» => (fun value_2 => (fun first second => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first second) value value_2) value_1) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second.1 fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value) second.1) value) (fun «else» => «else» ⋯) first.1 fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) first.1 x) t) → (fun x => (fun x x_1 => Prop) first.1 x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) first.1) second.1 fun h => (fun x x_1 => False) first.1 second.1 ↔ ENNReal.instLE.1 (toENNReal first) (toENNReal second) ∧ ∀ (first second : Subtype fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (¬ Nat.land 1 (Nat.shiftRight 3 t.ctorIdx) = 1 → (fun x => (fun x x_1 => Prop) x value) t) → (fun x => (fun x x_1 => Prop) x value) t) (fun «else» => (fun x => True) value) (fun value_1 «else» => (fun value_2 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 6 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) x) t) (fun «else» => «else» ⋯) (fun value «else» => (fun value => (fun first second => LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toOrderedRingConceptSignature.2 first second) value_2 value) value) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value_2) value) value_1) (fun «else» => «else» ⋯) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) fun h => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 4 t.ctorIdx)) 1 → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) → (fun x => (fun x x_1 => Prop) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) x) t) (fun «else» => «else» ⋯) (fun value «else» => «else» ⋯) (fun «else» => (fun x => True) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2)) value fun h => (fun x x_1 => False) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toZeroOneBundle.2) value), toENNReal ⟨LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec (motive := fun t => (Ne (Nat.land 1 (Nat.shiftRight 5 t.ctorIdx)) 1 → (fun x => (fun x x_1 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) → (fun x => (fun x x_1 => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity x) t) (fun «else» => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (fun value «else» => «else» ⋯) (fun «else» => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second.1 fun h => (fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) second.1) (fun value => (fun value => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.rec ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.negativeInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) (fun value_1 => (fun value_2 => (fun first second => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite (LRA.NumberSystems.Interface.ModelTheory.mathlibRealModel.signature.toBooleanRingOperationBundle.2 first second)) value value_2) value_1) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) (LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.finite value)) second.1) value) ((fun x => LRA.NumberSystems.RealNumbers.Extended.ExtendedReal.positiveInfinity) second.1) first.1, ⋯⟩ = instHAdd.1 (toENNReal first) (toENNReal second))))

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
