import LRA.VolumeI.Operations
import LRA.VolumeII.NaturalNumbers.Construction.NModel
import LRA.VolumeII.PeanoSystems.Recursion.BinaryIterator

namespace LRA.VolumeII.NaturalNumbers

open LRA.VolumeII.PeanoSystems

/--
**[Definition - Addition on N]**

Addition on an N-model is the binary iterator whose value at the distinguished
element of the second coordinate is the successor of the first coordinate, and
whose successor step applies successor.
-/
noncomputable def NAddition
    (model : NModel) :
    model.carrier -> model.carrier -> model.carrier :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => model.successor left)
      (fun _ value => model.successor value))

theorem NAdditionClauses
    (model : NModel) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => model.successor left)
      (fun _ value => model.successor value)
      (NAddition model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => model.successor left)
      (fun _ value => model.successor value))

theorem NAdditionWellDefined
    (model : NModel) :
    exists addition : model.carrier -> model.carrier -> model.carrier,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        model.carrier
        model.carrier
        (fun left => model.successor left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : model.carrier -> model.carrier -> model.carrier,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          model.carrier
          model.carrier
          (fun left => model.successor left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    model.carrier
    model.carrier
    (fun left => model.successor left)
    (fun _ value => model.successor value)

theorem NAdditionWithOne
    (model : NModel)
    (left : model.carrier) :
    NAddition model left model.one = model.successor left :=
  (NAdditionClauses model left).1

theorem NAdditionSuccessorOnRight
    (model : NModel)
    (left right : model.carrier) :
    NAddition model left (model.successor right) =
      model.successor (NAddition model left right) :=
  (NAdditionClauses model left).2 right

theorem NAdditionIsAssociative
    (model : NModel) :
    LRA.VolumeI.Operations.Associative (NAddition model) := by
  sorry

theorem NAdditionIsCommutative
    (model : NModel) :
    LRA.VolumeI.Operations.Commutative (NAddition model) := by
  sorry

end LRA.VolumeII.NaturalNumbers
