import LRA.VolumeII.NaturalNumbers.Operations.Multiplication

namespace LRA.VolumeII.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.VolumeII.PeanoSystems

/--
**[Definition - Exponentiation on N]**

Exponentiation on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the base, and whose successor
step multiplies by the base.
-/
noncomputable def NExponentiation
    (model : NModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun base => base)
      (fun base value => NMultiplication model value base))

theorem NExponentiationClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun base => base)
      (fun base value => NMultiplication model value base)
      (NExponentiation model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun base => base)
      (fun base value => NMultiplication model value base))

theorem NExponentiationWellDefined
    (model : NModel Element SetObject) :
    exists exponentiation : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun base => base)
        (fun base value => NMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun base => base)
          (fun base value => NMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    Element
    Element
    (fun base => base)
    (fun base value => NMultiplication model value base)

theorem NExponentiationWithOne
    (model : NModel Element SetObject)
    (base : Element) :
    NExponentiation model base model.one = base :=
  (NExponentiationClauses model base).1

theorem NExponentiationSuccessorOnRight
    (model : NModel Element SetObject)
    (base exponent : Element) :
    NExponentiation model base (model.successor exponent) =
      NMultiplication model (NExponentiation model base exponent) base :=
  (NExponentiationClauses model base).2 exponent

end LRA.VolumeII.NaturalNumbers
