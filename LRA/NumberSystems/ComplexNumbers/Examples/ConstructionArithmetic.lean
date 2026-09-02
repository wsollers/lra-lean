import LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

namespace LRA.NumberSystems.ComplexNumbers.Examples

section Mathlib

def mathlibZero :
    LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.Carrier := 0

theorem mathlibZeroPlusZero :
    mathlibZero + mathlibZero =
      (0 : LRA.NumberSystems.ComplexNumbers.Constructions.Mathlib.Carrier) := by
  sorry
end Mathlib

section OrderedPairs

open LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

def orderedPairsZero : ComplexNumber Real := 0

theorem orderedPairsZeroPlusZero :
    orderedPairsZero + orderedPairsZero = (0 : ComplexNumber Real) := by
  sorry
end OrderedPairs

end LRA.NumberSystems.ComplexNumbers.Examples
