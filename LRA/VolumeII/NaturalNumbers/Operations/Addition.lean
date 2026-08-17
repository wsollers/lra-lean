import LRA.VolumeI.Operations
import LRA.VolumeII.NaturalNumbers.Construction.NModel
import LRA.VolumeII.PeanoSystems.Recursion.BinaryIterator

namespace LRA.NumberSystems.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.NumberSystems.PeanoSystems

/--
**[Definition - Addition on N]**

Addition on an N-model is the binary iterator whose value at the distinguished
element of the second coordinate is the successor of the first coordinate, and
whose successor step applies successor.


Logical form:

```lean
noncomputable def NAddition
    (model : NModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))
```
-/
noncomputable def NAddition
    (model : NModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

/--
`NAdditionClauses` states n addition clauses.

Logical form:

```lean
theorem NAdditionClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (NAddition model)
```
-/
theorem NAdditionClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (NAddition model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => model.successor left)
      (fun _ value => model.successor value))

/--
`NAdditionWellDefined` states n addition well defined.

Logical form:

```lean
theorem NAdditionWellDefined
    (model : NModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition
```
-/
theorem NAdditionWellDefined
    (model : NModel Element SetObject) :
    exists addition : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    Element
    Element
    (fun left => model.successor left)
    (fun _ value => model.successor value)

/--
`NAdditionWithOne` states n addition with one.

Logical form:

```lean
theorem NAdditionWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NAddition model left model.one = model.successor left
```
-/
theorem NAdditionWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NAddition model left model.one = model.successor left :=
  (NAdditionClauses model left).1

/--
`NAdditionSuccessorOnRight` states n addition successor on right.

Logical form:

```lean
theorem NAdditionSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NAddition model left (model.successor right) =
      model.successor (NAddition model left right)
```
-/
theorem NAdditionSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NAddition model left (model.successor right) =
      model.successor (NAddition model left right) :=
  (NAdditionClauses model left).2 right

/--
`NAdditionIsAssociative` states n addition is associative.

Logical form:

```lean
theorem NAdditionIsAssociative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (NAddition model)
```
-/
theorem NAdditionIsAssociative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (NAddition model) := by
  sorry

/--
`NAdditionIsCommutative` states n addition is commutative.

Logical form:

```lean
theorem NAdditionIsCommutative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (NAddition model)
```
-/
theorem NAdditionIsCommutative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (NAddition model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers
