import LRA.NumberSystems.RealNumbers.ContinuedFractions.Definition

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Models
open LRA.Arithmetic.ContinuedFractions

universe u

/-- Every proper infinite simple continued fraction over a rational number
system has a real limit in a real extension of that rational system.

Logical form:

```lean
theorem ProperInfiniteSimpleContinuedFractionConverges
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (proper : IsProperInfiniteSimpleContinuedFraction fraction) :
    ∃ limit : realExtension.RealModel.Carrier,
      ConvergentsConvergeTo rationalSystem realExtension fraction limit
```
-/
theorem ProperInfiniteSimpleContinuedFractionConverges
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (proper : IsProperInfiniteSimpleContinuedFraction fraction) :
    ∃ limit : realExtension.RealModel.Carrier,
      ConvergentsConvergeTo rationalSystem realExtension fraction limit := by
  sorry

/-- Lagrange's theorem: a real value is a quadratic irrational exactly when its
proper infinite simple continued-fraction expansion is eventually periodic.

Logical form:

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
