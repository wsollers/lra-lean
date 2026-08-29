import LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib

namespace LRA.NumberSystems.ZeroBasedNaturals.Examples

section Mathlib

def mathlibZero :
    LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib.Carrier := 0

theorem mathlibZeroPlusZero :
    mathlibZero + mathlibZero =
      (0 : LRA.NumberSystems.ZeroBasedNaturals.Constructions.Mathlib.Carrier) := by
  sorry

end Mathlib

end LRA.NumberSystems.ZeroBasedNaturals.Examples
