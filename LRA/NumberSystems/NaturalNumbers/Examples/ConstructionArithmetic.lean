import LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib

namespace LRA.NumberSystems.NaturalNumbers.Examples

section Mathlib

def mathlibOne :
    LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier := 1

theorem mathlibOnePlusOne :
    mathlibOne + mathlibOne =
      (2 : LRA.NumberSystems.NaturalNumbers.Constructions.Mathlib.Carrier) := by
  sorry

end Mathlib

end LRA.NumberSystems.NaturalNumbers.Examples
