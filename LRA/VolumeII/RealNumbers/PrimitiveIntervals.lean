-- LRA/VolumeII/Reals/PrimitiveIntervals.lean
-- Primitive construction of the reals from nested rational intervals.

import LRA.VolumeII.Foundations.Quotients.Compatibility
import LRA.VolumeI.Algebra.Models.Models
import LRA.VolumeII.RealNumbers.Cauchy

namespace LRA.VolumeII.RealNumbers.PrimitiveIntervals

open LRA.VolumeI.Algebra.Models

/-!
Lean module: LRA.VolumeII.RealNumbers.PrimitiveIntervals
Source: docs/number-systems/gpt-07-reals-interval-arithmetic.md
Verification status: definitions and final theorem statements complete; proofs pending

This construction is definitionally independent of the Cantor and Cauchy real
constructions. Its primitive equivalence is persistent cross-level overlap.
-/

variable (rational_model : RationalModel)

/--
**[Abbrev — Rational]**

Mathematical statement (Lean): `abbrev Rational`.


Logical form:

```lean
abbrev Rational := rational_model.signature.carrier
```
-/
abbrev Rational := rational_model.signature.carrier


/-- Reflexivity of the rational non-strict order.

Mathematical statement (Lean): `theorem nonstrict_order_reflexive (value : Rational rational_model) : rational_model.signature.NonstrictOrder value value`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.NonstrictOrder value value
```
-/
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.NonstrictOrder value value := by
  sorry


/-- Definition 1.1: a rational closed interval.

Mathematical statement (Lean): `structure RationalInterval`.


Logical form:

```lean
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.NonstrictOrder left_endpoint right_endpoint
```
-/
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.NonstrictOrder left_endpoint right_endpoint


/-- Definition 1.2: membership in a rational closed interval.

Mathematical statement (Lean): `def contains (interval : RationalInterval rational_model) (value : Rational rational_model) : Prop`.


Logical form:

```lean
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.NonstrictOrder interval.left_endpoint value ∧
  rational_model.signature.NonstrictOrder value interval.right_endpoint
```
-/
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.NonstrictOrder interval.left_endpoint value ∧
  rational_model.signature.NonstrictOrder value interval.right_endpoint


/-- Definition 1.3: interval inclusion.

Mathematical statement (Lean): `def subset (inner outer : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.NonstrictOrder
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.NonstrictOrder
      inner.right_endpoint outer.right_endpoint
```
-/
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.NonstrictOrder
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.NonstrictOrder
      inner.right_endpoint outer.right_endpoint


/-- Definition 1.4: interval overlap.

Mathematical statement (Lean): `def overlaps (first second : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value
```
-/
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value


/-- Definition 1.5: interval width.

Mathematical statement (Lean): `def width (interval : RationalInterval rational_model) : Rational rational_model`.


Logical form:

```lean
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint
```
-/
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint

/--
**[Abbrev — IntervalSequence]**

Mathematical statement (Lean): `abbrev IntervalSequence`.


Logical form:

```lean
abbrev IntervalSequence := Nat → RationalInterval rational_model
```
-/
abbrev IntervalSequence := Nat → RationalInterval rational_model


/-- Definition 1.6: an admissible nested shrinking interval sequence.

Mathematical statement (Lean): `structure Representative`.


Logical form:

```lean
structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon
```
-/
structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon


/-- Definition 1.7: persistent cross-level overlap.

Mathematical statement (Lean): `def equivalent (first second : Representative rational_model) : Prop`.


Logical form:

```lean
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)
```
-/
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)


/-- Theorem 1.8: persistent overlap is an equivalence relation.

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation : Equivalence (equivalent rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model)
```
-/
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model) := by
  sorry


/-- Definition 1.9: the representative setoid.

Mathematical statement (Lean): `def representative_setoid : Setoid (Representative rational_model)`.


Logical form:

