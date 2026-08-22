import LRA.VolumeII.NumberSystems.Models

namespace LRA.Arithmetic.ContinuedFractions

open LRA.NumberSystems.Models

universe u

/-- A finite simple continued fraction over a selected integer model.

The head coefficient may be any integer. Canonicality conditions on the tail
are stated separately so that the raw arithmetic object is not tied to a
particular representation convention.

Logical form:

```lean
structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier
```
-/
structure FiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier

/-- An infinite simple continued fraction is a sequence of integer
coefficients.

Logical form:

```lean
def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier
```
-/
def InfiniteSimpleContinuedFraction
    (integerModel : IntegerModel.{u}) : Type u :=
  Nat → integerModel.Carrier

/-- A finite simple continued fraction is canonical when every tail
coefficient is positive and, when the tail is nonempty, its final coefficient
is strictly greater than one.

This is the usual normalization that removes the ambiguity
`[..., a] = [..., a - 1, 1]` for finite simple continued fractions.

Logical form:

```lean
def IsCanonicalSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : FiniteSimpleContinuedFraction integerModel) : Prop :=
  (∀ coefficient ∈ fraction.Tail, 0 < coefficient) ∧
    (fraction.Tail = [] ∨
      ∃ prefix last,
        fraction.Tail = prefix ++ [last] ∧ 1 < last)
```
-/
def IsCanonicalSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : FiniteSimpleContinuedFraction integerModel) : Prop :=
  (∀ coefficient ∈ fraction.Tail, 0 < coefficient) ∧
    (fraction.Tail = [] ∨
      ∃ prefix last,
        fraction.Tail = prefix ++ [last] ∧ 1 < last)

/-- An infinite simple continued fraction is proper when every coefficient
after the head is positive. The head coefficient is unrestricted.

Logical form:

```lean
def IsProperInfiniteSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∀ index : Nat, 0 < fraction (index + 1)
```
-/
def IsProperInfiniteSimpleContinuedFraction
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∀ index : Nat, 0 < fraction (index + 1)

/-- An infinite simple continued fraction is eventually periodic when its
coefficient sequence repeats with some positive period after some index.

Logical form:

```lean
def IsEventuallyPeriodic
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index
```
-/
def IsEventuallyPeriodic
    {integerModel : IntegerModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index

end LRA.Arithmetic.ContinuedFractions
