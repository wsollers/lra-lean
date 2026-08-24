import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.Model
import LRA.NumberSystems.GaussianIntegers.Interface.Signature.Definition
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

namespace LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory

open LRA.NumberSystems.GaussianIntegers.Interface.Signature
open LRA.AlgebraicStructures
open LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

universe u

abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

/-- Now built from `IntegralDomain`'s canonical `integralDomainFirstOrderModel`
(`add`/`mul`/`neg`) instead of the old `Arithmetic.Model.
arithmeticRingFirstOrderModel` (`add`/`mul` only) — `[Neg R]` was already
required by this signature even before the fix, since `GaussianInteger`
always had `Neg`; it just wasn't reachable from the first-order language
until now. -/
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.integralDomainFirstOrderModel
    (GaussianInteger R)

def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model GaussianIntegersFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory
