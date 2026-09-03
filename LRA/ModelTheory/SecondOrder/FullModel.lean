import Mathlib.Data.Set.Defs
import LRA.ModelTheory.SecondOrder.HenkinModel

open LRA.Logic

namespace LRA.ModelTheory.SecondOrder

/--
`FullModel` is a general second-order model with unrestricted full semantics.
The second-order domains are recovered canonically as universal classes.
-/
structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S

/-- Compatibility projection for first-order interpretation data. -/
abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
  M.toInterpretation

def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretEquality := M.interpretEquality
  equalityIsDiagonal := M.equalityIsDiagonal
  interpretFunction := M.interpretFunction
  interpretRelation := M.interpretRelation
  interpretConstant := M.interpretConstant
  RelationDomain := fun _ => Set.univ
  FunctionDomain := fun _ => Set.univ

theorem FullModel.toHenkinModel_hasFullSecondOrderSemantics
    {S : Signature} (M : FullModel S) :
    HasFullSecondOrderSemantics M.toHenkinModel := by
  constructor <;> intro arity item <;> trivial

end LRA.ModelTheory.SecondOrder
