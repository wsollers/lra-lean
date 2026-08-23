import LRA.Identity.Interface.ModelTheory.LStructure
import LRA.Identity.Interface.ModelTheory.Theory
import LRA.Logic.Model.Model

namespace LRA.Identity

open LRA.Logic

universe u

                                                      

                                                              
def EqualityStructure.toFirstOrderModel
    (equalityStructure : EqualityStructure.{u}) :
    FirstOrder.Model pureEqualitySignature where
  Domain := equalityStructure.Carrier
  domainNonempty := equalityStructure.carrierNonempty
  interpretEquality := equalityStructure.equalityInterpretation
  equalityIsDiagonal := equalityStructure.equalityIsDiagonal
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol => Empty.elim relationSymbol
  interpretConstant := Empty.elim

                                                                
def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl

                                                                             
theorem EqualityStructure.interpretsEqualityAsIdentity
    (equalityStructure : EqualityStructure.{u})
    (left right : equalityStructure.Carrier) :
    equalityStructure.equalityInterpretation left right ↔ left = right := by
  sorry

end LRA.Identity
