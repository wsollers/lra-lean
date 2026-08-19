-- LRA/NumberSystems/IntegerStructure/Interface/Signature/Definition.lean
-- First-order signature for integer structures: two unary operations
-- (successor, predecessor), three constants (zero, one, negative one).

import LRA.Logic.Model.Model

namespace LRA.NumberSystems.IntegerStructure.Interface.Signature

/-!
The vocabulary half of `IntegerStructure`'s generic axiomatic layer, kept
apart from `IntegerStructure.Definition`'s working type the same way
`PeanoSystem.Interface.Signature.Definition` is kept apart from
`PeanoSystem.Definition`: the first is the structure code proves things
about, the second is the signature the model theory
(`Interface/ModelTheory/`) reasons about.
-/

inductive IntegerFunctionSymbol where
  | successor
  | predecessor

def IntegerRelationSymbol : Type := Empty

inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne

def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1

def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
  arity := Empty.elim

def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol

end LRA.NumberSystems.IntegerStructure.Interface.Signature
