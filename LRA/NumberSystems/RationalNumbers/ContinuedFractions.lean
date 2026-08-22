-- LRA/NumberSystems/RationalNumbers/ContinuedFractions.lean
-- Rational interpretation of finite simple continued fractions.

import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.ContinuedFractions

open LRA.Arithmetic.ContinuedFractions

universe u

/-!
This module interprets the arithmetic continued-fraction objects from
`LRA.Arithmetic.ContinuedFractions` in an actual `RationalNumberSystem`.
The generic syntax, canonicality predicate, and eventual-periodicity predicate
are owned by `LRA.Arithmetic`.
-/

/-- Embed an integer coefficient into the rational field selected by a rational
number system.

Logical form:

```lean
def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient
```
-/
def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient

/-- Recursive evaluation relation for a nonempty list of continued-fraction
coefficients.

A singleton list `[a]` evaluates to the embedded integer `a`. A longer list
`a :: rest` evaluates to `a + 1/r`, where `rest` evaluates to the nonzero value
`r`.

Logical form:

```lean
def CoefficientsEvaluateTo
    (rationalSystem : RationalNumberSystem.{u}) :
    List rationalSystem.IntegerSystem.Model.Carrier →
      rationalSystem.FieldModel.Carrier → Prop
```
-/
def CoefficientsEvaluateTo
    (rationalSystem : RationalNumberSystem.{u}) :
    List rationalSystem.IntegerSystem.Model.Carrier →
      rationalSystem.FieldModel.Carrier → Prop
  | [], _ => False
  | [coefficient], value =>
      value = EmbedIntegerCoefficient rationalSystem coefficient
  | coefficient :: next :: rest, value =>
      ∃ tailValue : rationalSystem.FieldModel.Carrier,
        CoefficientsEvaluateTo rationalSystem (next :: rest) tailValue ∧
          tailValue ≠ 0 ∧
          value =
            EmbedIntegerCoefficient rationalSystem coefficient + tailValue⁻¹

/-- A finite simple continued fraction evaluates to a rational value when its
full coefficient list evaluates to that value by successive reciprocals.

Logical form:

```lean
def FiniteSimpleContinuedFractionEvaluatesTo
    (rationalSystem : RationalNumberSystem.{u})
    (fraction :
      FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  CoefficientsEvaluateTo rationalSystem
    (fraction.Head :: fraction.Tail) value
```
-/
def FiniteSimpleContinuedFractionEvaluatesTo
    (rationalSystem : RationalNumberSystem.{u})
    (fraction :
      FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  CoefficientsEvaluateTo rationalSystem
    (fraction.Head :: fraction.Tail) value

/-- Every rational value has a unique canonical finite simple continued-fraction
expansion relative to the integer number system bundled into the rational
number system.

Logical form:

```lean
theorem EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction
    (rationalSystem : RationalNumberSystem.{u})
    (value : rationalSystem.FieldModel.Carrier) :
    ∃ fraction :
        FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
      IsCanonicalSimpleContinuedFraction fraction ∧
        FiniteSimpleContinuedFractionEvaluatesTo
          rationalSystem fraction value ∧
        ∀ other :
            FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
          IsCanonicalSimpleContinuedFraction other →
          FiniteSimpleContinuedFractionEvaluatesTo
            rationalSystem other value →
          other = fraction
```
-/
theorem EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction
    (rationalSystem : RationalNumberSystem.{u})
    (value : rationalSystem.FieldModel.Carrier) :
    ∃ fraction :
        FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
      IsCanonicalSimpleContinuedFraction fraction ∧
        FiniteSimpleContinuedFractionEvaluatesTo
          rationalSystem fraction value ∧
        ∀ other :
            FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
          IsCanonicalSimpleContinuedFraction other →
          FiniteSimpleContinuedFractionEvaluatesTo
            rationalSystem other value →
          other = fraction := by
  sorry

end LRA.NumberSystems.RationalNumbers.ContinuedFractions
