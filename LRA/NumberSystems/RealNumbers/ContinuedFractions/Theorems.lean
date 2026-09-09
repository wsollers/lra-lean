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

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (fraction : LRA.Arithmetic.ContinuedFractions.InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model), LRA.Arithmetic.ContinuedFractions.IsProperInfiniteSimpleContinuedFraction fraction → Exists fun limit => LRA.NumberSystems.RealNumbers.ContinuedFractions.ConvergentsConvergeTo rationalSystem realExtension fraction limit

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u}
    realExtension : RationalRealExtension rationalSystem
    fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model
  Prove
    (∀ (index : Nat), rationalSystem.IntegerSystem.Model.7.lt 0 (fraction ({ hAdd := fun a b => instAddNat.add a b }.hAdd index 1))) → Exists fun limit => ∀ (epsilon : realExtension.RealModel.1), realExtension.RealModel.8.lt 0 epsilon → Exists fun N => ∀ (depth : Nat), instLENat.le N depth → Exists fun convergent => (LRA.NumberSystems.RationalNumbers.ContinuedFractions.CoefficientsEvaluateTo rationalSystem (List.cons (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).1 (LRA.NumberSystems.RealNumbers.ContinuedFractions.FinitePrefix fraction depth).2) convergent ∧ (realExtension.RealModel.9.le (realExtension.RealModel.4.neg epsilon) ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg limit)) ∧ realExtension.RealModel.9.le ({ hAdd := fun a b => realExtension.RealModel.2.add a b }.hAdd (realExtension.DenseOrderedFieldEmbedding.1 convergent) (realExtension.RealModel.4.neg limit)) epsilon))

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

  ∀ (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem) (realExtension : LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem) (value : realExtension.RealModel.Carrier), LRA.NumberSystems.RealNumbers.ContinuedFractions.IsQuadraticIrrational rationalSystem realExtension value ↔ Exists fun fraction => (LRA.NumberSystems.RealNumbers.ContinuedFractions.IsInfiniteSimpleContinuedFractionExpansionOf rationalSystem realExtension fraction value ∧ LRA.Arithmetic.ContinuedFractions.IsEventuallyPeriodic fraction)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u}
    realExtension : RationalRealExtension rationalSystem
    value : realExtension.RealModel.Carrier
  Prove
    LRA.NumberSystems.RealNumbers.ContinuedFractions.IsQuadraticIrrational rationalSystem realExtension value ↔ Exists fun fraction => (LRA.NumberSystems.RealNumbers.ContinuedFractions.IsInfiniteSimpleContinuedFractionExpansionOf rationalSystem realExtension fraction value ∧ LRA.Arithmetic.ContinuedFractions.IsEventuallyPeriodic fraction)

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
