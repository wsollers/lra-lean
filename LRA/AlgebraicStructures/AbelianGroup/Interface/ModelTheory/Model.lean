import LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.AbelianGroup.Interface.Definitions.ConceptSignature
import LRA.Operation.Addition.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)

universe u

/-- Promoted abelian-group model packaging the additive operator interface
together with the abelian-group law bundle. -/
structure AbelianGroupModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  [laws : LRA.AlgebraicStructures.AbelianGroupLaws Carrier]

/-- The abelian-group concept signature induced by a promoted model. -/
def AbelianGroupModel.signature {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.AlgebraicStructures.AbelianGroupConceptSignature :=
  letI := model.addInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    add := model.addition.realization.spec.add
    neg := (- ·) }

/-- The first-order model induced by a promoted abelian-group model. -/
def AbelianGroupModel.firstOrderModel {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel model.signature

end LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory
