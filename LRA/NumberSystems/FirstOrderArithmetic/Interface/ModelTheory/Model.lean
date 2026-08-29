import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.Theory

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

universe u

structure FirstOrderArithmeticModel : Type (u + 1) where
  signature : FirstOrderArithmeticSignature
  satisfiesTheory : FirstOrderArithmeticTheory signature

def mathlibFirstOrderArithmeticModel : FirstOrderArithmeticModel where
  signature :=
    { carrier := Nat
      zero := 0
      successor := Nat.succ
      add := (· + ·)
      multiply := (· * ·)
      lt := (· < ·) }
  satisfiesTheory := by
    sorry

end LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

