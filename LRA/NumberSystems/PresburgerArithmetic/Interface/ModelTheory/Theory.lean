import LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

structure PresburgerArithmeticTheory
    (signature : PresburgerArithmeticSignature) : Prop where
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

end LRA.NumberSystems.PresburgerArithmetic.Interface.ModelTheory

