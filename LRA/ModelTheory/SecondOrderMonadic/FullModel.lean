import Mathlib.Data.Set.Defs
import LRA.ModelTheory.Model
import LRA.ModelTheory.SecondOrderMonadic.HenkinModel

open LRA.Logic

namespace LRA.ModelTheory.SecondOrderMonadic

/--
`FullModel` is the monadic second-order model using full semantics: second-order
quantifiers range over all subsets of the first-order domain.
-/
structure FullModel (S : Signature) extends ModelTheory.FirstOrder.Model S

/-- Compatibility projection for first-order interpretation data. -/
abbrev FullModel.toModel {S : Signature} (M : FullModel S) :=
  M.toInterpretation

/--
Forgetful map from a full monadic second-order model to its associated Henkin
model with universal admissible second-order domain.
-/
def FullModel.toHenkinModel {S : Signature} (M : FullModel S) : HenkinModel S where
  Domain := M.Domain
  domainNonempty := M.domainNonempty
  interpretEquality := M.interpretEquality
  equalityIsDiagonal := M.equalityIsDiagonal
  interpretFunction := M.interpretFunction
  interpretRelation := M.interpretRelation
  interpretConstant := M.interpretConstant
  SecondOrderDomain := Set.univ

theorem FullModel.toHenkinModel_hasFullSecondOrderSemantics
    {S : Signature} (M : FullModel S) :
    HasFullSecondOrderSemantics M.toHenkinModel := by
  intro subset
  trivial

end LRA.ModelTheory.SecondOrderMonadic
