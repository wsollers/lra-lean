import LRA.VolumeI.Logic.Model.Model

namespace LRA.AlgebraicStructures.Field.ModelTheory

/-!
First-order signature for fields.

This file owns the non-logical vocabulary of the ordinary first-order field
language: constants `0`, `1`, binary addition and multiplication, unary
negation, and totalized unary inverse.
-/

inductive FieldFunctionSymbol where
  | add
  | mul
  | neg
  | inv

def FieldRelationSymbol : Type := Empty

inductive FieldConstantSymbol where
  | zero
  | one

def FieldFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1
    | .inv => 1

def FieldFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := FieldRelationSymbol
  arity := Empty.elim

def FieldFirstOrderSignature : LRA.Logic.Signature where
  Functions := FieldFirstOrderFunctions
  Relations := FieldFirstOrderRelations
  Constants := FieldConstantSymbol

end LRA.AlgebraicStructures.Field.ModelTheory
