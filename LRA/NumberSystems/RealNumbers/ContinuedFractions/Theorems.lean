import LRA.NumberSystems.RealNumbers.ContinuedFractions.Definition

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory
open LRA.Arithmetic.ContinuedFractions

universe u

/--
`ProperInfiniteSimpleContinuedFractionConverges` TODO

Predicate logic:

  (IsProperInfiniteSimpleContinuedFraction fraction) → ∃ limit ∈ realExtension.RealModel.Carrier, ConvergentsConvergeTo rationalSystem realExtension fraction limit

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (fraction : Nat → rationalSystem.IntegerSystem.Model.1), (∀ (index : Nat), rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.zeroInst.1 (fraction (instHAdd.1 index (instOfNatNat 1).1))) → Exists fun limit => ∀ (epsilon : realExtension.RealModel.toDenselyOrderedFieldModel.1), realExtension.RealModel.ltInst.1 realExtension.RealModel.zeroInst.1 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.1 N depth → Exists fun convergent => (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) convergent ∧ (realExtension.RealModel.leInst.1 (realExtension.RealModel.negInst.1 epsilon) (instHAdd.1 (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.negInst.1 limit)) ∧ realExtension.RealModel.leInst.1 (instHAdd.1 (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.negInst.1 limit)) epsilon))

Logical form (Lean):

```lean
theorem ProperInfiniteSimpleContinuedFractionConverges
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (proper : IsProperInfiniteSimpleContinuedFraction fraction) :
    ∃ limit : realExtension.RealModel.Carrier,
      ConvergentsConvergeTo rationalSystem realExtension fraction limit
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem ProperInfiniteSimpleContinuedFractionConverges
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (proper : IsProperInfiniteSimpleContinuedFraction fraction) :
    ∃ limit : realExtension.RealModel.Carrier,
      ConvergentsConvergeTo rationalSystem realExtension fraction limit := by
  sorry

/--
`QuadraticIrrationalIffEventuallyPeriodicContinuedFraction` TODO

Predicate logic:

  (∀ value ∈ realExtension.RealModel.Carrier), IsQuadraticIrrational rationalSystem realExtension value ↔ ∃ fraction ∈ InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model, IsInfiniteSimpleContinuedFractionExpansionOf rationalSystem realExtension fraction value ∧ IsEventuallyPeriodic fraction

Predicate logic (unfolded):

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (value : realExtension.RealModel.toDenselyOrderedFieldModel.1), ((Exists fun rational_value => realExtension.DenseOrderedFieldEmbedding.1 rational_value = value) → False ∧ Exists fun a => Exists fun b => Exists fun c => (a = rationalSystem.IntegerSystem.Model.zeroInst.1 → False ∧ have embedInteger := fun z => realExtension.DenseOrderedFieldEmbedding.ToReal (rationalSystem.IntegerEmbedding.ToField z); instHAdd.hAdd (instHAdd.hAdd (instHMul.hMul (embedInteger a) (instHMul.hMul value value)) (instHMul.hMul (embedInteger b) value)) (embedInteger c) = 0)) ↔ Exists fun fraction => ((∀ (index : Nat), rationalSystem.IntegerSystem.Model.ltInst.1 rationalSystem.IntegerSystem.Model.zeroInst.1 (fraction (instHAdd.1 index (instOfNatNat 1).1)) ∧ ∀ (epsilon : realExtension.RealModel.toDenselyOrderedFieldModel.1), realExtension.RealModel.ltInst.1 realExtension.RealModel.zeroInst.1 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.1 N depth → Exists fun convergent => (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) convergent ∧ (realExtension.RealModel.leInst.1 (realExtension.RealModel.negInst.1 epsilon) (instHAdd.1 (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.negInst.1 value)) ∧ realExtension.RealModel.leInst.1 (instHAdd.1 (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.negInst.1 value)) epsilon))) ∧ Exists fun start => Exists fun period => (period = instOfNatNat 0.1 → False ∧ ∀ (index : Nat), instLENat.1 start index → fraction (instHAdd.1 index period) = fraction index))

Logical form (Lean):

```lean
theorem QuadraticIrrationalIffEventuallyPeriodicContinuedFraction
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) :
    IsQuadraticIrrational rationalSystem realExtension value ↔
      ∃ fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
        IsInfiniteSimpleContinuedFractionExpansionOf
          rationalSystem realExtension fraction value ∧
        IsEventuallyPeriodic fraction
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem QuadraticIrrationalIffEventuallyPeriodicContinuedFraction
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) :
    IsQuadraticIrrational rationalSystem realExtension value ↔
      ∃ fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
        IsInfiniteSimpleContinuedFractionExpansionOf
          rationalSystem realExtension fraction value ∧
        IsEventuallyPeriodic fraction := by
  sorry

end LRA.NumberSystems.RealNumbers.ContinuedFractions
