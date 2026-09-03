import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Interface.Logic.SecondOrder.Theory
import LRA.Identity.Bridges.Diagonal
import LRA.ModelTheory.Model
import LRA.ModelTheory.SecondOrder.FullModel

namespace LRA.Identity

open LRA.Logic

universe u

theorem EqualityStructure.isDiagonal (S : EqualityStructure.{u}) :
    ∀ left right, S.equalityInterpretation left right ↔ EqualityDiagonal S.Carrier left right :=
  fun left right =>
    @IdentIsDiagonal S.Carrier (IdentityRelation.ofIdentityTheory S.satisfiesIdentityTheory)
      left right

def EqualityStructure.toFirstOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.FirstOrder.Model pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

def EqualityStructure.toFullSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature where
  Domain := S.Carrier
  domainNonempty := S.carrierNonempty
  interpretEquality := S.equalityInterpretation
  equalityIsDiagonal := S.isDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

abbrev EqualityStructure.toSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  S.toFullSecondOrderModel

abbrev EqualityStructure.toHenkinSecondOrderModel
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HenkinModel pureEqualitySignature :=
  S.toFullSecondOrderModel.toHenkinModel

theorem EqualityStructure.toHenkinSecondOrderModel_hasFullSecondOrderSemantics
    (S : EqualityStructure.{u}) :
    ModelTheory.SecondOrder.HasFullSecondOrderSemantics S.toHenkinSecondOrderModel := by
  simpa [EqualityStructure.toHenkinSecondOrderModel] using
    ModelTheory.SecondOrder.FullModel.toHenkinModel_hasFullSecondOrderSemantics
      S.toFullSecondOrderModel

def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  satisfiesIdentityTheory :=
    ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩

abbrev canonicalFirstOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.FirstOrder.Model pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFirstOrderModel

abbrev canonicalSecondOrderEqualityModel (Carrier : Type u) [Nonempty Carrier] :
    ModelTheory.SecondOrder.FullModel pureEqualitySignature :=
  (canonicalEqualityStructure Carrier).toFullSecondOrderModel

end LRA.Identity
