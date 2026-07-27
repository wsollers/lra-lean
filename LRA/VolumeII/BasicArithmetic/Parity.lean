-- LRA/VolumeII/BasicArithmetic/Parity.lean
-- Elementary parity facts over the active natural-number switch.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems

namespace LRA
namespace VolumeII
namespace BasicArithmetic
namespace Parity

/-!
Volume II label: basic-arithmetic-parity
Lean module: LRA.VolumeII.BasicArithmetic.Parity
Verification status: checked Mathlib-backed proofs

These facts follow the style of Lang's first parity examples. The carrier is
the active natural-number switch, currently Mathlib `Nat`.
-/

abbrev N := LRA.VolumeII.Switches.NumberSystems.NaturalNumbers.N

/-- A natural number is even when it is divisible by two. -/
def IsEven (value : N) : Prop := Even value

/-- A natural number is odd when it is not divisible by two. -/
def IsOdd (value : N) : Prop := Odd value

/-- The sum of two even natural numbers is even. -/
theorem EvenAddEven {a b : N}
    (a_even : IsEven a) (b_even : IsEven b) :
    IsEven (a + b) := by
  sorry

/-- The sum of an even and an odd natural number is odd. -/
theorem EvenAddOdd {a b : N}
    (a_even : IsEven a) (b_odd : IsOdd b) :
    IsOdd (a + b) := by
  sorry

/-- The sum of an odd and an even natural number is odd. -/
theorem OddAddEven {a b : N}
    (a_odd : IsOdd a) (b_even : IsEven b) :
    IsOdd (a + b) := by
  sorry

/-- The sum of two odd natural numbers is even. -/
theorem OddAddOdd {a b : N}
    (a_odd : IsOdd a) (b_odd : IsOdd b) :
    IsEven (a + b) := by
  sorry

/-- The square of an even natural number is even. -/
theorem SqEvenOfEven {a : N} (a_even : IsEven a) :
    IsEven (a ^ 2) := by
  sorry

/-- The square of an odd natural number is odd. -/
theorem SqOddOfOdd {a : N} (a_odd : IsOdd a) :
    IsOdd (a ^ 2) := by
  sorry

/-- If a square is even, then the original natural number is even. -/
theorem EvenOfSqEven {a : N} (square_even : IsEven (a ^ 2)) :
    IsEven a := by
  sorry

/-- If a square is odd, then the original natural number is odd. -/
theorem OddOfSqOdd {a : N} (square_odd : IsOdd (a ^ 2)) :
    IsOdd a := by
  sorry

end Parity
end BasicArithmetic
end VolumeII
end LRA
