-- LRA/NumberSystems/RationalNumbers/ContinuedFractions.lean
-- Finite and infinite simple continued fractions.

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions
import LRA.NumberSystems.RealNumbers.Irrationals

namespace LRA.NumberSystems.RationalNumbers.ContinuedFractions
open LRA.NumberSystems.Models

/-!
Volume II label: continued-fractions
Lean module: LRA.NumberSystems.RationalNumbers.ContinuedFractions
Source: docs/number-systems/gpt-03b-continued-fractions.md
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RationalNumbers.ContinuedFractions`, content
unchanged except its `Irrationals` import repointed to the now-migrated
`LRA.NumberSystems.RealNumbers.Irrationals`. Deferred during the Rational
migration pass pending Real's promotion; see `RationalNumbers/ProofOrder.md`.
-/

open LRA.NumberSystems.Models

/--
**[Structure — FiniteSimpleContinuedFraction]**

Mathematical statement (Lean): `structure FiniteSimpleContinuedFraction (integer_model : IntegerModel)`.


Logical form:

```lean
structure FiniteSimpleContinuedFraction (integer_model : IntegerModel) where
  head : integer_model.signature.carrier
  tail : List integer_model.signature.carrier
```
-/
structure FiniteSimpleContinuedFraction (integer_model : IntegerModel) where
  head : integer_model.signature.carrier
  tail : List integer_model.signature.carrier

/--
**[Structure — FiniteValue]**

Mathematical statement (Lean): `structure FiniteValue (integer_model : IntegerModel) (rational_model : DenselyOrderedFieldModel) (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model) (fraction : FiniteSimpleContinuedFraction integer_model) (value : rational_model.signature....`.


Logical form:

```lean
structure FiniteValue
    (integer_model : IntegerModel)
    (rational_model : DenselyOrderedFieldModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (fraction : FiniteSimpleContinuedFraction integer_model)
    (value : rational_model.signature.carrier) : Prop where
  evaluates_by_successive_reciprocals :
    ∃ partial_values : List rational_model.signature.carrier,
      partial_values.length = fraction.tail.length + 1 ∧
        partial_values.head? = some value
```
-/
structure FiniteValue
    (integer_model : IntegerModel)
    (rational_model : DenselyOrderedFieldModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (fraction : FiniteSimpleContinuedFraction integer_model)
    (value : rational_model.signature.carrier) : Prop where
  evaluates_by_successive_reciprocals :
    ∃ partial_values : List rational_model.signature.carrier,
      partial_values.length = fraction.tail.length + 1 ∧
        partial_values.head? = some value

/--
**[Def — canonical]**

Mathematical statement (Lean): `def canonical (integer_model : IntegerModel) (fraction : FiniteSimpleContinuedFraction integer_model) : Prop`.


Logical form:

```lean
def canonical
    (integer_model : IntegerModel)
    (fraction : FiniteSimpleContinuedFraction integer_model) : Prop :=
  fraction.tail = [] ∨
    ∃ last : integer_model.signature.carrier,
      last ∈ fraction.tail ∧
        integer_model.signature.StrictOrder integer_model.signature.one last
```
-/
def canonical
    (integer_model : IntegerModel)
    (fraction : FiniteSimpleContinuedFraction integer_model) : Prop :=
  fraction.tail = [] ∨
    ∃ last : integer_model.signature.carrier,
      last ∈ fraction.tail ∧
        integer_model.signature.StrictOrder integer_model.signature.one last

/--
**[Structure — Convergents]**

Mathematical statement (Lean): `structure Convergents (integer_model : IntegerModel) (fraction : Nat → integer_model.signature.carrier)`.


Logical form:

```lean
structure Convergents
    (integer_model : IntegerModel)
    (fraction : Nat → integer_model.signature.carrier) where
  numerator : Nat → integer_model.signature.carrier
  denominator : Nat → integer_model.signature.carrier
  recurrence_holds :
    ∀ index : Nat,
      numerator (index + 2) =
        integer_model.signature.add
          (integer_model.signature.multiply
            (fraction (index + 2)) (numerator (index + 1)))
          (numerator index)
```
-/
structure Convergents
    (integer_model : IntegerModel)
    (fraction : Nat → integer_model.signature.carrier) where
  numerator : Nat → integer_model.signature.carrier
  denominator : Nat → integer_model.signature.carrier
  recurrence_holds :
    ∀ index : Nat,
      numerator (index + 2) =
        integer_model.signature.add
          (integer_model.signature.multiply
            (fraction (index + 2)) (numerator (index + 1)))
          (numerator index)

/--
**[Def — InfiniteSimpleContinuedFraction]**

Mathematical statement (Lean): `def InfiniteSimpleContinuedFraction (integer_model : IntegerModel) : Type`.


Logical form:

```lean
def InfiniteSimpleContinuedFraction (integer_model : IntegerModel) : Type :=
  Nat → integer_model.signature.carrier
```
-/
def InfiniteSimpleContinuedFraction (integer_model : IntegerModel) : Type :=
  Nat → integer_model.signature.carrier

/--
**[Def — eventually_periodic]**

Mathematical statement (Lean): `def eventually_periodic {integer_model : IntegerModel} (fraction : InfiniteSimpleContinuedFraction integer_model) : Prop`.


Logical form:

```lean
def eventually_periodic
    {integer_model : IntegerModel}
    (fraction : InfiniteSimpleContinuedFraction integer_model) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index
```
-/
def eventually_periodic
    {integer_model : IntegerModel}
    (fraction : InfiniteSimpleContinuedFraction integer_model) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index

/--
**[Theorem — rational_has_unique_canonical_finite_expansion]**

Mathematical statement (Lean): `theorem rational_has_unique_canonical_finite_expansion (integer_model : IntegerModel) (rational_model : DenselyOrderedFieldModel) (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model) (value : rational_model.signature.carrier) : ∃ fraction :...`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_has_unique_canonical_finite_expansion
    (integer_model : IntegerModel)
    (rational_model : DenselyOrderedFieldModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (value : rational_model.signature.carrier) :
    ∃ fraction : FiniteSimpleContinuedFraction integer_model,
      canonical integer_model fraction ∧
        FiniteValue integer_model rational_model integer_embedding fraction value ∧
          ∀ other : FiniteSimpleContinuedFraction integer_model,
            canonical integer_model other →
              FiniteValue integer_model rational_model integer_embedding other value →
                other = fraction
```
-/
theorem rational_has_unique_canonical_finite_expansion
    (integer_model : IntegerModel)
    (rational_model : DenselyOrderedFieldModel)
    (integer_embedding : IntegerEmbeddingIntoRational integer_model rational_model)
    (value : rational_model.signature.carrier) :
    ∃ fraction : FiniteSimpleContinuedFraction integer_model,
      canonical integer_model fraction ∧
        FiniteValue integer_model rational_model integer_embedding fraction value ∧
          ∀ other : FiniteSimpleContinuedFraction integer_model,
            canonical integer_model other →
              FiniteValue integer_model rational_model integer_embedding other value →
                other = fraction := by
  sorry

/--
**[Theorem — infinite_continued_fraction_converges]**

Mathematical statement (Lean): `theorem infinite_continued_fraction_converges (real_model : RealModel) (integer_model : IntegerModel) (fraction : InfiniteSimpleContinuedFraction integer_model) : ∃ value : real_model.signature.carrier, ∀ neighborhood : real_model.signature.carrier → Prop,...`.

*Proof status:* proof pending


Logical form:

```lean
theorem infinite_continued_fraction_converges
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model) :
    ∃ value : real_model.signature.carrier,
      ∀ neighborhood : real_model.signature.carrier → Prop,
        neighborhood value →
          ∃ index : Nat, neighborhood value
```
-/
theorem infinite_continued_fraction_converges
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model) :
    ∃ value : real_model.signature.carrier,
      ∀ neighborhood : real_model.signature.carrier → Prop,
        neighborhood value →
          ∃ index : Nat, neighborhood value := by
  sorry

/--
**[Theorem — quadratic_irrational_iff_eventually_periodic]**

Mathematical statement (Lean): `theorem quadratic_irrational_iff_eventually_periodic (real_model : RealModel) (integer_model : IntegerModel) (fraction : InfiniteSimpleContinuedFraction integer_model) (value : real_model.signature.carrier) : eventually_periodic fraction ↔ ∃ coefficient_a c...`.

*Proof status:* proof pending


Logical form:

```lean
theorem quadratic_irrational_iff_eventually_periodic
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model)
    (value : real_model.signature.carrier) :
    eventually_periodic fraction ↔
      ∃ coefficient_a coefficient_b coefficient_c : real_model.signature.carrier,
        real_model.signature.add
          (real_model.signature.add
            (real_model.signature.multiply coefficient_a
              (real_model.signature.multiply value value))
            (real_model.signature.multiply coefficient_b value))
          coefficient_c =
          real_model.signature.zero
```
-/
theorem quadratic_irrational_iff_eventually_periodic
    (real_model : RealModel)
    (integer_model : IntegerModel)
    (fraction : InfiniteSimpleContinuedFraction integer_model)
    (value : real_model.signature.carrier) :
    eventually_periodic fraction ↔
      ∃ coefficient_a coefficient_b coefficient_c : real_model.signature.carrier,
        real_model.signature.add
          (real_model.signature.add
            (real_model.signature.multiply coefficient_a
              (real_model.signature.multiply value value))
            (real_model.signature.multiply coefficient_b value))
          coefficient_c =
          real_model.signature.zero := by
  sorry

end LRA.NumberSystems.RationalNumbers.ContinuedFractions
