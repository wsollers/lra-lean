import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.Theory

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

universe u

structure PresburgerArithmeticModel : Type (u + 1) where
  signature : PresburgerArithmeticSignature
  satisfiesTheory : PresburgerArithmeticTheory signature

def mathlibPresburgerArithmeticModel : PresburgerArithmeticModel where
  signature :=
    { carrier := Nat
      zero := 0
      successor := Nat.succ
      add := (· + ·)
      lt := (· < ·) }
  satisfiesTheory := by
    sorry

end LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

