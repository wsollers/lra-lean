import LRA.VolumeII.PeanoSystems.Presburger.Presburger
import LRA.VolumeI.Logic.Model.Model

/-!
First-order model data for the Presburger signature.
-/

namespace LRA.VolumeII.PeanoSystems

structure PresburgerModel where
  carrier : Type
  zero : carrier
  successor : carrier -> carrier
  addition : carrier -> carrier -> carrier
  lessThan : carrier -> carrier -> Prop

def PresburgerModel.toFirstOrderModel
    (model : PresburgerModel) :
    LRA.VolumeI.Logic.FirstOrder.Model PresburgerSignature where
  Domain := model.carrier
  domainNonempty := ⟨model.zero⟩
  interpretFunction
    | .successor, args => model.successor (args ⟨0, by decide⟩)
    | .addition, args =>
        model.addition (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretRelation
    | .lessThan, args =>
        model.lessThan (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
  interpretConstant
    | .zero => model.zero

/- Volume II label: def:presburger-arithmetic
   Lean declaration: LRA.VolumeII.PeanoSystems.PresburgerArithmetic
   Status: pending -/
def PresburgerArithmetic (_model : PresburgerModel) : Prop := True

end LRA.VolumeII.PeanoSystems
