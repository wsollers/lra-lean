import LRA.VolumeI.Logic.Proof.System.Takeuti.Term

namespace LRA.VolumeI.Logic.Proof.System.Takeuti

/-!
Formulas for Takeuti-style first-order logic.

The connective `impl` is the object-language implication connective. The
sequent arrow is represented separately by `Judgement`.
-/

inductive Formula (L : Alphabet) : Type
  | atom : {n : Nat} -> L.PredicateSymbol n -> (Fin n -> FormulaArg L) -> Formula L
  | neg : Formula L -> Formula L
  | conj : Formula L -> Formula L -> Formula L
  | disj : Formula L -> Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
  | all : L.BoundVar -> Formula L -> Formula L
  | ex : L.BoundVar -> Formula L -> Formula L

def Formula.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (formula : Formula L) : Formula L :=
  match formula with
  | Formula.atom R args =>
      Formula.atom R (fun i => (args i).substFreeByArg a replacement)
  | Formula.neg A => Formula.neg (Formula.substFreeByArg a replacement A)
  | Formula.conj A B =>
      Formula.conj (Formula.substFreeByArg a replacement A)
        (Formula.substFreeByArg a replacement B)
  | Formula.disj A B =>
      Formula.disj (Formula.substFreeByArg a replacement A)
        (Formula.substFreeByArg a replacement B)
  | Formula.impl A B =>
      Formula.impl (Formula.substFreeByArg a replacement A)
        (Formula.substFreeByArg a replacement B)
  | Formula.all x A => Formula.all x (Formula.substFreeByArg a replacement A)
  | Formula.ex x A => Formula.ex x (Formula.substFreeByArg a replacement A)

def Formula.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (A : Formula L) : Formula L :=
  A.substFreeByArg a t.toFormulaArg

def Formula.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (A : Formula L) : Formula L :=
  A.substFreeByArg a (FormulaArg.bound x)

def Formula.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.FreeVarOccurs a (args i)
  | Formula.neg A => Formula.FreeVarOccurs a A
  | Formula.conj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.disj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.impl A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.all _ A => Formula.FreeVarOccurs a A
  | Formula.ex _ A => Formula.FreeVarOccurs a A

def Formula.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.BoundVarOccurs x (args i)
  | Formula.neg A => Formula.BoundVarOccurs x A
  | Formula.conj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.disj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.impl A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.all y A => y = x \/ Formula.BoundVarOccurs x A
  | Formula.ex y A => y = x \/ Formula.BoundVarOccurs x A

def Formula.BoundVarFresh {L : Alphabet} (x : L.BoundVar) (A : Formula L) : Prop :=
  Not (Formula.BoundVarOccurs x A)

end LRA.VolumeI.Logic.Proof.System.Takeuti
