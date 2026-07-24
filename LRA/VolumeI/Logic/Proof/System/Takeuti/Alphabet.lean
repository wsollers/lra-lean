namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Takeuti-style alphabet data for first-order logic.

Free variables and bound variables are deliberately separate. Terms contain
only free variables; quantified formula bodies are represented by formula
arguments that may contain bound variables.
-/

structure Alphabet where
  FreeVar : Type
  BoundVar : Type
  FunctionSymbol : Nat -> Type
  PredicateSymbol : Nat -> Type

end LRA.VolumeI.Logic.Proof.System.Takeuti
