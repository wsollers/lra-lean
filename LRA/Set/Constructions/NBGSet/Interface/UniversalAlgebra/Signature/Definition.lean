import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.Set.Constructions.NBG.Interface.UniversalAlgebra

structure RelationalSignature where
  RelationSymbol : Type
  relationArity : RelationSymbol → Nat

inductive PureMembershipRelationSymbol where
  | mem
  deriving DecidableEq

def pureMembershipRelationArity : PureMembershipRelationSymbol → Nat
  | .mem => 2

def PureRelationalNBGSignature : RelationalSignature where
  RelationSymbol := PureMembershipRelationSymbol
  relationArity := pureMembershipRelationArity

inductive ExpandedClassOperationSymbol where
  | intersection
  | complement
  | domain
  | converse
  | permuteFirst
  | permuteSecond
  | cartesianExtension
  deriving DecidableEq

def expandedClassOperationArity : ExpandedClassOperationSymbol → Nat
  | .intersection => 2
  | .complement => 1
  | .domain => 1
  | .converse => 1
  | .permuteFirst => 1
  | .permuteSecond => 1
  | .cartesianExtension => 2

inductive ExpandedClassConstantSymbol where
  | universalClass
  | elementhoodClass
  deriving DecidableEq

abbrev ExpandedClassAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := ExpandedClassOperationSymbol
  arity := expandedClassOperationArity
  ConstantSymbol := ExpandedClassConstantSymbol

end LRA.Set.Constructions.NBG.Interface.UniversalAlgebra
