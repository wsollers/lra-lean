-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Laws.lean
-- The commutative-ring law statements this construction must discharge.

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.WellDefinedness

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

variable {R : Type u}

section RingTheorems

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

/--
`addition_is_associative` states addition is associative.

Logical form:

```lean
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c)
```
-/
theorem addition_is_associative (a b c : GaussianInteger R) :
    (a + b) + c = a + (b + c) := by
  sorry

/--
`addition_is_commutative` states addition is commutative.

Logical form:

```lean
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a
```
-/
theorem addition_is_commutative (a b : GaussianInteger R) :
    a + b = b + a := by
  sorry

/--
`zero_add_gaussian` states zero add gaussian.

Logical form:

```lean
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a
```
-/
theorem zero_add_gaussian (a : GaussianInteger R) : 0 + a = a := by
  sorry

/--
`add_zero_gaussian` states add zero gaussian.

Logical form:

```lean
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a
```
-/
theorem add_zero_gaussian (a : GaussianInteger R) : a + 0 = a := by
  sorry

/--
`neg_add_cancel_gaussian` states neg add cancel gaussian.

Logical form:

```lean
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0
```
-/
theorem neg_add_cancel_gaussian (a : GaussianInteger R) : -a + a = 0 := by
  sorry

/--
`add_neg_cancel_gaussian` states add neg cancel gaussian.

Logical form:

```lean
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0
```
-/
theorem add_neg_cancel_gaussian (a : GaussianInteger R) : a + -a = 0 := by
  sorry

/--
`multiplication_is_associative` states multiplication is associative.

Logical form:

```lean
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c)
```
-/
theorem multiplication_is_associative (a b c : GaussianInteger R) :
    (a * b) * c = a * (b * c) := by
  sorry

/--
`multiplication_is_commutative` states multiplication is commutative.

Logical form:

```lean
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a
```
-/
theorem multiplication_is_commutative (a b : GaussianInteger R) :
    a * b = b * a := by
  sorry

/--
`one_mul_gaussian` states one mul gaussian.

Logical form:

```lean
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a
```
-/
theorem one_mul_gaussian (a : GaussianInteger R) : 1 * a = a := by
  sorry

/--
`mul_one_gaussian` states mul one gaussian.

Logical form:

```lean
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a
```
-/
theorem mul_one_gaussian (a : GaussianInteger R) : a * 1 = a := by
  sorry

/--
`zero_mul_gaussian` states zero mul gaussian.

Logical form:

```lean
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0
```
-/
theorem zero_mul_gaussian (a : GaussianInteger R) : 0 * a = 0 := by
  sorry

/--
`mul_zero_gaussian` states mul zero gaussian.

Logical form:

```lean
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0
```
-/
theorem mul_zero_gaussian (a : GaussianInteger R) : a * 0 = 0 := by
  sorry

/--
`left_distributive_gaussian` states left distributive gaussian.

Logical form:

```lean
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c
```
-/
theorem left_distributive_gaussian (a b c : GaussianInteger R) :
    a * (b + c) = a * b + a * c := by
  sorry

/--
`right_distributive_gaussian` states right distributive gaussian.

Logical form:

```lean
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c
```
-/
theorem right_distributive_gaussian (a b c : GaussianInteger R) :
    (a + b) * c = a * c + b * c := by
  sorry

/-- The Gaussian imaginary unit squares to negative one.

Logical form:

```lean
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R)
```
-/
theorem imaginary_unit_squared :
    imaginaryUnit * imaginaryUnit = -(1 : GaussianInteger R) := by
  sorry

end RingTheorems

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
