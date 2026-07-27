-- LRA/VolumeII/RealNumbers/Model.lean
-- Real-number models as Volume I first-order algebraic models.

import LRA.VolumeI.Algebra.Models

namespace LRA
namespace VolumeII
namespace RealNumbers

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: real-number-model
Lean module: LRA.VolumeII.RealNumbers.Model
Verification status: definitions accepted
-/

/-- A real operation bundle as a first-order model of ordered fields. -/
def realNumbersModel
    (real_model : RealModel) :
    LRA.VolumeI.Logic.FirstOrder.Model orderedFieldSignature :=
  orderedFieldModel real_model.signature

end RealNumbers
end VolumeII
end LRA
