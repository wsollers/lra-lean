import LRA.VolumeII.NaturalNumbers.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.NumberSystems.PeanoSystems

/--
**[Definition - Exponentiation on N]**

Exponentiation on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the base, and whose successor
step multiplies by the base.


Logical form:

```lean
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
```
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

/--
`NExponentiationClauses` states n exponentiation clauses.

Logical form:

```lean
theorem NExponentiationClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun base => base)
      (fun base value => NMultiplication model value base)
      (NExponentiation model)
```
-/
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

/--
`NExponentiationWellDefined` states n exponentiation well defined.

Logical form:

```lean
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
        otherExponentiation = exponentiation
```
-/
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

/--
`NExponentiationWithOne` states n exponentiation with one.

Logical form:

```lean
theorem NExponentiationWithOne
    (model : NModel Element SetObject)
    (base : Element) :
    NExponentiation model base model.one = base
```
-/
theorem NExponentiationWithOne
    (model : NModel Element SetObject)
    (base : Element) :
    NExponentiation model base model.one = base :=
  (NExponentiationClauses model base).1

/--
`NExponentiationSuccessorOnRight` states n exponentiation successor on right.

Logical form:

```lean
theorem NExponentiationSuccessorOnRight
    (model : NModel Element SetObject)
    (base exponent : Element) :
    NExponentiation model base (model.successor exponent) =
      NMultiplication model (NExponentiation model base exponent) base
```
-/
theorem NExponentiationSuccessorOnRight
    (model : NModel Element SetObject)
    (base exponent : Element) :
    NExponentiation model base (model.successor exponent) =
      NMultiplication model (NExponentiation model base exponent) base :=
  (NExponentiationClauses model base).2 exponent

end LRA.NumberSystems.NaturalNumbers
