import LRA.NumberSystems.Integers.Constructions.Mathlib
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor

namespace LRA.NumberSystems.Integers.Examples

section Mathlib

def mathlibZero :
    LRA.NumberSystems.Integers.Constructions.Mathlib.Carrier := 0

theorem mathlibZeroPlusZero :
    mathlibZero + mathlibZero =
      (0 : LRA.NumberSystems.Integers.Constructions.Mathlib.Carrier) := by
  sorry
end Mathlib

section Polish

open LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

def polishZero : Z := Z.zero

theorem polishZeroPlusZero : polishZero + polishZero = Z.zero := by
  sorry
end Polish

end LRA.NumberSystems.Integers.Examples
