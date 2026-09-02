import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier

abbrev genericArithmetic :=
  LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem

theorem satisfiesGenericType : genericArithmetic.base = (0 : Carrier) := by
  rfl

abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero

abbrev one := LRA.NumberSystems.SuccessorArithmetic.one

abbrev successor := LRA.NumberSystems.SuccessorArithmetic.successor

end LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib
