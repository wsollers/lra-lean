import LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

namespace LRA.NumberSystems.SuccessorArithmetic.Examples

def mathlibBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier := 0

theorem mathlibSuccessorBase :
    LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.successor mathlibBase =
      (1 : LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib.Carrier) := by
  sorry
end LRA.NumberSystems.SuccessorArithmetic.Examples
