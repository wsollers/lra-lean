import LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CommutativeSemiringWithoutZero.Definition
import LRA.Operation

namespace LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory

open LRA.AlgebraicStructures (CommutativeSemiringWithoutZeroConceptSignature)

structure PositiveNaturalsTheory
    (signature : CommutativeSemiringWithoutZeroConceptSignature) : Prop where
  addAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.add a b)
  addCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.add a b)
  mulAssociative :
    LRA.Operation.Laws.Associative.Associative (fun a b => signature.multiply a b)
  mulCommutative :
    LRA.Operation.Laws.Commutative.Commutative (fun a b => signature.multiply a b)
  oneMul :
    LRA.Operation.Laws.Identity.LeftIdentity
      (fun a b => signature.multiply a b) signature.one
  mulOne :
    LRA.Operation.Laws.Identity.RightIdentity
      (fun a b => signature.multiply a b) signature.one
  leftDistributive :
    LRA.Operation.Laws.Distributive.LeftDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)
  rightDistributive :
    LRA.Operation.Laws.Distributive.RightDistributive
      (fun a b => signature.multiply a b) (fun a b => signature.add a b)

end LRA.NumberSystems.PositiveNaturals.Interface.ModelTheory
