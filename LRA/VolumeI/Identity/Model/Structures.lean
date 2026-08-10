import LRA.VolumeI.Identity.Model.Language
import LRA.VolumeI.Logic.Model.Model

namespace LRA.VolumeI.Identity

open LRA.VolumeI.Logic

universe u

/-!
Model-theory card for the pure language of equality.

An `L_=`-structure is a nonempty carrier together with the interpretation of
logical equality as the diagonal identity relation on that carrier. Since the
pure signature has no non-logical symbols, the first-order model part carries
only the domain plus the distinguished logical equality interpretation
`=^M = Δ_M`.
-/

/-- The diagonal identity relation on a carrier. -/
def EqualityDiagonal (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  fun left right => left = right

/-- An `L_=`-structure: a nonempty carrier with equality interpreted as the diagonal. -/
structure EqualityStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  equalityInterpretation : Carrier -> Carrier -> Prop
  equalityIsDiagonal :
    ∀ left right,
      equalityInterpretation left right ↔ EqualityDiagonal Carrier left right

/-- The model-theoretic first-order model induced by an equality structure. -/
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

end LRA.VolumeI.Identity
