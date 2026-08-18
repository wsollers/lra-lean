import LRA.Identity.Model.LStructure
import LRA.Identity.Model.Theory
import LRA.Logic.Model.Model

namespace LRA.Identity

open LRA.Logic

universe u

/-! Semantic models of the pure theory of equality. -/

/-- The first-order model induced by an equality structure. -/
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

/-- The canonical equality structure on any nonempty carrier. -/
def canonicalEqualityStructure (Carrier : Type u) [Nonempty Carrier] :
    EqualityStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  equalityInterpretation := EqualityDiagonal Carrier
  equalityIsDiagonal := by
    intro left right
    rfl

/-- In every equality structure, interpreted equality is exactly identity. -/
theorem EqualityStructure.interpretsEqualityAsIdentity
    (equalityStructure : EqualityStructure.{u})
    (left right : equalityStructure.Carrier) :
    equalityStructure.equalityInterpretation left right ↔ left = right :=
  equalityStructure.equalityIsDiagonal left right

end LRA.Identity
