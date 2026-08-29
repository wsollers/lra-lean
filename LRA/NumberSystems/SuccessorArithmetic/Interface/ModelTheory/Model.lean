import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Theory

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

universe u

structure SuccessorArithmeticModel : Type (u + 1) where
  signature : SuccessorArithmeticSignature
  satisfiesTheory : SuccessorArithmeticTheory signature

def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel where
  signature :=
    { carrier := Nat
      base := 0
      successor := Nat.succ }
  satisfiesTheory := by
    sorry

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

