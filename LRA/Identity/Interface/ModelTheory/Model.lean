import LRA.Identity.Theorems.ModelTheory
import LRA.ModelTheory.Model

namespace LRA.Identity

open LRA.Logic

universe u

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

def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  satisfiesIdentityTheory :=
    ⟨fun _ => rfl, fun _ _ h _ _ hp => h ▸ hp⟩

end LRA.Identity
