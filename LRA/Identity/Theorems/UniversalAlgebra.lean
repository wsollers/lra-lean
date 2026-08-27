import LRA.Identity.Interface.UniversalAlgebra.Extensionality
import LRA.Identity.Interface.UniversalAlgebra.Quotient
import LRA.Identity.Theorems.Equivalence
import LRA.Identity.Interop.Adapters

namespace LRA.Identity

universe u v w

theorem IdentIsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    IsCongruence structure_ Ident := by
  constructor
  · exact IdentReflexive
  · intro x y hxy
    exact IdentSymmetric hxy
  · intro x y z hxy hyz
    exact IdentTransitive hxy hyz
  · intro symbol lhs rhs hypo
    exact Interop.ofEq
      (structure_.interpretOperationCongruence symbol (fun i => Interop.toEq (hypo i)))

def quotientByIdentToCarrier
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier] :
    CongruenceQuotient structure_ Ident → structure_.Carrier :=
  Quot.lift id fun _ _ h => Interop.toEq h

theorem quotientByIdentToCarrier_leftInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (element : structure_.Carrier) :
    quotientByIdentToCarrier structure_ (Quot.mk _ element) = element :=
  rfl

theorem quotientByIdentToCarrier_rightInverse
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    [IdentityRelation structure_.Carrier]
    (classOf : CongruenceQuotient structure_ Ident) :
    Quot.mk _ (quotientByIdentToCarrier structure_ classOf) = classOf :=
  Quot.inductionOn classOf (fun _ => rfl)

end LRA.Identity
