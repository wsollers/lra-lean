-- LRA/VolumeII/Integers/Tao/Construction/Model.lean
-- Tao formal-difference construction of the integers.

import LRA.VolumeII.Integers.QuotientOrderedPairs
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers.Tao

/-!
Volume II label: integers-tao-construction
Lean module: LRA.NumberSystems.Integers.Tao.Construction.Model
Source: docs/number-systems/gpt-02a-integers-tao.md
Verification status: definitions complete; proofs pending

Tao's construction presents integers as formal differences `a -- b` of whole
numbers, with equality given by cross-addition.  This module keeps that
presentation explicit while reusing the same whole-number arithmetic interface
as the default quotient-ordered-pairs construction.
-/

/--
**[Abbrev — WholeNumberArithmeticForTaoFormalDifferences]**

Mathematical statement (Lean): `abbrev WholeNumberArithmeticForTaoFormalDifferences`.


Logical form:

```lean
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs
```
-/
abbrev WholeNumberArithmeticForTaoFormalDifferences :=
  QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs


/-- Definition 1.1: Tao formal integer expression `a -- b`.

Mathematical statement (Lean): `structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences)`.


Logical form:

```lean
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier
```
-/
structure FormalDifference (whole_data : WholeNumberArithmeticForTaoFormalDifferences) where
  minuend : whole_data.carrier
  subtrahend : whole_data.carrier


/-- Definition 1.2: Tao equality of formal differences.

Mathematical statement (Lean): `def equivalent (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (first second : FormalDifference whole_data) : Prop`.


Logical form:

```lean
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend
```
-/
def equivalent
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.addition first.minuend second.subtrahend =
    whole_data.addition second.minuend first.subtrahend


