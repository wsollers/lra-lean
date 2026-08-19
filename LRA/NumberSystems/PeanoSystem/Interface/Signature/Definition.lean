import LRA.Logic.Model.Model

namespace LRA.NumberSystems.PeanoSystem.Interface.Signature

/-!
First-order signature for Peano systems: one constant, one unary successor.

This is the vocabulary half of §1.6.10's generic axiomatic layer, kept apart
from `PeanoSystem.Definition`'s working type the way §1.7.1 keeps every
concept's `Definition.lean` apart from its `Interface/Signature/Definition.lean`:
the first is the structure code proves things about, the second is the
signature the model theory (`Interface/ModelTheory/`) reasons about.

Collapsed here from what were previously two near-duplicate restatements of
this same one-constant-one-successor vocabulary:
`PeanoSystems/ModelTheory/FirstOrderSignature.lean`'s
`PeanoFunctionSymbol`/`PeanoConstantSymbol`/`PeanoFirstOrderSignature`, and
`NaturalNumbers/Construction/NModel.lean`'s
`NFunctionSymbol`/`NConstantSymbol`/`NSignature`. Only the former moves here;
`NModel`'s own signature restatement is `NaturalNumbers` system-layer content,
out of this row's scope (§7.7 step 3 promotes `NaturalNumbers*` separately),
and is left as a reported duplicate for that row to collapse onto this one.
-/

inductive PeanoFunctionSymbol where
  | successor

def PeanoRelationSymbol : Type := Empty

inductive PeanoConstantSymbol where
  | one

def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

end LRA.NumberSystems.PeanoSystem.Interface.Signature
