import LRA.AlgebraicStructures.Semiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Semiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Semiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted semiring model packaging the additive and multiplicative operator
interfaces together with the semiring law bundle. -/
structure SemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.SemiringLaws Carrier]

/-- The semiring concept signature induced by a promoted semiring model. -/
def SemiringModel.signature {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.AlgebraicStructures.SemiringConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    multiply := model.multiplication.realization.spec.mul }

/-- The first-order model induced by a promoted semiring model. -/
def SemiringModel.firstOrderModel {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.Logic.FirstOrder.Model
      LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature :=
  BuildSemiringModel model.signature

end LRA.AlgebraicStructures.Semiring.Interface.ModelTheory
