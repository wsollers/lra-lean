import LRA.VolumeI.Logic.Proof.System.Takeuti.Alphabet

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Terms in Takeuti's presentation.

Only free variables are terms. Bound variables may appear in formula argument
positions after a quantifier has promoted selected free-variable occurrences.
-/

inductive Term (L : Alphabet) : Type
  | free : L.FreeVar -> Term L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> Term L) -> Term L

/-!
Formula arguments are the term-shaped expressions that occur inside atomic
formulas. Unlike `Term`, they may contain bound variables.
-/

inductive FormulaArg (L : Alphabet) : Type
  | free : L.FreeVar -> FormulaArg L
  | bound : L.BoundVar -> FormulaArg L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> FormulaArg L) -> FormulaArg L

def Term.toFormulaArg {L : Alphabet} : Term L -> FormulaArg L
  | Term.free a => FormulaArg.free a
  | Term.func f args => FormulaArg.func f (fun i => (args i).toFormulaArg)

def FormulaArg.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (arg : FormulaArg L) : FormulaArg L :=
  match arg with
  | FormulaArg.free b => if b = a then replacement else FormulaArg.free b
  | FormulaArg.bound x => FormulaArg.bound x
  | FormulaArg.func f args =>
      FormulaArg.func f (fun i => FormulaArg.substFreeByArg a replacement (args i))

def FormulaArg.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a t.toFormulaArg

def FormulaArg.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a (FormulaArg.bound x)

def FormulaArg.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    FormulaArg L -> Prop
  | FormulaArg.free b => b = a
  | FormulaArg.bound _ => False
  | FormulaArg.func _ args => exists i, FormulaArg.FreeVarOccurs a (args i)

def FormulaArg.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    FormulaArg L -> Prop
  | FormulaArg.free _ => False
  | FormulaArg.bound y => y = x
  | FormulaArg.func _ args => exists i, FormulaArg.BoundVarOccurs x (args i)

end LRA.VolumeI.Logic.Proof.System.Takeuti
