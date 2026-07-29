import LRA.VolumeII.NaturalNumbers.Operations.Multiplication

namespace LRA.VolumeII.NaturalNumbers

open LRA.VolumeII.PeanoSystems

/--
**[Definition - Exponentiation on N]**

Exponentiation on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the base, and whose successor
step multiplies by the base.
-/
noncomputable def NExponentiation
    (model : NModel) :
    model.carrier -> model.carrier -> model.carrier :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun base => base)
      (fun base value => NMultiplication model value base))

theorem NExponentiationClauses
    (model : NModel) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun base => base)
      (fun base value => NMultiplication model value base)
      (NExponentiation model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun base => base)
      (fun base value => NMultiplication model value base))

theorem NExponentiationWellDefined
    (model : NModel) :
    exists exponentiation : model.carrier -> model.carrier -> model.carrier,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        model.carrier
        model.carrier
        (fun base => base)
        (fun base value => NMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : model.carrier -> model.carrier -> model.carrier,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          model.carrier
          model.carrier
          (fun base => base)
          (fun base value => NMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    model.carrier
    model.carrier
    (fun base => base)
    (fun base value => NMultiplication model value base)

theorem NExponentiationWithOne
    (model : NModel)
    (base : model.carrier) :
    NExponentiation model base model.one = base :=
  (NExponentiationClauses model base).1

theorem NExponentiationSuccessorOnRight
    (model : NModel)
    (base exponent : model.carrier) :
    NExponentiation model base (model.successor exponent) =
      NMultiplication model (NExponentiation model base exponent) base :=
  (NExponentiationClauses model base).2 exponent

end LRA.VolumeII.NaturalNumbers
