import LRA.UniversalAlgebra.Algebra.Definition

namespace LRA.Relation.UniversalAlgebra

open LRA.Logic

inductive RelationOperationSymbol : Type
  | converse
  | compose
  | union
  | inter
  | complement
  deriving DecidableEq

abbrev RelationRelationSymbol := Empty

inductive RelationConstantSymbol : Type
  | empty
  | universal
  | identity
  deriving DecidableEq

def relationOperationArity : RelationOperationSymbol → Nat
  | .converse => 1
  | .compose => 2
  | .union => 2
  | .inter => 2
  | .complement => 1

def RelationOperationSymbols : ArityIndexedSymbols where
  Symbol := RelationOperationSymbol
  arity := relationOperationArity

def RelationSignature : Signature :=
  LRA.UniversalAlgebra.algebraicSignature
    RelationOperationSymbols
    RelationConstantSymbol

end LRA.Relation.UniversalAlgebra
