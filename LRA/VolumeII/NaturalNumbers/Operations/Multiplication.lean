import LRA.VolumeII.NaturalNumbers.Operations.Addition

namespace LRA.VolumeII.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.VolumeII.PeanoSystems

/--
**[Definition - Multiplication on N]**

Multiplication on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the first coordinate, and
whose successor step adds the first coordinate.
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

theorem NMultiplicationWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NMultiplication model left model.one = left :=
  (NMultiplicationClauses model left).1

theorem NMultiplicationSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NMultiplication model left (model.successor right) =
      NAddition model (NMultiplication model left right) left :=
  (NMultiplicationClauses model left).2 right

theorem NMultiplicationDistributesOverAddition
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.RightDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NLeftDistributivityOfMultiplicationOverAddition
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.LeftDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NMultiplicationDistributesOverAdditionBothSides
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.Distributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NMultiplicationIsAssociative
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.Associative (NMultiplication model) := by
  sorry

theorem NMultiplicationIsCommutative
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.Commutative (NMultiplication model) := by
  sorry

end LRA.VolumeII.NaturalNumbers
