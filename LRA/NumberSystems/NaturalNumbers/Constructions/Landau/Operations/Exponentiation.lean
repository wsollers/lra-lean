import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.NumberSystems.PeanoSystem
open LRA.NumberSystems.PeanoSystem.Recursion

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


/--
**[Definition - Exponentiation on N]**

Exponentiation on a one-based Peano system is the binary iterator whose value
at the distinguished element of the second coordinate is the base, and whose
successor step multiplies by the base.
-/
noncomputable def LandauExponentiation
    (model : PeanoSystem Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))

/-- `LandauExponentiationClauses` states landau exponentiation clauses. -/
theorem LandauExponentiationClauses
    (model : PeanoSystem Element SetObject) :
    BinaryIteratorOperationClauses
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base)
      (LandauExponentiation model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model
      Element
      Element
      (fun base => base)
      (fun base value => LandauMultiplication model value base))

/-- `LandauExponentiationWellDefined` states landau exponentiation well defined. -/
theorem LandauExponentiationWellDefined
    (model : PeanoSystem Element SetObject) :
    exists exponentiation : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model
        Element
        Element
        (fun base => base)
        (fun base value => LandauMultiplication model value base)
        exponentiation /\
      forall otherExponentiation : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model
          Element
          Element
          (fun base => base)
          (fun base value => LandauMultiplication model value base)
          otherExponentiation ->
        otherExponentiation = exponentiation :=
  BinaryIteratorOperationWellDefined
    model
    Element
    Element
    (fun base => base)
    (fun base value => LandauMultiplication model value base)

/-- `LandauExponentiationWithOne` states landau exponentiation with one. -/
theorem LandauExponentiationWithOne
    (model : PeanoSystem Element SetObject)
    (base : Element) :
    LandauExponentiation model base model.one = base :=
  (LandauExponentiationClauses model base).1

/-- `LandauExponentiationSuccessorOnRight` states landau exponentiation successor on right. -/
theorem LandauExponentiationSuccessorOnRight
    (model : PeanoSystem Element SetObject)
    (base exponent : Element) :
    LandauExponentiation model base (model.successor exponent) =
      LandauMultiplication model (LandauExponentiation model base exponent) base :=
  (LandauExponentiationClauses model base).2 exponent

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
