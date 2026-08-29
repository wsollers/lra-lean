import LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib

namespace LRA.NumberSystems.PositiveNaturals.Examples

section Mathlib

def mathlibOne :
    LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib.Carrier := 1

theorem mathlibOnePlusOne :
    mathlibOne + mathlibOne =
      (2 : LRA.NumberSystems.PositiveNaturals.Constructions.Mathlib.Carrier) := by
  sorry

end Mathlib

end LRA.NumberSystems.PositiveNaturals.Examples