/-- Theorem 1.3: Tao equality is an equivalence relation.

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : Equivalence (equivalent whole_data)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data)
```
-/
theorem equivalent_is_equivalence_relation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Equivalence (equivalent whole_data) := by
  sorry

/--
**[Def — setoid]**

Mathematical statement (Lean): `def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : Setoid (FormalDifference whole_data)`.


Logical form:

```lean
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data
```
-/
def setoid (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    Setoid (FormalDifference whole_data) where
  r := equivalent whole_data
  iseqv := equivalent_is_equivalence_relation whole_data


/-- Definition 1.4: Tao integer carrier.

Mathematical statement (Lean): `abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences)`.


Logical form:

```lean
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)
```
-/
abbrev Carrier (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :=
  Quotient (setoid whole_data)


/-- Definition 2.1: zero as `0 -- 0`.

Mathematical statement (Lean): `def zero_representative (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : FormalDifference whole_data`.


Logical form:

```lean
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero
```
-/
def zero_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    FormalDifference whole_data where
  minuend := whole_data.zero
  subtrahend := whole_data.zero


/-- Definition 2.2: embedding of whole numbers as `n -- 0`.

Mathematical statement (Lean): `def whole_embedding_representative (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (value : whole_data.carrier) : FormalDifference whole_data`.


Logical form:

```lean
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero
```
-/
def whole_embedding_representative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : whole_data.carrier) : FormalDifference whole_data where
  minuend := value
  subtrahend := whole_data.zero

/--
**[Def — whole_embedding]**

Mathematical statement (Lean): `def whole_embedding (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : whole_data.carrier → Carrier whole_data`.


Logical form:

```lean
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)
```
-/
def whole_embedding
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    whole_data.carrier → Carrier whole_data :=
  fun value => Quotient.mk (setoid whole_data)
    (whole_embedding_representative whole_data value)

/--
**[Theorem — whole_embedding_is_injective]**

Mathematical statement (Lean): `theorem whole_embedding_is_injective (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : ∀ first second, whole_embedding whole_data first = whole_embedding whole_data second → first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second
```
-/
theorem whole_embedding_is_injective
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∀ first second,
      whole_embedding whole_data first = whole_embedding whole_data second →
        first = second := by
  sorry


/-- Definition 3.1: raw Tao addition.

Mathematical statement (Lean): `def representative_addition (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (first second : FormalDifference whole_data) : FormalDifference whole_data`.


Logical form:

```lean
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend
```
-/
def representative_addition
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := whole_data.addition first.minuend second.minuend
  subtrahend := whole_data.addition first.subtrahend second.subtrahend


/-- Definition 3.2: raw Tao negation.

Mathematical statement (Lean): `def representative_negation (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (value : FormalDifference whole_data) : FormalDifference whole_data`.


Logical form:

```lean
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend
```
-/
def representative_negation
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : FormalDifference whole_data where
  minuend := value.subtrahend
  subtrahend := value.minuend


/-- Definition 4.1: raw Tao multiplication.

Mathematical statement (Lean): `def representative_multiplication (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (first second : FormalDifference whole_data) : FormalDifference whole_data`.


Logical form:

```lean
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)
```
-/
def representative_multiplication
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : FormalDifference whole_data where
  minuend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.minuend)
      (whole_data.multiplication first.subtrahend second.subtrahend)
  subtrahend :=
    whole_data.addition
      (whole_data.multiplication first.minuend second.subtrahend)
      (whole_data.multiplication first.subtrahend second.minuend)

/--
**[Theorem — representative_operations_respect_equivalence]**

Mathematical statement (Lean): `theorem representative_operations_respect_equivalence (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : (∀ first₁ first₂ second₁ second₂, equivalent whole_data first₁ first₂ → equivalent whole_data second₁ second₂ → equivalent whole_data (repres...`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_operations_respect_equivalence
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_addition whole_data first₁ second₁)
          (representative_addition whole_data first₂ second₂)) ∧
    (∀ first second,
      equivalent whole_data first second →
        equivalent whole_data
          (representative_negation whole_data first)
          (representative_negation whole_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_multiplication whole_data first₁ second₁)
          (representative_multiplication whole_data first₂ second₂))
```
-/
theorem representative_operations_respect_equivalence
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_addition whole_data first₁ second₁)
          (representative_addition whole_data first₂ second₂)) ∧
    (∀ first second,
      equivalent whole_data first second →
        equivalent whole_data
          (representative_negation whole_data first)
          (representative_negation whole_data second)) ∧
    (∀ first₁ first₂ second₁ second₂,
      equivalent whole_data first₁ first₂ →
      equivalent whole_data second₁ second₂ →
        equivalent whole_data
          (representative_multiplication whole_data first₁ second₁)
          (representative_multiplication whole_data first₂ second₂)) := by
  sorry

/--
**[Def — nonnegative]**

Mathematical statement (Lean): `def nonnegative (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (value : FormalDifference whole_data) : Prop`.


Logical form:

```lean
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend
```
-/
def nonnegative
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (value : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order value.subtrahend value.minuend

/--
**[Def — representative_strict_order]**

Mathematical statement (Lean): `def representative_strict_order (whole_data : WholeNumberArithmeticForTaoFormalDifferences) (first second : FormalDifference whole_data) : Prop`.


Logical form:

```lean
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second
```
-/
def representative_strict_order
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences)
    (first second : FormalDifference whole_data) : Prop :=
  whole_data.nonstrict_order
    (whole_data.addition first.minuend second.subtrahend)
    (whole_data.addition second.minuend first.subtrahend) ∧
  ¬ equivalent whole_data first second

/--
**[Theorem — tao_integers_form_ordered_ring]**

Mathematical statement (Lean): `theorem tao_integers_form_ordered_ring (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : ∃ integer_model : LRA.NumberSystems.Models.IntegerModel, integer_model.signature.carrier = Carrier whole_data`.

*Proof status:* proof pending


Logical form:

```lean
theorem tao_integers_form_ordered_ring
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integer_model : LRA.NumberSystems.Models.IntegerModel,
      integer_model.signature.carrier = Carrier whole_data
```
-/
theorem tao_integers_form_ordered_ring
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integer_model : LRA.NumberSystems.Models.IntegerModel,
      integer_model.signature.carrier = Carrier whole_data := by
  sorry

/--
**[Theorem — tao_compares_with_quotient_ordered_pairs]**

Mathematical statement (Lean): `theorem tao_compares_with_quotient_ordered_pairs (whole_data : WholeNumberArithmeticForTaoFormalDifferences) : ∃ comparison : Carrier whole_data → QuotientOrderedPairs.Carrier whole_data, ∀ first second, comparison first = comparison second → first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem tao_compares_with_quotient_ordered_pairs
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ comparison :
      Carrier whole_data → QuotientOrderedPairs.Carrier whole_data,
      ∀ first second, comparison first = comparison second → first = second
```
-/
theorem tao_compares_with_quotient_ordered_pairs
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ comparison :
      Carrier whole_data → QuotientOrderedPairs.Carrier whole_data,
      ∀ first second, comparison first = comparison second → first = second := by
  sorry

end LRA.NumberSystems.Integers.Tao
