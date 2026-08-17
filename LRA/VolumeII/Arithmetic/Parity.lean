-- LRA/VolumeII/Arithmetic/Parity.lean
-- Elementary parity facts over the active natural-number carrier (Mathlib `Nat`).

import Mathlib.Algebra.Group.Even
import LRA.VolumeI.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.Parity

/-!
Volume II label: basic-arithmetic-parity
Lean module: LRA.NumberSystems.Arithmetic.Parity
Verification status: checked Mathlib-backed proofs

These facts follow the style of Lang's first parity examples. The carrier is
the active natural-number carrier (Mathlib `Nat`), currently Mathlib `Nat`.
-/

/--
**[Abbrev — N]**

Mathematical statement (Lean): `abbrev N`.


Logical form:

```lean
abbrev N := Nat
```
-/
abbrev N := Nat


/-- A natural number is even when it is divisible by two.

Mathematical statement (Lean): `def IsEven (value : N) : Prop`.


Logical form:

```lean
def IsEven (value : N) : Prop := Even value
```
-/
def IsEven (value : N) : Prop := Even value


/-- A natural number is odd when it is not divisible by two.

Mathematical statement (Lean): `def IsOdd (value : N) : Prop`.


Logical form:

```lean
def IsOdd (value : N) : Prop := Odd value
```
-/
def IsOdd (value : N) : Prop := Odd value


/-- The sum of two even natural numbers is even.

Mathematical statement (Lean): `theorem EvenAddEven {a b : N} (a_even : IsEven a) (b_even : IsEven b) : IsEven (a + b)`.

*Proof status:* proof pending


Logical form:

```lean
theorem EvenAddEven {a b : N}
    (a_even : IsEven a) (b_even : IsEven b) :
    IsEven (a + b)
```
-/
theorem EvenAddEven {a b : N}
    (a_even : IsEven a) (b_even : IsEven b) :
    IsEven (a + b) := by
  sorry


/-- The sum of an even and an odd natural number is odd.

Mathematical statement (Lean): `theorem EvenAddOdd {a b : N} (a_even : IsEven a) (b_odd : IsOdd b) : IsOdd (a + b)`.

*Proof status:* proof pending


Logical form:

```lean
theorem EvenAddOdd {a b : N}
    (a_even : IsEven a) (b_odd : IsOdd b) :
    IsOdd (a + b)
```
-/
theorem EvenAddOdd {a b : N}
    (a_even : IsEven a) (b_odd : IsOdd b) :
    IsOdd (a + b) := by
  sorry


/-- The sum of an odd and an even natural number is odd.

Mathematical statement (Lean): `theorem OddAddEven {a b : N} (a_odd : IsOdd a) (b_even : IsEven b) : IsOdd (a + b)`.

*Proof status:* proof pending


Logical form:

```lean
theorem OddAddEven {a b : N}
    (a_odd : IsOdd a) (b_even : IsEven b) :
    IsOdd (a + b)
```
-/
theorem OddAddEven {a b : N}
    (a_odd : IsOdd a) (b_even : IsEven b) :
    IsOdd (a + b) := by
  sorry


/-- The sum of two odd natural numbers is even.

Mathematical statement (Lean): `theorem OddAddOdd {a b : N} (a_odd : IsOdd a) (b_odd : IsOdd b) : IsEven (a + b)`.

*Proof status:* proof pending


Logical form:

```lean
theorem OddAddOdd {a b : N}
    (a_odd : IsOdd a) (b_odd : IsOdd b) :
    IsEven (a + b)
```
-/
theorem OddAddOdd {a b : N}
    (a_odd : IsOdd a) (b_odd : IsOdd b) :
    IsEven (a + b) := by
  sorry


/-- The square of an even natural number is even.

Mathematical statement (Lean): `theorem SqEvenOfEven {a : N} (a_even : IsEven a) : IsEven (a ^ 2)`.

*Proof status:* proof pending


Logical form:

```lean
theorem SqEvenOfEven {a : N} (a_even : IsEven a) :
    IsEven (a ^ 2)
```
-/
theorem SqEvenOfEven {a : N} (a_even : IsEven a) :
    IsEven (a ^ 2) := by
  sorry


/-- The square of an odd natural number is odd.

Mathematical statement (Lean): `theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) : IsOdd (a ^ 2)`.

*Proof status:* proof pending


Logical form:

```lean
theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) :
    IsOdd (a ^ 2)
```
-/
theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) :
    IsOdd (a ^ 2) := by
  sorry


/-- If a square is even, then the original natural number is even.

Mathematical statement (Lean): `theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) : IsEven a`.

*Proof status:* proof pending


Logical form:

```lean
theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) :
    IsEven a
```
-/
theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) :
    IsEven a := by
  sorry


/-- If a square is odd, then the original natural number is odd.

Mathematical statement (Lean): `theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) : IsOdd a`.

*Proof status:* proof pending


Logical form:

```lean
theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) :
    IsOdd a
```
-/
theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) :
    IsOdd a := by
  sorry

end LRA.NumberSystems.Arithmetic.Parity
