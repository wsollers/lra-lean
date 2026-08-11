import LRA.VolumeI.Operations
import LRA.VolumeII.NaturalNumbers.Construction.NModel
import LRA.VolumeII.PeanoSystems.Recursion.BinaryIterator

namespace LRA.VolumeII.NaturalNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


open LRA.VolumeII.PeanoSystems

/--
**[Definition - Addition on N]**

Addition on an N-model is the binary iterator whose value at the distinguished
element of the second coordinate is the successor of the first coordinate, and
whose successor step applies successor.
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

theorem NAdditionWithOne
    (model : NModel Element SetObject)
    (left : Element) :
    NAddition model left model.one = model.successor left :=
  (NAdditionClauses model left).1

theorem NAdditionSuccessorOnRight
    (model : NModel Element SetObject)
    (left right : Element) :
    NAddition model left (model.successor right) =
      model.successor (NAddition model left right) :=
  (NAdditionClauses model left).2 right

theorem NAdditionIsAssociative
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.Associative (NAddition model) := by
  sorry

theorem NAdditionIsCommutative
    (model : NModel Element SetObject) :
    LRA.VolumeI.Operations.Commutative (NAddition model) := by
  sorry

end LRA.VolumeII.NaturalNumbers
