import LRA.VolumeII.PeanoSystems.Presburger.PresburgerModel
import LRA.VolumeII.PeanoSystems.Recursion.BinaryIterator
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeII.PeanoSystems

/--
**[Definition - Addition in a Presburger Model]**

Presburger addition is the zero-based binary iterator whose value at zero in
the second coordinate is the first coordinate, and whose successor step applies
successor.
-/
noncomputable def PresburgerAddition
    (model : PresburgerModel) :
    model.carrier -> model.carrier -> model.carrier :=
  Classical.choose
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun _ value => model.successor value))

theorem PresburgerAdditionClauses
    (model : PresburgerModel) :
    BinaryIteratorOperationClauses
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun _ value => model.successor value)
      (PresburgerAddition model) :=
  Classical.choose_spec
    (ExistenceOfBinaryIteratorOperation
      model.toPeanoSystem
      model.carrier
      model.carrier
      (fun left => left)
      (fun _ value => model.successor value))

theorem PresburgerAdditionWellDefined
    (model : PresburgerModel) :
    exists addition : model.carrier -> model.carrier -> model.carrier,
      BinaryIteratorOperationClauses
        model.toPeanoSystem
        model.carrier
        model.carrier
        (fun left => left)
        (fun _ value => model.successor value)
        addition /\
      forall otherAddition : model.carrier -> model.carrier -> model.carrier,
        BinaryIteratorOperationClauses
          model.toPeanoSystem
          model.carrier
          model.carrier
          (fun left => left)
          (fun _ value => model.successor value)
          otherAddition ->
        otherAddition = addition := by
  sorry

noncomputable def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel) :
    LRA.VolumeI.Logic.FirstOrder.Model PresburgerSignature where
  Domain := model.carrier
  domainNonempty := ⟨model.zero⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        PresburgerAddition model (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        model.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => model.zero

end LRA.VolumeII.PeanoSystems
