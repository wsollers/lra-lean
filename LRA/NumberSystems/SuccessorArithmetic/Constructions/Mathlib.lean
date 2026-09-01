import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib

abbrev Carrier := LRA.NumberSystems.SuccessorArithmetic.StandardCarrier

def genericArithmetic : SuccessorArithmetic Nat (Set Nat) where
  peanoSystem :=
    { base := 0
      successor := Nat.succ
      one_not_successor := by sorry
      successor_injective := by sorry
      induction := by sorry }

theorem satisfiesGenericType : genericArithmetic.peanoSystem.base = (0 : Carrier) := by
  rfl

abbrev zero := LRA.NumberSystems.SuccessorArithmetic.zero genericArithmetic

abbrev one := LRA.NumberSystems.SuccessorArithmetic.one genericArithmetic

end LRA.NumberSystems.SuccessorArithmetic.Constructions.Mathlib
