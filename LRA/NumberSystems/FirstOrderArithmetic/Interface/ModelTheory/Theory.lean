import LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

structure FirstOrderArithmeticTheory
    (signature : FirstOrderArithmeticSignature) : Prop where
  zeroNotSuccessor :
    ∀ element : signature.carrier,
      signature.successor element ≠ signature.zero
  successorInjective :
    ∀ first second : signature.carrier,
      signature.successor first = signature.successor second → first = second
  addZero :
    ∀ element : signature.carrier,
      signature.add element signature.zero = element
  addSuccessor :
    ∀ first second : signature.carrier,
      signature.add first (signature.successor second) =
        signature.successor (signature.add first second)
  mulZero :
    ∀ element : signature.carrier,
      signature.multiply element signature.zero = signature.zero
  mulSuccessor :
    ∀ first second : signature.carrier,
      signature.multiply first (signature.successor second) =
        signature.add (signature.multiply first second) first

end LRA.NumberSystems.FirstOrderArithmetic.Interface.ModelTheory

