import LRA.NumberSystems.RealNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.RealNumbers.Examples

section Mathlib

def mathlibZero :
    LRA.NumberSystems.RealNumbers.Constructions.Mathlib.Carrier := 0

theorem mathlibZeroPlusZero :
    mathlibZero + mathlibZero =
      (0 : LRA.NumberSystems.RealNumbers.Constructions.Mathlib.Carrier) := by
  sorry
end Mathlib

end LRA.NumberSystems.RealNumbers.Examples
