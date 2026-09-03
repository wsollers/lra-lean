import LRA.Operation.Addition.Interface.ModelTheory.Theory
import LRA.Operation.Addition.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Realization

namespace LRA.Operation.Addition.Interface.ModelTheory

universe u

/-- A promoted addition package exposing one carrier's generic addition artifact. -/
structure AdditionModel (Carrier : Type u) where
  instAdd : Add Carrier
  carrierNonempty : Nonempty Carrier
  realization : LRA.Operation.Addition.Realization Carrier
  realizesAmbientAdd : realization.spec.add = (· + ·)
  existence : LRA.Operation.Addition.ExistsOn Carrier
  uniqueness : LRA.Operation.Addition.UniqueOn Carrier

/-- Promote the ambient addition operation on a carrier into the generic addition interface. -/
def AdditionModel.ofCarrier (Carrier : Type u) [Add Carrier] [Nonempty Carrier] :
    AdditionModel Carrier := by
  refine
    { instAdd := inferInstance
      carrierNonempty := inferInstance
      realization := { spec := { add := (· + ·) }, instAdd := inferInstance }
      realizesAmbientAdd := rfl
      existence := ⟨{ add := (· + ·) }⟩
      uniqueness := ?_ }
  sorry

/-- The subject-facing signature induced by a promoted addition model. -/
def AdditionModel.signature {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.Operation.Addition.Interface.Signature.AdditionConceptSignature where
  carrier := Carrier
  carrierNonempty := model.carrierNonempty
  add := model.realization.spec.add

/-- The first-order model induced by a promoted addition model. -/
def AdditionModel.firstOrderModel {Carrier : Type u}
    (model : AdditionModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model AdditionFirstOrderSignature :=
  BuildAdditionModel model.signature

end LRA.Operation.Addition.Interface.ModelTheory