```lean
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model
```
-/
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model


/-- Definition 1.10: the primitive interval real carrier.

Mathematical statement (Lean): `abbrev Carrier`.


Logical form:

```lean
abbrev Carrier := Quotient (representative_setoid rational_model)
```
-/
abbrev Carrier := Quotient (representative_setoid rational_model)


/-- Definition 2.1: the degenerate interval at a rational point.

Mathematical statement (Lean): `def degenerate_interval (value : Rational rational_model) : RationalInterval rational_model`.


Logical form:

```lean
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value
```
-/
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value


/-- Constant degenerate sequences are admissible.

Mathematical statement (Lean): `theorem constant_degenerate_sequence_is_admissible (value : Rational rational_model) : ∃ representative : Representative rational_model, ∀ index, representative.interval index = degenerate_interval rational_model value`.

*Proof status:* proof pending


Logical form:

```lean
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value
```
-/
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value := by
  sorry


/-- Definition 2.1: the constant representative C_q.

Mathematical statement (Lean): `noncomputable def rational_representative (value : Rational rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)
```
-/
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)


/-- Definition 2.2: canonical rational embedding.

Mathematical statement (Lean): `noncomputable def rational_embedding (value : Rational rational_model) : Carrier rational_model`.


Logical form:

```lean
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)
```
-/
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)


/-- Theorem 2.3: the rational embedding is injective.

Mathematical statement (Lean): `theorem rational_embedding_is_injective : ∀ first second, rational_embedding rational_model first = rational_embedding rational_model second → first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second
```
-/
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second := by
  sorry


/-- Definition 3.1: endpoint specification of the Minkowski sum.

