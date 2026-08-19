-- LRA/NumberSystems/RealNumbers/NonNegative.lean
-- Non-negative reals and non-negative extended reals over a selected real
-- model: the subtypes needed for distance, metrics, and norms.

import LRA.NumberSystems.RealNumbers.Extended

namespace LRA.NumberSystems.RealNumbers.NonNegative
open LRA.NumberSystems.Models
open LRA.NumberSystems.RealNumbers.Extended

/-!
Volume II label: non-negative-reals
Lean module: LRA.NumberSystems.RealNumbers.NonNegative
Verification status: statement-accepted-proof-pending

`NonNegativeReal` and `NonNegativeExtendedReal` are not additional
*constructions* of the reals in the §1.6.1 sense: there is no competing
axiomatization to reconcile the way Cauchy sequences and Dedekind cuts
compete to construct the reals themselves. Given any `real_model :
RealModel` (built by any construction, or by `mathlibRealModel`), the
non-negative elements and the non-negative extended elements are
canonically determined as subtypes. So, like `Extended.lean`,
`Extensions.lean`, `IntervalArithmetic.lean`, and `Irrationals.lean`, this
file is top-level derived theory over an existing `RealModel`, not a
construction pipeline.

`NonNegativeExtendedReal` restores something `ExtendedReal` deliberately
does not have: a total, concrete addition. On the full extended reals,
`negativeInfinity + positiveInfinity` has no sensible value, so
`Extended.lean` only states operations abstractly via `PartialOperation`.
Once the negative side is removed there is no such clash -- `x +
positiveInfinity = positiveInfinity` for every `x`, including
`positiveInfinity` itself -- so addition here is total and given directly,
matching how Mathlib's `ENNReal` (unlike `EReal`) carries a genuine
ordered-additive-monoid structure.

Multiplication is deliberately NOT included in this pass. Its natural
convention (`0 * positiveInfinity = 0`, the measure-theoretic reading
Mathlib's `ENNReal` uses, rather than leaving it undefined) is a modeling
choice independent of what is proved here, and neither the metric nor the
norm use case this file was requested for needs it: a metric only needs
order and addition (`d x y = 0 ↔ x = y`, symmetry, triangle inequality),
and a norm's scalar multiplication acts by the *base* `RealModel`, not by
another `NonNegativeReal`. Left as a follow-up so this file stays scoped
to what was asked.

The Mathlib bridge theorems (these types instantiated at `mathlibRealModel`
are order/arithmetic-preserving-equivalent to Mathlib's own `NNReal` /
`ENNReal`) live in `Interop/Mathlib/NonNegative.lean`, not here: the
quarantine keeps this file, and everything that imports it through the
ordinary `RealNumbers` router, Mathlib-free.
-/

/-- The non-negative elements of a real model's carrier: the subtype
Mathlib calls `NNReal` when the carrier is `ℝ`.

Logical form:

```lean
def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }
```
-/
def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }

/-- The non-negative elements of the extended real line: every finite
non-negative value, together with `positiveInfinity` but not
`negativeInfinity` -- the subtype Mathlib calls `ENNReal` when the carrier
is `ℝ`.

Logical form:

```lean
def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }
```
-/
def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }

/-- Zero is non-negative.

*Proof status:* proof pending

Logical form:

```lean
theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero
```
-/
theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero := by
  sorry

/-- The distinguished zero of `NonNegativeReal real_model`.

Logical form:

```lean
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩
```
-/
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩

/-- `positiveInfinity` lies above the finite zero, so it is a non-negative
extended real -- the top element `ENNReal` calls `⊤`.

*Proof status:* proof pending

Logical form:

```lean
theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity)
```
-/
theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry

/-- The distinguished top element of `NonNegativeExtendedReal real_model`.

Logical form:

```lean
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩
```
-/
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩

/-- A non-negative real embeds as a finite non-negative extended real.

*Proof status:* proof pending

Logical form:

```lean
theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value)
```
-/
theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value) := by
  sorry

/-- The embedding of `NonNegativeReal real_model` into
`NonNegativeExtendedReal real_model`.

Logical form:

```lean
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩
```
-/
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩

/-- The addition of two non-negative reals stays non-negative.

*Proof status:* proof pending

Logical form:

```lean
theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second)
```
-/
theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second) := by
  sorry

/-- Addition on `NonNegativeReal real_model`.

Logical form:

```lean
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩
```
-/
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩

/-- Raw total addition on the extended reals: `positiveInfinity` absorbs
every summand, including itself; two finite values add as in the base
`real_model`. `negativeInfinity` never occurs among non-negative extended
reals, but the pattern match must still be exhaustive, so it is given the
only sensible extension (absorbing, symmetric to `positiveInfinity`'s
case) rather than left partial.

Logical form:

```lean
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)
```
-/
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)

/-- Adding two non-negative extended reals stays a non-negative extended
real.

*Proof status:* proof pending

Logical form:

```lean
theorem AddExtendedRawIsNonNegative (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) first)
    (second_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) second) :
    nonstrict_order real_model
      (.finite real_model.signature.zero)
      (addExtendedRaw real_model first second)
```
-/
theorem AddExtendedRawIsNonNegative (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) first)
    (second_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) second) :
    nonstrict_order real_model
      (.finite real_model.signature.zero)
      (addExtendedRaw real_model first second) := by
  sorry

/-- Addition on `NonNegativeExtendedReal real_model`, total (unlike
addition on the full `ExtendedReal`).

Logical form:

```lean
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩
```
-/
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩

/-- The order on `NonNegativeReal real_model`, inherited from `real_model`.

Logical form:

```lean
def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val
```
-/
def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val

/-- The order on `NonNegativeExtendedReal real_model`, inherited from
`ExtendedReal`'s order.

Logical form:

```lean
def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val
```
-/
def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val

/-- The underlying real value of a non-negative real.

Logical form:

```lean
def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val
```
-/
def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val

/-- The underlying extended real value of a non-negative extended real.

Logical form:

```lean
def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val
```
-/
def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val

end LRA.NumberSystems.RealNumbers.NonNegative
