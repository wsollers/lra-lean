import LRA.NumberSystems.Arithmetic.Model.All
import LRA.NumberSystems.GaussianIntegers.Interface.Signature.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

namespace LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory

open LRA.NumberSystems.Arithmetic.Model
open LRA.NumberSystems.GaussianIntegers.Interface.Signature
open LRA.AlgebraicStructures
open LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

universe u

abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)

def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory
