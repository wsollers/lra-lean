import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.ContinuedFractions
import LRA.NumberSystems.RealNumbers.Irrationals

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Models
open LRA.Arithmetic.ContinuedFractions

universe u

/-- The finite prefix of depth `depth` of an infinite simple continued
fraction. Depth zero is the one-term fraction `[a₀]`; depth `n` contains the
coefficients `a₀, …, aₙ`.

Logical form:

```lean
def FinitePrefix
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel)
    (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
  Head := fraction 0
  Tail := (List.range depth).map (fun index => fraction (index + 1))
```
-/
def FinitePrefix
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel)
    (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
  Head := fraction 0
  Tail := (List.range depth).map (fun index => fraction (index + 1))

/-- A rational value is the convergent at `depth` when the corresponding finite
prefix evaluates to it in the selected rational number system.

Logical form:

```lean
def IsConvergentAt
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (depth : Nat)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  LRA.NumberSystems.RationalNumbers.ContinuedFractions.
    FiniteSimpleContinuedFractionEvaluatesTo
      rationalSystem (FinitePrefix fraction depth) value
```
-/
def IsConvergentAt
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (depth : Nat)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  LRA.NumberSystems.RationalNumbers.ContinuedFractions.
    FiniteSimpleContinuedFractionEvaluatesTo
      rationalSystem (FinitePrefix fraction depth) value

/-- The convergents of an infinite simple continued fraction converge to a real
value when, after embedding each rational convergent into the selected real
extension, they satisfy the explicit ordered-field epsilon condition.

Logical form:

```lean
def ConvergentsConvergeTo
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (limit : realExtension.RealModel.Carrier) : Prop :=
  ∀ epsilon : realExtension.RealModel.Carrier,
    0 < epsilon →
      ∃ N : Nat, ∀ depth : Nat, N ≤ depth →
        ∃ convergent : rationalSystem.FieldModel.Carrier,
          IsConvergentAt rationalSystem fraction depth convergent ∧
          -epsilon ≤ realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ∧
          realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ≤ epsilon
```
-/
def ConvergentsConvergeTo
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (limit : realExtension.RealModel.Carrier) : Prop :=
  ∀ epsilon : realExtension.RealModel.Carrier,
    0 < epsilon →
      ∃ N : Nat, ∀ depth : Nat, N ≤ depth →
        ∃ convergent : rationalSystem.FieldModel.Carrier,
          IsConvergentAt rationalSystem fraction depth convergent ∧
          -epsilon ≤ realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ∧
          realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ≤ epsilon

/-- A proper infinite simple continued fraction is an expansion of a real value
when its rational convergents converge to that value.

Logical form:

```lean
def IsInfiniteSimpleContinuedFractionExpansionOf
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : realExtension.RealModel.Carrier) : Prop :=
  IsProperInfiniteSimpleContinuedFraction fraction ∧
    ConvergentsConvergeTo rationalSystem realExtension fraction value
```
-/
def IsInfiniteSimpleContinuedFractionExpansionOf
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : realExtension.RealModel.Carrier) : Prop :=
  IsProperInfiniteSimpleContinuedFraction fraction ∧
    ConvergentsConvergeTo rationalSystem realExtension fraction value

/-- A real value is a quadratic irrational when it is irrational over the
selected rational system and is a root of a quadratic polynomial with integer
coefficients and nonzero leading coefficient.

Logical form:

```lean
def IsQuadraticIrrational
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) : Prop :=
  LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational
      rationalSystem realExtension value ∧
    ∃ a b c : rationalSystem.IntegerSystem.Model.Carrier,
      a ≠ 0 ∧
        let embedInteger := fun z =>
          realExtension.DenseOrderedFieldEmbedding.ToReal
            (rationalSystem.IntegerEmbedding.ToField z)
        embedInteger a * (value * value) +
            embedInteger b * value + embedInteger c = 0
```
-/
def IsQuadraticIrrational
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) : Prop :=
  LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational
      rationalSystem realExtension value ∧
    ∃ a b c : rationalSystem.IntegerSystem.Model.Carrier,
      a ≠ 0 ∧
        let embedInteger := fun z =>
          realExtension.DenseOrderedFieldEmbedding.ToReal
            (rationalSystem.IntegerEmbedding.ToField z)
        embedInteger a * (value * value) +
            embedInteger b * value + embedInteger c = 0

end LRA.NumberSystems.RealNumbers.ContinuedFractions
