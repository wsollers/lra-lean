-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Laws.lean
-- Strict total order and order compatibility on the quotient; raw interval
-- subdistributivity and the strict failure of raw interval distributivity;
-- vanishing of the distributive defect on shrinking representatives and
-- exact quotient distributivity; separation of nonzero classes from zero;
-- the reciprocal interval and its existence/uniqueness away from zero; the
-- Archimedean ordered-field structure; and least-upper-bound completeness.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

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
            rational_model.signature.le delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le
              (representative.interval index).right_endpoint
              (rational_model.signature.neg delta)))
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
            rational_model.signature.le delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le
              (representative.interval index).right_endpoint
              (rational_model.signature.neg delta))) := by
  sorry

/-- Definition 6.2: reciprocal interval specification away from zero.

Mathematical statement (Lean): `def IsReciprocalInterval (interval reciprocal : RationalInterval rational_model) : Prop`.


Logical form:

```lean
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inv interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inv interval.left_endpoint
```
-/
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inv interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inv interval.left_endpoint


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
  (∀ first second third : Carrier rational_model,
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third)) ∧
  (∀ value : Carrier rational_model,
    value ≠ zero rational_model →
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model)
```
-/
def OrderedFieldStructure : Prop :=
  StrictTotalOrder rational_model ∧
  OrderCompatibility rational_model ∧
  (∀ first second third : Carrier rational_model,
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third)) ∧
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

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
