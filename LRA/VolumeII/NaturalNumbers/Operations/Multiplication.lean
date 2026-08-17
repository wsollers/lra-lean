import LRA.VolumeII.NaturalNumbers.Operations.Addition

namespace LRA.NumberSystems.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.NumberSystems.PeanoSystems

/--
**[Definition - Multiplication on N]**

Multiplication on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the first coordinate, and
whose successor step adds the first coordinate.


Logical form:

```lean
noncomputable def NMultiplication
    (model : NModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun left value => NAddition model value left))
```
-/
noncomputable def NMultiplication
    (model : NModel Element SetObject) :
    Element -> Element -> Element :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun left value => NAddition model value left))

/--
`NMultiplicationClauses` states n multiplication clauses.

Logical form:

```lean
theorem NMultiplicationClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun left value => NAddition model value left)
      (NMultiplication model)
```
-/
theorem NMultiplicationClauses
    (model : NModel Element SetObject) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun left value => NAddition model value left)
      (NMultiplication model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      Element
      Element
      (fun left => left)
      (fun left value => NAddition model value left))

/--
`NMultiplicationWellDefined` states n multiplication well defined.

Logical form:

```lean
theorem NMultiplicationWellDefined
    (model : NModel Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun left value => NAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
          (fun left value => NAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication
```
-/
theorem NMultiplicationWellDefined
    (model : NModel Element SetObject) :
    exists multiplication : Element -> Element -> Element,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        Element
        Element
        (fun left => left)
        (fun left value => NAddition model value left)
        multiplication /\
      forall otherMultiplication : Element -> Element -> Element,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          Element
          Element
          (fun left => left)
          (fun left value => NAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    Element
    Element
    (fun left => left)
    (fun left value => NAddition model value left)

/--
`NMultiplicationWithOne` states n multiplication with one.

Logical form:

```lean
theorem NMultiplicationWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NMultiplication model left model.one = left
```
-/
theorem NMultiplicationWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NMultiplication model left model.one = left :=
  (NMultiplicationClauses model left).1

/--
`NMultiplicationSuccessorOnRight` states n multiplication successor on right.

Logical form:

```lean
theorem NMultiplicationSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NMultiplication model left (model.successor right) =
      NAddition model (NMultiplication model left right) left
```
-/
theorem NMultiplicationSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NMultiplication model left (model.successor right) =
      NAddition model (NMultiplication model left right) left :=
  (NMultiplicationClauses model left).2 right

/--
`NMultiplicationDistributesOverAddition` states n multiplication distributes over addition.

Logical form:

```lean
theorem NMultiplicationDistributesOverAddition
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (NMultiplication model)
      (NAddition model)
```
-/
theorem NMultiplicationDistributesOverAddition
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.RightDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

/--
`NLeftDistributivityOfMultiplicationOverAddition` states n left distributivity of multiplication over addition.

Logical form:

```lean
theorem NLeftDistributivityOfMultiplicationOverAddition
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (NMultiplication model)
      (NAddition model)
```
-/
theorem NLeftDistributivityOfMultiplicationOverAddition
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

/--
`NMultiplicationDistributesOverAdditionBothSides` states n multiplication distributes over addition both sides.

Logical form:

```lean
theorem NMultiplicationDistributesOverAdditionBothSides
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (NMultiplication model)
      (NAddition model)
```
-/
theorem NMultiplicationDistributesOverAdditionBothSides
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Distributive.TwoSidedDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

/--
`NMultiplicationIsAssociative` states n multiplication is associative.

Logical form:

```lean
theorem NMultiplicationIsAssociative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (NMultiplication model)
```
-/
theorem NMultiplicationIsAssociative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Associative.Associative (NMultiplication model) := by
  sorry

/--
`NMultiplicationIsCommutative` states n multiplication is commutative.

Logical form:

```lean
theorem NMultiplicationIsCommutative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (NMultiplication model)
```
-/
theorem NMultiplicationIsCommutative
    (model : NModel Element SetObject) :
    LRA.Operation.Laws.Commutative.Commutative (NMultiplication model) := by
  sorry

end LRA.NumberSystems.NaturalNumbers
