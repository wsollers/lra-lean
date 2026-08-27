import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Relation.ModelTheory

open LRA.Logic

universe u

inductive RelationRelationSymbol : Type
  | rel
  deriving DecidableEq

inductive RelationConstantSymbol : Type
  deriving DecidableEq

def RelationFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

def RelationRelations : ArityIndexedSymbols where
  Symbol := RelationRelationSymbol
  arity := fun _ => 2

def RelationSignature : Signature where
  Functions := RelationFunctions
  Relations := RelationRelations
  Constants := RelationConstantSymbol

abbrev RelationLanguage := FirstOrderLanguage

def relationLanguage : RelationLanguage :=
  RelationSignature

structure RelationStructure where
  Carrier : Type u
  carrierNonempty : Nonempty Carrier
  relationInterpretation : Carrier → Carrier → Prop

end LRA.Relation.ModelTheory
