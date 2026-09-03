import LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/-- Promoted commutative-semiring model packaging the operator interfaces
together with the commutative-semiring law bundle. -/
structure CommutativeSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeSemiringLaws Carrier]

/-- The commutative-semiring concept signature induced by a promoted model. -/
def CommutativeSemiringModel.signature {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.AlgebraicStructures.CommutativeSemiringConceptSignature :=
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

/-- The first-order model induced by a promoted commutative-semiring model. -/
def CommutativeSemiringModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature :=
  BuildCommutativeSemiringModel model.signature

end LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory
