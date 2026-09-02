import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Theory
import LRA.NumberSystems.SuccessorArithmetic.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.AlgebraicStructures

universe u

structure SuccessorArithmeticModel : Type (u + 1) where
  Carrier : Type u
  [zeroInst : OfNat Carrier 0]
  [successorInst : HasSuccessor Carrier]
  [carrierNonempty : Nonempty Carrier]
  peanoSystem :
    LRA.NumberSystems.PeanoSystem.PeanoSystem Carrier (Set Carrier)
  zero_eq_base : peanoSystem.base = (0 : Carrier)
  successor_eq :
    peanoSystem.successor = LRA.AlgebraicStructures.Succ

attribute [instance] SuccessorArithmeticModel.zeroInst
  SuccessorArithmeticModel.successorInst
  SuccessorArithmeticModel.carrierNonempty

def SuccessorArithmeticModel.ofCarrier (R : Type u)
    [OfNat R 0] [HasSuccessor R] [Nonempty R]
    (peanoSystem :
      LRA.NumberSystems.PeanoSystem.PeanoSystem R (Set R))
    (zero_eq_base : peanoSystem.base = (0 : R))
    (successor_eq : peanoSystem.successor = LRA.AlgebraicStructures.Succ) :
    SuccessorArithmeticModel :=
  { Carrier := R
    peanoSystem := peanoSystem
    zero_eq_base := zero_eq_base
    successor_eq := successor_eq }

def SuccessorArithmeticModel.signature
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticSignature where
  carrier := M.Carrier
  zero := 0
  successor := LRA.AlgebraicStructures.Succ

def SuccessorArithmeticModel.firstOrderModel
    (M : SuccessorArithmeticModel) :
    SuccessorArithmeticLStructure :=
  BuildSuccessorArithmeticModel M.signature

def mathlibSuccessorArithmeticModel : SuccessorArithmeticModel :=
  SuccessorArithmeticModel.ofCarrier
    LRA.NumberSystems.SuccessorArithmetic.Carrier
    LRA.NumberSystems.SuccessorArithmetic.concretePeanoSystem
    rfl
    rfl

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
