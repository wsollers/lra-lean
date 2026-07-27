-- LRA/VolumeII/RationalNumbers/Model.lean
-- Rational-number models as Volume I first-order algebraic models.

import LRA.VolumeI.Algebra.Models

namespace LRA
namespace VolumeII
namespace RationalNumbers

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: rational-number-model
Lean module: LRA.VolumeII.RationalNumbers.Model
Verification status: definitions accepted
-/

/-- A rational operation bundle as a first-order model of ordered fields. -/
def rationalNumbersModel
    (rational_model : RationalModel) :
    LRA.VolumeI.Logic.FirstOrder.Model orderedFieldSignature :=
  orderedFieldModel rational_model.signature

end RationalNumbers
end VolumeII
end LRA
