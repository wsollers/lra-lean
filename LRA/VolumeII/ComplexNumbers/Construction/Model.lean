-- LRA/VolumeII/ComplexNumbers/Construction/Model.lean
-- Complex numbers as a Volume I first-order algebraic model.

import LRA.VolumeI.Algebra.Models
import LRA.VolumeII.ComplexNumbers.Construction.Construction

namespace LRA.VolumeII.ComplexNumbers

open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.ComplexNumbers
namespace LRA.VolumeII.ComplexNumbers.Construction.ComplexNumber
open LRA.VolumeI.Algebra.Models

/-!
Volume II label: complex-number-model
Lean module: LRA.VolumeII.ComplexNumbers.Construction.Model
Verification status: definitions accepted; field laws pending
-/


/-- Totalized inverse for the first-order field language.

Mathematical statement (Lean): `noncomputable def total_inverse (real_model : RealModel) (value : ComplexNumber real_model) : ComplexNumber real_model`.
-/
noncomputable def total_inverse
    (real_model : RealModel)
    (value : ComplexNumber real_model) : ComplexNumber real_model :=
  by
    classical
    exact
      if value_nonzero : nonzero real_model value then
        inverse real_model value value_nonzero
      else
        zero real_model


/-- The constructed complex numbers as a field operation bundle.

Mathematical statement (Lean): `noncomputable def complexNumbersSignature (real_model : RealModel) : FieldFirstOrderSignature`.
-/
noncomputable def complexNumbersSignature
    (real_model : RealModel) : FieldSignature where
  carrier := ComplexNumber real_model
  zero := zero real_model
  one := one real_model
  addition := addition real_model
  negation := negation real_model
  multiplication := multiplication real_model
  inverse := total_inverse real_model


/-- The constructed complex numbers as a first-order model of the field signature.

Mathematical statement (Lean): `noncomputable def complexNumbersModel (real_model : RealModel) : LRA.VolumeI.Logic.FirstOrder.Model FieldFirstOrderSignature`.
-/
noncomputable def complexNumbersModel
    (real_model : RealModel) :
    LRA.VolumeI.Logic.FirstOrder.Model FieldFirstOrderSignature :=
  BuildFieldModel (complexNumbersSignature real_model)

end LRA.VolumeII.ComplexNumbers.Construction.ComplexNumber
namespace LRA.VolumeII.ComplexNumbers
open LRA.VolumeI.Algebra.Models

end LRA.VolumeII.ComplexNumbers