Mathematical statement (Lean): `def IsIntervalSum (first second result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.addition
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.addition
        first.right_endpoint second.right_endpoint
```
-/
def IsIntervalSum
    (first second result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.addition
        first.left_endpoint second.left_endpoint ∧
  result.right_endpoint =
      rational_model.signature.addition
        first.right_endpoint second.right_endpoint


/-- The Minkowski sum interval exists uniquely.

Mathematical statement (Lean): `theorem interval_sum_exists_uniquely (first second : RationalInterval rational_model) : ∃ result, IsIntervalSum rational_model first second result ∧ ∀ other, IsIntervalSum rational_model first second other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result
```
-/
theorem interval_sum_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalSum rational_model first second result ∧
      ∀ other,
        IsIntervalSum rational_model first second other →
        other = result := by
  sorry


/-- Definition 3.1: Minkowski interval addition.

Mathematical statement (Lean): `noncomputable def interval_addition (first second : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)
```
-/
noncomputable def interval_addition
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose (interval_sum_exists_uniquely rational_model first second)


/-- Definition 3.2: endpoint specification of interval negation.

Mathematical statement (Lean): `def IsIntervalNegation (interval result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.negation interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.negation interval.left_endpoint
```
-/
def IsIntervalNegation
    (interval result : RationalInterval rational_model) : Prop :=
  result.left_endpoint =
      rational_model.signature.negation interval.right_endpoint ∧
  result.right_endpoint =
      rational_model.signature.negation interval.left_endpoint


/-- The negated interval exists uniquely.

Mathematical statement (Lean): `theorem interval_negation_exists_uniquely (interval : RationalInterval rational_model) : ∃ result, IsIntervalNegation rational_model interval result ∧ ∀ other, IsIntervalNegation rational_model interval other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result
```
-/
theorem interval_negation_exists_uniquely
    (interval : RationalInterval rational_model) :
    ∃ result,
      IsIntervalNegation rational_model interval result ∧
      ∀ other,
        IsIntervalNegation rational_model interval other →
        other = result := by
  sorry


/-- Definition 3.2: interval negation.

Mathematical statement (Lean): `noncomputable def interval_negation (interval : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)
```
-/
noncomputable def interval_negation
    (interval : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_negation_exists_uniquely rational_model interval)


/-- The four corner products of two intervals.

Mathematical statement (Lean): `def IsCornerProduct (first second : RationalInterval rational_model) (value : Rational rational_model) : Prop`.


Logical form:

```lean
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiplication
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiplication
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiplication
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiplication
      first.right_endpoint second.right_endpoint
```
-/
def IsCornerProduct
    (first second : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  value = rational_model.signature.multiplication
      first.left_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiplication
      first.left_endpoint second.right_endpoint ∨
  value = rational_model.signature.multiplication
      first.right_endpoint second.left_endpoint ∨
  value = rational_model.signature.multiplication
      first.right_endpoint second.right_endpoint


/-- Definition 3.3: minimum/maximum specification of an interval product.

Mathematical statement (Lean): `def IsIntervalProduct (first second result : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.NonstrictOrder result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.NonstrictOrder corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint
```
-/
def IsIntervalProduct
    (first second result : RationalInterval rational_model) : Prop :=
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.NonstrictOrder result.left_endpoint corner) ∧
  (∀ corner,
    IsCornerProduct rational_model first second corner →
    rational_model.signature.NonstrictOrder corner result.right_endpoint) ∧
  IsCornerProduct rational_model first second result.left_endpoint ∧
  IsCornerProduct rational_model first second result.right_endpoint


/-- The minimum/maximum corner enclosure exists uniquely.

Mathematical statement (Lean): `theorem interval_product_exists_uniquely (first second : RationalInterval rational_model) : ∃ result, IsIntervalProduct rational_model first second result ∧ ∀ other, IsIntervalProduct rational_model first second other → other = result`.

*Proof status:* proof pending


Logical form:

```lean
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result
```
-/
theorem interval_product_exists_uniquely
    (first second : RationalInterval rational_model) :
    ∃ result,
      IsIntervalProduct rational_model first second result ∧
      ∀ other,
        IsIntervalProduct rational_model first second other →
        other = result := by
  sorry


/-- Definition 3.3: interval multiplication.

Mathematical statement (Lean): `noncomputable def interval_multiplication (first second : RationalInterval rational_model) : RationalInterval rational_model`.


Logical form:

```lean
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)
```
-/
noncomputable def interval_multiplication
    (first second : RationalInterval rational_model) :
    RationalInterval rational_model :=
  Classical.choose
    (interval_product_exists_uniquely rational_model first second)


/-- Theorem 3.4: termwise addition preserves admissibility.

Mathematical statement (Lean): `theorem addition_preserves_admissibility (first second : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_addition rational_model (first.interval index) (second.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index)
```
-/
theorem addition_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_addition rational_model
            (first.interval index) (second.interval index) := by
  sorry


/-- Theorem 3.4: termwise negation preserves admissibility.

Mathematical statement (Lean): `theorem negation_preserves_admissibility (representative : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_negation rational_model (representative.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index)
```
-/
theorem negation_preserves_admissibility
    (representative : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_negation rational_model
            (representative.interval index) := by
  sorry


/-- Admissible representatives are uniformly rationally bounded.

Mathematical statement (Lean): `theorem admissible_representatives_are_uniformly_bounded (representative : Representative rational_model) : ∃ lower upper, ∀ index value, contains rational_model (representative.interval index) value → rational_model.signature.NonstrictOrder lower value ∧...`.

*Proof status:* proof pending


Logical form:

```lean
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.NonstrictOrder lower value ∧
        rational_model.signature.NonstrictOrder value upper
```
-/
theorem admissible_representatives_are_uniformly_bounded
    (representative : Representative rational_model) :
    ∃ lower upper,
      ∀ index value,
        contains rational_model (representative.interval index) value →
        rational_model.signature.NonstrictOrder lower value ∧
        rational_model.signature.NonstrictOrder value upper := by
  sorry


/-- Theorem 3.4: termwise multiplication preserves admissibility.

Mathematical statement (Lean): `theorem multiplication_preserves_admissibility (first second : Representative rational_model) : ∃ result : Representative rational_model, ∀ index, result.interval index = interval_multiplication rational_model (first.interval index) (second.interval index)`.

*Proof status:* proof pending


Logical form:

```lean
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index)
```
-/
theorem multiplication_preserves_admissibility
    (first second : Representative rational_model) :
    ∃ result : Representative rational_model,
      ∀ index,
        result.interval index =
          interval_multiplication rational_model
            (first.interval index) (second.interval index) := by
  sorry


/-- Chosen representative operations.

Mathematical statement (Lean): `noncomputable def representative_addition (first second : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)
```
-/
noncomputable def representative_addition
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (addition_preserves_admissibility rational_model first second)

/--
**[Def — representative_negation]**

Mathematical statement (Lean): `noncomputable def representative_negation (representative : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)
```
-/
noncomputable def representative_negation
    (representative : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (negation_preserves_admissibility rational_model representative)

/--
**[Def — representative_multiplication]**

Mathematical statement (Lean): `noncomputable def representative_multiplication (first second : Representative rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)
```
-/
noncomputable def representative_multiplication
    (first second : Representative rational_model) :
    Representative rational_model :=
  Classical.choose
    (multiplication_preserves_admissibility rational_model first second)


/-- Theorem 3.5: representative operations respect persistent overlap.

Mathematical statement (Lean): `theorem representative_operations_respect_equivalence : Foundations.Quotients.binary_operation_respects (representative_setoid rational_model) (representative_addition rational_model) ∧ Foundations.Quotients.unary_operation_respects (representative_setoid r...`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_operations_respect_equivalence :
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_model)
        (representative_addition rational_model) ∧
    Foundations.Quotients.unary_operation_respects
        (representative_setoid rational_model)
        (representative_negation rational_model) ∧
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_model)
        (representative_multiplication rational_model)
```
-/
theorem representative_operations_respect_equivalence :
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_model)
        (representative_addition rational_model) ∧
    Foundations.Quotients.unary_operation_respects
        (representative_setoid rational_model)
        (representative_negation rational_model) ∧
    Foundations.Quotients.binary_operation_respects
        (representative_setoid rational_model)
        (representative_multiplication rational_model) := by
  sorry


/-- Definition 3.6: quotient arithmetic.

Mathematical statement (Lean): `noncomputable def addition : Carrier rational_model → Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)
```
-/
noncomputable def addition :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_addition rational_model)
      (representative_operations_respect_equivalence rational_model).1)


/-- Existence of quotient negation with its computation rule.

Mathematical statement (Lean): `theorem quotient_negation_exists : ∃ negation : Carrier rational_model → Carrier rational_model, ∀ representative, negation (Quotient.mk _ representative) = Quotient.mk _ (representative_negation rational_model representative)`.

*Proof status:* proof pending


Logical form:

```lean
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative)
```
-/
theorem quotient_negation_exists :
    ∃ negation : Carrier rational_model → Carrier rational_model,
      ∀ representative,
        negation (Quotient.mk _ representative) =
          Quotient.mk _
            (representative_negation rational_model representative) := by
  sorry

/--
**[Def — negation]**

Mathematical statement (Lean): `noncomputable def negation : Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)
```
-/
noncomputable def negation :
    Carrier rational_model → Carrier rational_model :=
  Classical.choose (quotient_negation_exists rational_model)

/--
**[Def — multiplication]**

Mathematical statement (Lean): `noncomputable def multiplication : Carrier rational_model → Carrier rational_model → Carrier rational_model`.


Logical form:

```lean
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)
```
-/
noncomputable def multiplication :
    Carrier rational_model → Carrier rational_model → Carrier rational_model :=
  Classical.choose
    (Foundations.Quotients.induced_binary_operation_exists
      (representative_setoid rational_model)
      (representative_multiplication rational_model)
      (representative_operations_respect_equivalence rational_model).2.2)


/-- Definition 3.7: zero and one.

Mathematical statement (Lean): `noncomputable def zero : Carrier rational_model`.


Logical form:

```lean
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero
```
-/
noncomputable def zero : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.zero

/--
**[Def — one]**

Mathematical statement (Lean): `noncomputable def one : Carrier rational_model`.


Logical form:

```lean
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one
```
-/
noncomputable def one : Carrier rational_model :=
  rational_embedding rational_model rational_model.signature.one


/-- Definition 4.1: eventual strict separation.

Mathematical statement (Lean): `def representative_strict_order (first second : Representative rational_model) : Prop`.


Logical form:

```lean
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint
```
-/
def representative_strict_order
    (first second : Representative rational_model) : Prop :=
  ∃ first_index second_index,
    rational_model.signature.StrictOrder
      (first.interval first_index).right_endpoint
      (second.interval second_index).left_endpoint


/-- Theorem 4.2: eventual separation is representative-independent.

Mathematical statement (Lean): `theorem representative_strict_order_respects_equivalence : Foundations.Quotients.relation_respects (representative_setoid rational_model) (representative_strict_order rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem representative_strict_order_respects_equivalence :
    Foundations.Quotients.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
```
-/
theorem representative_strict_order_respects_equivalence :
    Foundations.Quotients.relation_respects
      (representative_setoid rational_model)
      (representative_strict_order rational_model) := by
  sorry


/-- Definition 4.1: strict order on quotient classes.

Mathematical statement (Lean): `noncomputable def strict_order : Carrier rational_model → Carrier rational_model → Prop`.


Logical form:

```lean
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (Foundations.Quotients.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))
```
-/
noncomputable def strict_order :
    Carrier rational_model → Carrier rational_model → Prop :=
  Classical.choose
    (Foundations.Quotients.induced_relation_exists
      (representative_setoid rational_model)
      (representative_strict_order rational_model)
      (representative_strict_order_respects_equivalence rational_model))


/-- Proposition expressing strict total order.

Mathematical statement (Lean): `def StrictTotalOrder : Prop`.


Logical form:

```lean
def StrictTotalOrder : Prop :=
  (∀ value : Carrier rational_model,
    ¬ strict_order rational_model value value) ∧
  (∀ first second third : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Carrier rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)
