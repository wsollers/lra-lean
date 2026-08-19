-- LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Laws.lean
-- The ring and field law statements this construction must discharge.

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` states addition is associative.

Logical form:

```lean
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c)
```
-/
theorem addition_is_associative (a b c : ComplexNumber R) :
    (a + b) + c = a + (b + c) := by
  sorry

/--
`addition_is_commutative` states addition is commutative.

Logical form:

```lean
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a
```
-/
theorem addition_is_commutative (a b : ComplexNumber R) :
    a + b = b + a := by
  sorry

/--
`zero_add_complex` states zero add complex.

Logical form:

```lean
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a
```
-/
theorem zero_add_complex (a : ComplexNumber R) : 0 + a = a := by
  sorry

/--
`add_zero_complex` states add zero complex.

Logical form:

```lean
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a
```
-/
theorem add_zero_complex (a : ComplexNumber R) : a + 0 = a := by
  sorry

/--
`neg_add_cancel_complex` states neg add cancel complex.

Logical form:

```lean
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0
```
-/
theorem neg_add_cancel_complex (a : ComplexNumber R) : -a + a = 0 := by
  sorry

/--
`add_neg_cancel_complex` states add neg cancel complex.

Logical form:

```lean
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0
```
-/
theorem add_neg_cancel_complex (a : ComplexNumber R) : a + -a = 0 := by
  sorry

/--
`multiplication_is_associative` states multiplication is associative.

Logical form:

```lean
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c)
```
-/
theorem multiplication_is_associative (a b c : ComplexNumber R) :
    (a * b) * c = a * (b * c) := by
  sorry

/--
`multiplication_is_commutative` states multiplication is commutative.

Logical form:

```lean
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a
```
-/
theorem multiplication_is_commutative (a b : ComplexNumber R) :
    a * b = b * a := by
  sorry

/--
`one_mul_complex` states one mul complex.

Logical form:

```lean
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a
```
-/
theorem one_mul_complex (a : ComplexNumber R) : 1 * a = a := by
  sorry

/--
`mul_one_complex` states mul one complex.

Logical form:

```lean
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a
```
-/
theorem mul_one_complex (a : ComplexNumber R) : a * 1 = a := by
  sorry

/--
`zero_mul_complex` states zero mul complex.

Logical form:

```lean
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0
```
-/
theorem zero_mul_complex (a : ComplexNumber R) : 0 * a = 0 := by
  sorry

/--
`mul_zero_complex` states mul zero complex.

Logical form:

```lean
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0
```
-/
theorem mul_zero_complex (a : ComplexNumber R) : a * 0 = 0 := by
  sorry

/--
`left_distributive_complex` states left distributive complex.

Logical form:

```lean
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c
```
-/
theorem left_distributive_complex (a b c : ComplexNumber R) :
    a * (b + c) = a * b + a * c := by
  sorry

/--
`right_distributive_complex` states right distributive complex.

Logical form:

```lean
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c
```
-/
theorem right_distributive_complex (a b c : ComplexNumber R) :
    (a + b) * c = a * c + b * c := by
  sorry

/-- The defining identity: `i² = -1`.

Logical form:

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R)
```
-/
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : ComplexNumber R) := by
  sorry

end RingTheorems

section FieldTheorems

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

/--
`one_ne_zero_complex` states one ne zero complex.

Logical form:

```lean
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0
```
-/
theorem one_ne_zero_complex : (1 : ComplexNumber R) ≠ 0 := by
  sorry

/--
`mul_inv_cancel_complex` states mul inv cancel complex.

Logical form:

```lean
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1
```
-/
theorem mul_inv_cancel_complex
    (value : ComplexNumber R) (value_nonzero : value ≠ 0) :
    value * value⁻¹ = 1 := by
  sorry

/--
`inv_zero_complex` states inv zero complex.

Logical form:

```lean
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0
```
-/
theorem inv_zero_complex : (0 : ComplexNumber R)⁻¹ = 0 := by
  sorry

end FieldTheorems

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
