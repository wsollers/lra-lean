import LRA.Logic.Proof.System.Takeuti.Term

namespace LRA.Logic.Proof.System.Takeuti

/--
`Formula` TODO

Predicate logic:

  inductive Formula (L : Alphabet) : Type
  | atom : {n : Nat} -> L.PredicateSymbol n -> (Fin n -> FormulaArg L) -> Formula L
  | neg : Formula L -> Formula L
  | conj : Formula L -> Formula L -> Formula L
  | disj : Formula L -> Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
  | all : L.BoundVar -> Formula L -> Formula L
  | ex : L.BoundVar -> Formula L -> Formula L

Predicate logic (unfolded):

  inductive Formula (L : Alphabet) : Type
  | atom : {n : Nat} -> L.PredicateSymbol n -> (Fin n -> FormulaArg L) -> Formula L
  | neg : Formula L -> Formula L
  | conj : Formula L -> Formula L -> Formula L
  | disj : Formula L -> Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
  | all : L.BoundVar -> Formula L -> Formula L
  | ex : L.BoundVar -> Formula L -> Formula L (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Formula (L : Alphabet) : Type
  | atom : {n : Nat} -> L.PredicateSymbol n -> (Fin n -> FormulaArg L) -> Formula L
  | neg : Formula L -> Formula L
  | conj : Formula L -> Formula L -> Formula L
  | disj : Formula L -> Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
  | all : L.BoundVar -> Formula L -> Formula L
  | ex : L.BoundVar -> Formula L -> Formula L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
inductive Formula (L : Alphabet) : Type
  | atom : {n : Nat} -> L.PredicateSymbol n -> (Fin n -> FormulaArg L) -> Formula L
  | neg : Formula L -> Formula L
  | conj : Formula L -> Formula L -> Formula L
  | disj : Formula L -> Formula L -> Formula L
  | impl : Formula L -> Formula L -> Formula L
  | all : L.BoundVar -> Formula L -> Formula L
  | ex : L.BoundVar -> Formula L -> Formula L

/--
`Formula.substFreeByArg` TODO

Predicate logic:

  def Formula.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (formula : Formula L) : Formula L

Predicate logic (unfolded):

  def Formula.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (formula : Formula L) : Formula L (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (formula : Formula L) : Formula L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
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

/--
`Formula.substFreeByTerm` TODO

Predicate logic:

  def Formula.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (A : Formula L) : Formula L :=
  A.substFreeByArg a t.toFormulaArg

Predicate logic (unfolded):

  def Formula.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (A : Formula L) : Formula L :=
  A.substFreeByArg a t.toFormulaArg (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (A : Formula L) : Formula L :=
  A.substFreeByArg a t.toFormulaArg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Formula.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (A : Formula L) : Formula L :=
  A.substFreeByArg a t.toFormulaArg

/--
`Formula.substFreeByBound` TODO

Predicate logic:

  def Formula.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (A : Formula L) : Formula L :=
  A.substFreeByArg a (FormulaArg.bound x)

Predicate logic (unfolded):

  def Formula.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (A : Formula L) : Formula L :=
  A.substFreeByArg a (FormulaArg.bound x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Formula.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (A : Formula L) : Formula L :=
  A.substFreeByArg a (FormulaArg.bound x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Formula.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (A : Formula L) : Formula L :=
  A.substFreeByArg a (FormulaArg.bound x)

/--
`Formula.FreeVarOccurs` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.FreeVar) (a_1 : LRA.Logic.Proof.System.Takeuti.Formula L), (LRA.Logic.Proof.System.Takeuti.Formula.brecOn.go a_1 (LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs._f a)).1

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.1) (a_1 : LRA.Logic.Proof.System.Takeuti.Formula L), (LRA.Logic.Proof.System.Takeuti.Formula.brecOn.go a_1 (LRA.Logic.Proof.System.Takeuti.Formula.FreeVarOccurs._f a)).1

Logical form (Lean):

```lean
def Formula.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.FreeVarOccurs a (args i)
  | Formula.neg A => Formula.FreeVarOccurs a A
  | Formula.conj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.disj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.impl A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.all _ A => Formula.FreeVarOccurs a A
  | Formula.ex _ A => Formula.FreeVarOccurs a A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, use, unfold

-/
def Formula.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.FreeVarOccurs a (args i)
  | Formula.neg A => Formula.FreeVarOccurs a A
  | Formula.conj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.disj A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.impl A B => Formula.FreeVarOccurs a A \/ Formula.FreeVarOccurs a B
  | Formula.all _ A => Formula.FreeVarOccurs a A
  | Formula.ex _ A => Formula.FreeVarOccurs a A

/--
`Formula.BoundVarOccurs` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.BoundVar) (a : LRA.Logic.Proof.System.Takeuti.Formula L), (LRA.Logic.Proof.System.Takeuti.Formula.brecOn.go a (LRA.Logic.Proof.System.Takeuti.Formula.BoundVarOccurs._f x)).1

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.2) (a : LRA.Logic.Proof.System.Takeuti.Formula L), (LRA.Logic.Proof.System.Takeuti.Formula.brecOn.go a (LRA.Logic.Proof.System.Takeuti.Formula.BoundVarOccurs._f x)).1

Logical form (Lean):

```lean
def Formula.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.BoundVarOccurs x (args i)
  | Formula.neg A => Formula.BoundVarOccurs x A
  | Formula.conj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.disj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.impl A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.all y A => y = x \/ Formula.BoundVarOccurs x A
  | Formula.ex y A => y = x \/ Formula.BoundVarOccurs x A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, use, unfold

-/
def Formula.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    Formula L -> Prop
  | Formula.atom _ args => exists i, FormulaArg.BoundVarOccurs x (args i)
  | Formula.neg A => Formula.BoundVarOccurs x A
  | Formula.conj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.disj A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.impl A B => Formula.BoundVarOccurs x A \/ Formula.BoundVarOccurs x B
  | Formula.all y A => y = x \/ Formula.BoundVarOccurs x A
  | Formula.ex y A => y = x \/ Formula.BoundVarOccurs x A

/--
`Formula.BoundVarFresh` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.BoundVar) (A : LRA.Logic.Proof.System.Takeuti.Formula L), LRA.Logic.Proof.System.Takeuti.Formula.BoundVarOccurs x A → False

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.2) (A : LRA.Logic.Proof.System.Takeuti.Formula L), LRA.Logic.Proof.System.Takeuti.Formula.BoundVarOccurs x A → False

Logical form (Lean):

```lean
def Formula.BoundVarFresh {L : Alphabet} (x : L.BoundVar) (A : Formula L) : Prop :=
  Not (Formula.BoundVarOccurs x A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def Formula.BoundVarFresh {L : Alphabet} (x : L.BoundVar) (A : Formula L) : Prop :=
  Not (Formula.BoundVarOccurs x A)

end LRA.Logic.Proof.System.Takeuti
