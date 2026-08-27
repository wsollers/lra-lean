import LRA.Identity.Interface.Definitions.Equality
import LRA.Identity.Interface.UniversalAlgebra.Extensionality
import LRA.Identity.Interface.UniversalAlgebra.Quotient

namespace LRA.Identity

universe u v w

/-- Propositional equality is always a congruence, for every algebraic
structure. This is the bridge between the equality theory and the universal
algebra interface: it is the reason `IsCongruence`/`CongruenceQuotient` are
worth having at all. -/
theorem EqualityIsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature) :
    IsCongruence structure_ (EqualityRelation structure_.Carrier) := by
  sorry

/-- Quotienting an algebraic structure by propositional equality recovers the
carrier: equality is the finest congruence, so its quotient is trivial. Stated
as an explicit round trip (rather than a bundled `Equiv`) to stay within the
Mathlib-free foundational layer; see `check-mathlib-imports.py`. -/
def quotientByEqualityToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature) :
    CongruenceQuotient structure_ (EqualityRelation structure_.Carrier) →
      structure_.Carrier :=
  Quot.lift id fun _ _ (equalityProof : _ = _) => equalityProof

theorem quotientByEqualityToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    (element : structure_.Carrier) :
    quotientByEqualityToCarrier structure_ (Quot.mk _ element) = element := by
  sorry

theorem quotientByEqualityToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    (classOf : CongruenceQuotient structure_ (EqualityRelation structure_.Carrier)) :
    Quot.mk _ (quotientByEqualityToCarrier structure_ classOf) = classOf := by
  sorry

end LRA.Identity