```
-/
def StrictTotalOrder : Prop :=
  (∀ value : Carrier rational_model,
    ¬ strict_order rational_model value value) ∧
  (∀ first second third : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Carrier rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)


/-- Theorem 4.3: the quotient order is a strict total order.

Mathematical statement (Lean): `theorem strict_total_order : StrictTotalOrder rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem strict_total_order : StrictTotalOrder rational_model
```
-/
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry


/-- Proposition expressing order compatibility.

Mathematical statement (Lean): `def OrderCompatibility : Prop`.


Logical form:

```lean
def OrderCompatibility : Prop :=
  (∀ first second translation : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second positive : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model (zero rational_model) positive →
    strict_order rational_model
      (multiplication rational_model first positive)
      (multiplication rational_model second positive))
```
-/
def OrderCompatibility : Prop :=
  (∀ first second translation : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second positive : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model (zero rational_model) positive →
    strict_order rational_model
      (multiplication rational_model first positive)
      (multiplication rational_model second positive))


/-- Theorem 4.4: order compatibility with addition and positive multiplication.

Mathematical statement (Lean): `theorem order_compatibility : OrderCompatibility rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem order_compatibility : OrderCompatibility rational_model
```
-/
theorem order_compatibility : OrderCompatibility rational_model := by
  sorry


/-- Theorem 5.1: raw interval subdistributivity.

Mathematical statement (Lean): `theorem raw_interval_subdistributivity (first second third : RationalInterval rational_model) : subset rational_model (interval_multiplication rational_model first (interval_addition rational_model second third)) (interval_addition rational_model (interval_...`.

*Proof status:* proof pending


Logical form:

```lean
theorem raw_interval_subdistributivity
    (first second third : RationalInterval rational_model) :
    subset rational_model
      (interval_multiplication rational_model first
        (interval_addition rational_model second third))
      (interval_addition rational_model
        (interval_multiplication rational_model first second)
        (interval_multiplication rational_model first third))
```
-/
theorem raw_interval_subdistributivity
    (first second third : RationalInterval rational_model) :
    subset rational_model
      (interval_multiplication rational_model first
        (interval_addition rational_model second third))
      (interval_addition rational_model
        (interval_multiplication rational_model first second)
        (interval_multiplication rational_model first third)) := by
  sorry


/-- Theorem 5.2: raw interval distributivity can fail strictly.

Mathematical statement (Lean): `theorem raw_interval_distributivity_can_fail : ∃ first second third : RationalInterval rational_model, subset rational_model (interval_multiplication rational_model first (interval_addition rational_model second third)) (interval_addition rational_model (in...`.

*Proof status:* proof pending


Logical form:

```lean
theorem raw_interval_distributivity_can_fail :
    ∃ first second third : RationalInterval rational_model,
      subset rational_model
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third)) ∧
      ¬ subset rational_model
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third))
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
```
-/
theorem raw_interval_distributivity_can_fail :
    ∃ first second third : RationalInterval rational_model,
      subset rational_model
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third)) ∧
      ¬ subset rational_model
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third))
        (interval_multiplication rational_model first
          (interval_addition rational_model second third)) := by
  sorry


/-- Theorem 5.3: the distributive defect vanishes for shrinking representatives.

Mathematical statement (Lean): `theorem distributive_defect_vanishes (first second third : Representative rational_model) : equivalent rational_model (representative_multiplication rational_model first (representative_addition rational_model second third)) (representative_addition rationa...`.

*Proof status:* proof pending


Logical form:

```lean
theorem distributive_defect_vanishes
    (first second third : Representative rational_model) :
    equivalent rational_model
      (representative_multiplication rational_model first
        (representative_addition rational_model second third))
      (representative_addition rational_model
        (representative_multiplication rational_model first second)
        (representative_multiplication rational_model first third))
```
-/
theorem distributive_defect_vanishes
    (first second third : Representative rational_model) :
    equivalent rational_model
      (representative_multiplication rational_model first
        (representative_addition rational_model second third))
      (representative_addition rational_model
        (representative_multiplication rational_model first second)
        (representative_multiplication rational_model first third)) := by
  sorry


/-- Corollary 5.4: exact distributivity in the quotient.

Mathematical statement (Lean): `theorem quotient_distributivity (first second third : Carrier rational_model) : multiplication rational_model first (addition rational_model second third) = addition rational_model (multiplication rational_model first second) (multiplication rational_model...`.

*Proof status:* proof pending


Logical form:

```lean
theorem quotient_distributivity
    (first second third : Carrier rational_model) :
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third)
```
-/
theorem quotient_distributivity
    (first second third : Carrier rational_model) :
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third) := by
  sorry


/-- Lemma 6.1: nonzero classes admit representatives eventually separated from zero.

Mathematical statement (Lean): `theorem nonzero_eventually_separated_from_zero (value : Carrier rational_model) (value_nonzero : value ≠ zero rational_model) : ∃ representative : Representative rational_model, Quotient.mk _ representative = value ∧ ∃ delta, rational_model.signature.strict...`.

*Proof status:* proof pending


Logical form:

```lean
theorem nonzero_eventually_separated_from_zero
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ representative : Representative rational_model,
      Quotient.mk _ representative = value ∧
      ∃ delta,
        rational_model.signature.StrictOrder
          rational_model.signature.zero delta ∧
        ((∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.NonstrictOrder delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.NonstrictOrder
              (representative.interval index).right_endpoint
              (rational_model.signature.negation delta)))
```
-/
theorem nonzero_eventually_separated_from_zero
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ representative : Representative rational_model,
      Quotient.mk _ representative = value ∧
      ∃ delta,
        rational_model.signature.StrictOrder
          rational_model.signature.zero delta ∧
        ((∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.NonstrictOrder delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.NonstrictOrder
              (representative.interval index).right_endpoint
              (rational_model.signature.negation delta))) := by
  sorry


/-- Definition 6.2: reciprocal interval specification away from zero.

Mathematical statement (Lean): `def IsReciprocalInterval (interval reciprocal : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inverse interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inverse interval.left_endpoint
```
-/
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inverse interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inverse interval.left_endpoint


/-- Theorem 6.3: reciprocal is representative-independent on nonzero classes.

Mathematical statement (Lean): `theorem reciprocal_exists_uniquely (value : Carrier rational_model) (value_nonzero : value ≠ zero rational_model) : ∃ inverse_value, multiplication rational_model value inverse_value = one rational_model ∧ ∀ other, multiplication rational_model value other...`.

*Proof status:* proof pending


Logical form:

```lean
theorem reciprocal_exists_uniquely
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model ∧
      ∀ other,
        multiplication rational_model value other = one rational_model →
        other = inverse_value
```
-/
theorem reciprocal_exists_uniquely
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model ∧
      ∀ other,
        multiplication rational_model value other = one rational_model →
        other = inverse_value := by
  sorry


/-- Definition 6.3: multiplicative inverse of a nonzero class.

Mathematical statement (Lean): `noncomputable def inverse (value : Carrier rational_model) (value_nonzero : value ≠ zero rational_model) : Carrier rational_model`.


Logical form:

```lean
noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)
```
-/
noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)


/-- Proposition expressing the Archimedean ordered-field laws.

Mathematical statement (Lean): `def OrderedFieldStructure : Prop`.


Logical form:

```lean
def OrderedFieldStructure : Prop :=
  StrictTotalOrder rational_model ∧
  OrderCompatibility rational_model ∧
  quotient_distributivity rational_model = quotient_distributivity rational_model ∧
  (∀ value : Carrier rational_model,
    value ≠ zero rational_model →
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model)
```
-/
def OrderedFieldStructure : Prop :=
  StrictTotalOrder rational_model ∧
  OrderCompatibility rational_model ∧
  quotient_distributivity rational_model = quotient_distributivity rational_model ∧
  (∀ value : Carrier rational_model,
    value ≠ zero rational_model →
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model)


/-- Theorem 7.1: the quotient is an Archimedean ordered field.

Mathematical statement (Lean): `theorem ordered_field_structure : OrderedFieldStructure rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem ordered_field_structure : OrderedFieldStructure rational_model
```
-/
theorem ordered_field_structure : OrderedFieldStructure rational_model := by
  sorry


/-- Proposition expressing least-upper-bound completeness.

Mathematical statement (Lean): `def LeastUpperBoundProperty : Prop`.


Logical form:

```lean
def LeastUpperBoundProperty : Prop :=
  ∀ members : Carrier rational_model → Prop,
    (∃ member, members member) →
    (∃ upper_bound,
      ∀ member,
        members member →
        ¬ strict_order rational_model upper_bound member) →
    ∃ supremum,
      (∀ member,
        members member →
        ¬ strict_order rational_model supremum member) ∧
      (∀ upper_bound,
        (∀ member,
          members member →
          ¬ strict_order rational_model upper_bound member) →
        ¬ strict_order rational_model upper_bound supremum)
```
-/
def LeastUpperBoundProperty : Prop :=
  ∀ members : Carrier rational_model → Prop,
    (∃ member, members member) →
    (∃ upper_bound,
      ∀ member,
        members member →
        ¬ strict_order rational_model upper_bound member) →
    ∃ supremum,
      (∀ member,
        members member →
        ¬ strict_order rational_model supremum member) ∧
      (∀ upper_bound,
        (∀ member,
          members member →
          ¬ strict_order rational_model upper_bound member) →
        ¬ strict_order rational_model upper_bound supremum)


/-- Theorem 7.2: nested-interval least-upper-bound completeness.

Mathematical statement (Lean): `theorem least_upper_bound_property : LeastUpperBoundProperty rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model
```
-/
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry


/-- Theorem 8.1: persistent overlap equals endpoint-null equivalence.

Mathematical statement (Lean): `theorem persistent_overlap_iff_endpoint_null (absolute_value_data : Cauchy.RationalMetricData rational_model) (first second : Representative rational_model) : equivalent rational_model first second ↔ Cauchy.is_null rational_model absolute_value_data (fun in...`.

*Proof status:* proof pending


Logical form:

```lean
theorem persistent_overlap_iff_endpoint_null
    (absolute_value_data : Cauchy.RationalMetricData rational_model)
    (first second : Representative rational_model) :
    equivalent rational_model first second ↔
      Cauchy.is_null rational_model absolute_value_data
        (fun index =>
          rational_model.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint)
```
-/
theorem persistent_overlap_iff_endpoint_null
    (absolute_value_data : Cauchy.RationalMetricData rational_model)
    (first second : Representative rational_model) :
    equivalent rational_model first second ↔
      Cauchy.is_null rational_model absolute_value_data
        (fun index =>
          rational_model.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint) := by
  sorry


/-- Corollary 8.2: canonical comparison with the Cantor endpoint construction.

Mathematical statement (Lean): `theorem canonical_comparison_isomorphism_exists : ∃ comparison : Carrier rational_model → Carrier rational_model, (∀ value, comparison value = value) ∧ (∀ rational, comparison (rational_embedding rational_model rational) = rational_embedding rational_model...`.

*Proof status:* proof pending


Logical form:

```lean
theorem canonical_comparison_isomorphism_exists :
    ∃ comparison : Carrier rational_model → Carrier rational_model,
      (∀ value, comparison value = value) ∧
      (∀ rational,
        comparison (rational_embedding rational_model rational) =
          rational_embedding rational_model rational)
```
-/
theorem canonical_comparison_isomorphism_exists :
    ∃ comparison : Carrier rational_model → Carrier rational_model,
      (∀ value, comparison value = value) ∧
      (∀ rational,
        comparison (rational_embedding rational_model rational) =
          rational_embedding rational_model rational) := by
  sorry


/-- Proposition expressing the final primitive-interval construction theorem.

Mathematical statement (Lean): `def PrimitiveIntervalConstructionOfReals : Prop`.


Logical form:

```lean
def PrimitiveIntervalConstructionOfReals : Prop :=
  OrderedFieldStructure rational_model ∧
  LeastUpperBoundProperty rational_model ∧
  (∀ first second : Representative rational_model,
    equivalent rational_model first second ↔
      equivalent rational_model first second)
```
-/
def PrimitiveIntervalConstructionOfReals : Prop :=
  OrderedFieldStructure rational_model ∧
  LeastUpperBoundProperty rational_model ∧
  (∀ first second : Representative rational_model,
    equivalent rational_model first second ↔
      equivalent rational_model first second)


/-- Theorem 9.1: final primitive-interval construction theorem.

Mathematical statement (Lean): `theorem primitive_interval_construction_of_reals : PrimitiveIntervalConstructionOfReals rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem primitive_interval_construction_of_reals :
    PrimitiveIntervalConstructionOfReals rational_model
```
-/
theorem primitive_interval_construction_of_reals :
    PrimitiveIntervalConstructionOfReals rational_model := by
  sorry

end LRA.VolumeII.RealNumbers.PrimitiveIntervals
