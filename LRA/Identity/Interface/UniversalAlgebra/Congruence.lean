import LRA.Identity.Interface.UniversalAlgebra.Signature

namespace LRA.Identity

universe u v w

structure AlgebraicStructure (signature : AlgebraicSignature.{v, w}) where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  interpretOperation :
    (symbol : signature.OperationSymbol) →
      (Fin (signature.arity symbol) → Carrier) → Carrier
  interpretConstant : signature.ConstantSymbol → Carrier

def RelationReflexive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ x, relation x x

def RelationSymmetric {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y}, relation x y → relation y x

def RelationTransitive {Carrier : Type u} (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ {x y z}, relation x y → relation y z → relation x z

def OperationCompatible
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop :=
  ∀ (symbol : signature.OperationSymbol)
    (left right : Fin (signature.arity symbol) → structure_.Carrier),
      (∀ index, relation (left index) (right index)) →
        relation
          (structure_.interpretOperation symbol left)
          (structure_.interpretOperation symbol right)

structure IsCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure signature)
    (relation : structure_.Carrier → structure_.Carrier → Prop) : Prop where
  reflexive : RelationReflexive relation
  symmetric : RelationSymmetric relation
  transitive : RelationTransitive relation
  operationCompatible : OperationCompatible structure_ relation

end LRA.Identity
