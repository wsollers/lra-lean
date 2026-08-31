import LRA.Operation.Multiplication.Interface.ModelTheory.Theory
import LRA.Operation.Multiplication.Interface.ModelTheory.LStructure
import LRA.Operation.Multiplication.Realization

namespace LRA.Operation.Multiplication.Interface.ModelTheory

universe u

/-- A promoted multiplication package exposing one carrier's generic multiplication artifact. -/
structure MultiplicationModel (Carrier : Type u) where
  instMul : Mul Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Multiplication.Realization Carrier
  realizesAmbientMul : realization.spec.mul = (· * ·)
  existence : LRA.Operation.Multiplication.ExistsOn Carrier
  uniqueness : LRA.Operation.Multiplication.UniqueOn Carrier

/-- Promote the ambient multiplication operation on a carrier into the generic multiplication interface. -/
def MultiplicationModel.ofCarrier (Carrier : Type u) [Mul Carrier] [Nonempty Carrier] :
    MultiplicationModel Carrier := by
  refine
    { instMul := inferInstance
      carrierNonempty := inferInstance
      realization := { spec := { mul := (· * ·) }, instMul := inferInstance }
      realizesAmbientMul := rfl
      existence := ⟨{ mul := (· * ·) }⟩
      uniqueness := ?_ }
  sorry

/-- The subject-facing signature induced by a promoted multiplication model. -/
def MultiplicationModel.signature {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Operation.Multiplication.Interface.Signature.MultiplicationConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  multiply := model.realization.spec.mul

/-- The first-order model induced by a promoted multiplication model. -/
def MultiplicationModel.firstOrderModel {Carrier : Type u}
    (model : MultiplicationModel Carrier) :
    LRA.Logic.FirstOrder.Model MultiplicationFirstOrderSignature :=
  BuildMultiplicationModel model.signature

end LRA.Operation.Multiplication.Interface.ModelTheory
