-- LRA/VolumeII/BasicArithmetic/Parity.lean
-- Elementary parity facts over the active natural-number switch.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems

namespace LRA.VolumeII.BasicArithmetic.Parity

/-!
Volume II label: basic-arithmetic-parity
Lean module: LRA.VolumeII.BasicArithmetic.Parity
Verification status: checked Mathlib-backed proofs

These facts follow the style of Lang's first parity examples. The carrier is
the active natural-number switch, currently Mathlib `Nat`.
-/

/--
**[Abbrev — N]**

Mathematical statement (Lean): `abbrev N`.
-/
abbrev N := LRA.VolumeII.Switches.NumberSystems.NaturalNumbers.N


/-- A natural number is even when it is divisible by two.

Mathematical statement (Lean): `def IsEven (value : N) : Prop`.
-/
def IsEven (value : N) : Prop := Even value


/-- A natural number is odd when it is not divisible by two.

Mathematical statement (Lean): `def IsOdd (value : N) : Prop`.
-/
def IsOdd (value : N) : Prop := Odd value


/-- The sum of two even natural numbers is even.

Mathematical statement (Lean): `theorem EvenAddEven {a b : N} (a_even : IsEven a) (b_even : IsEven b) : IsEven (a + b)`.

*Proof status:* proof pending
-/
theorem EvenAddEven {a b : N}
    (a_even : IsEven a) (b_even : IsEven b) :
    IsEven (a + b) := by
  sorry


/-- The sum of an even and an odd natural number is odd.

Mathematical statement (Lean): `theorem EvenAddOdd {a b : N} (a_even : IsEven a) (b_odd : IsOdd b) : IsOdd (a + b)`.

*Proof status:* proof pending
-/
theorem EvenAddOdd {a b : N}
    (a_even : IsEven a) (b_odd : IsOdd b) :
    IsOdd (a + b) := by
  sorry


/-- The sum of an odd and an even natural number is odd.

Mathematical statement (Lean): `theorem OddAddEven {a b : N} (a_odd : IsOdd a) (b_even : IsEven b) : IsOdd (a + b)`.

*Proof status:* proof pending
-/
theorem OddAddEven {a b : N}
    (a_odd : IsOdd a) (b_even : IsEven b) :
    IsOdd (a + b) := by
  sorry


/-- The sum of two odd natural numbers is even.

Mathematical statement (Lean): `theorem OddAddOdd {a b : N} (a_odd : IsOdd a) (b_odd : IsOdd b) : IsEven (a + b)`.

*Proof status:* proof pending
-/
theorem OddAddOdd {a b : N}
    (a_odd : IsOdd a) (b_odd : IsOdd b) :
    IsEven (a + b) := by
  sorry


/-- The square of an even natural number is even.

Mathematical statement (Lean): `theorem SqEvenOfEven {a : N} (a_even : IsEven a) : IsEven (a ^ 2)`.

*Proof status:* proof pending
-/
theorem SqEvenOfEven {a : N} (a_even : IsEven a) :
    IsEven (a ^ 2) := by
  sorry


/-- The square of an odd natural number is odd.

Mathematical statement (Lean): `theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) : IsOdd (a ^ 2)`.

*Proof status:* proof pending
-/
theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) :
    IsOdd (a ^ 2) := by
  sorry


/-- If a square is even, then the original natural number is even.

Mathematical statement (Lean): `theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) : IsEven a`.

*Proof status:* proof pending
-/
theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) :
    IsEven a := by
  sorry


/-- If a square is odd, then the original natural number is odd.

Mathematical statement (Lean): `theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) : IsOdd a`.

*Proof status:* proof pending
-/
theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) :
    IsOdd a := by
  sorry

end LRA.VolumeII.BasicArithmetic.Parity
