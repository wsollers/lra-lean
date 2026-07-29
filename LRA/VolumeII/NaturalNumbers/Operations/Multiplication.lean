import LRA.VolumeII.NaturalNumbers.Operations.Addition

namespace LRA.VolumeII.NaturalNumbers

open LRA.VolumeII.PeanoSystems

/--
**[Definition - Multiplication on N]**

Multiplication on an N-model is the binary iterator whose value at the
distinguished element of the second coordinate is the first coordinate, and
whose successor step adds the first coordinate.
-/
noncomputable def NMultiplication
    (model : NModel) :
    model.carrier -> model.carrier -> model.carrier :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun left value => NAddition model value left))

theorem NMultiplicationClauses
    (model : NModel) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun left value => NAddition model value left)
      (NMultiplication model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun left value => NAddition model value left))

theorem NMultiplicationWellDefined
    (model : NModel) :
    exists multiplication : model.carrier -> model.carrier -> model.carrier,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        model.carrier
        model.carrier
        (fun left => left)
        (fun left value => NAddition model value left)
        multiplication /\
      forall otherMultiplication : model.carrier -> model.carrier -> model.carrier,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          model.carrier
          model.carrier
          (fun left => left)
          (fun left value => NAddition model value left)
          otherMultiplication ->
        otherMultiplication = multiplication :=
  BinaryIteratorOperationWellDefined
    model.toPeanoSystem
    model.carrier
    model.carrier
    (fun left => left)
    (fun left value => NAddition model value left)

theorem NMultiplicationWithOne
    (model : NModel)
    (left : model.carrier) :
    NMultiplication model left model.one = left :=
  (NMultiplicationClauses model left).1

theorem NMultiplicationSuccessorOnRight
    (model : NModel)
    (left right : model.carrier) :
    NMultiplication model left (model.successor right) =
      NAddition model (NMultiplication model left right) left :=
  (NMultiplicationClauses model left).2 right

theorem NMultiplicationDistributesOverAddition
    (model : NModel) :
    LRA.VolumeI.Algebra.RightDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NLeftDistributivityOfMultiplicationOverAddition
    (model : NModel) :
    LRA.VolumeI.Algebra.LeftDistributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NMultiplicationDistributesOverAdditionBothSides
    (model : NModel) :
    LRA.VolumeI.Algebra.Distributive
      (NMultiplication model)
      (NAddition model) := by
  sorry

theorem NMultiplicationIsAssociative
    (model : NModel) :
    LRA.VolumeI.Algebra.Associative (NMultiplication model) := by
  sorry

theorem NMultiplicationIsCommutative
    (model : NModel) :
    LRA.VolumeI.Algebra.Commutative (NMultiplication model) := by
  sorry

end LRA.VolumeII.NaturalNumbers
