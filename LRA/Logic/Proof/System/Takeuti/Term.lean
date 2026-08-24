import LRA.Logic.Proof.System.Takeuti.Alphabet

namespace LRA.Logic.Proof.System.Takeuti

/--
`Term` TODO

Predicate logic:

  inductive Term (L : Alphabet) : Type
  | free : L.FreeVar -> Term L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> Term L) -> Term L

Predicate logic (unfolded):

  inductive Term (L : Alphabet) : Type
  | free : L.FreeVar -> Term L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> Term L) -> Term L (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Term (L : Alphabet) : Type
  | free : L.FreeVar -> Term L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> Term L) -> Term L
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
inductive Term (L : Alphabet) : Type
  | free : L.FreeVar -> Term L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> Term L) -> Term L

/--
`FormulaArg` TODO

Predicate logic:

  inductive FormulaArg (L : Alphabet) : Type
  | free : L.FreeVar -> FormulaArg L
  | bound : L.BoundVar -> FormulaArg L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> FormulaArg L) -> FormulaArg L

Predicate logic (unfolded):

  inductive FormulaArg (L : Alphabet) : Type
  | free : L.FreeVar -> FormulaArg L
  | bound : L.BoundVar -> FormulaArg L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> FormulaArg L) -> FormulaArg L (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive FormulaArg (L : Alphabet) : Type
  | free : L.FreeVar -> FormulaArg L
  | bound : L.BoundVar -> FormulaArg L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> FormulaArg L) -> FormulaArg L
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
inductive FormulaArg (L : Alphabet) : Type
  | free : L.FreeVar -> FormulaArg L
  | bound : L.BoundVar -> FormulaArg L
  | func : {n : Nat} -> L.FunctionSymbol n -> (Fin n -> FormulaArg L) -> FormulaArg L

/--
`Term.toFormulaArg` TODO

Predicate logic:

  def Term.toFormulaArg {L : Alphabet} : Term L -> FormulaArg L
  | Term.free a => FormulaArg.free a
  | Term.func f args => FormulaArg.func f (fun i => (args i).toFormulaArg)

Predicate logic (unfolded):

  def Term.toFormulaArg {L : Alphabet} : Term L -> FormulaArg L
  | Term.free a => FormulaArg.free a
  | Term.func f args => FormulaArg.func f (fun i => (args i).toFormulaArg) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Term.toFormulaArg {L : Alphabet} : Term L -> FormulaArg L
  | Term.free a => FormulaArg.free a
  | Term.func f args => FormulaArg.func f (fun i => (args i).toFormulaArg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def Term.toFormulaArg {L : Alphabet} : Term L -> FormulaArg L
  | Term.free a => FormulaArg.free a
  | Term.func f args => FormulaArg.func f (fun i => (args i).toFormulaArg)

/--
`FormulaArg.substFreeByArg` TODO

Predicate logic:

  def FormulaArg.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (arg : FormulaArg L) : FormulaArg L :=
  match arg with
  | FormulaArg.free b => if b = a then replacement else FormulaArg.free b
  | FormulaArg.bound x => FormulaArg.bound x
  | FormulaArg.func f args =>
      FormulaArg.func f (fun i => FormulaArg.substFreeByArg a replacement (args i))

Predicate logic (unfolded):

  def FormulaArg.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (arg : FormulaArg L) : FormulaArg L :=
  match arg with
  | FormulaArg.free b => if b = a then replacement else FormulaArg.free b
  | FormulaArg.bound x => FormulaArg.bound x
  | FormulaArg.func f args =>
      FormulaArg.func f (fun i => FormulaArg.substFreeByArg a replacement (args i)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FormulaArg.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (arg : FormulaArg L) : FormulaArg L :=
  match arg with
  | FormulaArg.free b => if b = a then replacement else FormulaArg.free b
  | FormulaArg.bound x => FormulaArg.bound x
  | FormulaArg.func f args =>
      FormulaArg.func f (fun i => FormulaArg.substFreeByArg a replacement (args i))
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
def FormulaArg.substFreeByArg {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (replacement : FormulaArg L)
    (arg : FormulaArg L) : FormulaArg L :=
  match arg with
  | FormulaArg.free b => if b = a then replacement else FormulaArg.free b
  | FormulaArg.bound x => FormulaArg.bound x
  | FormulaArg.func f args =>
      FormulaArg.func f (fun i => FormulaArg.substFreeByArg a replacement (args i))

/--
`FormulaArg.substFreeByTerm` TODO

Predicate logic:

  def FormulaArg.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a t.toFormulaArg

Predicate logic (unfolded):

  def FormulaArg.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a t.toFormulaArg (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FormulaArg.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a t.toFormulaArg
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
def FormulaArg.substFreeByTerm {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (t : Term L) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a t.toFormulaArg

/--
`FormulaArg.substFreeByBound` TODO

Predicate logic:

  def FormulaArg.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a (FormulaArg.bound x)

Predicate logic (unfolded):

  def FormulaArg.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a (FormulaArg.bound x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FormulaArg.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a (FormulaArg.bound x)
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
def FormulaArg.substFreeByBound {L : Alphabet}
    [DecidableEq L.FreeVar]
    (a : L.FreeVar) (x : L.BoundVar) (arg : FormulaArg L) : FormulaArg L :=
  arg.substFreeByArg a (FormulaArg.bound x)

/--
`FormulaArg.FreeVarOccurs` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.FreeVar) (a_1 : LRA.Logic.Proof.System.Takeuti.FormulaArg L), (LRA.Logic.Proof.System.Takeuti.FormulaArg.brecOn.go a_1 (LRA.Logic.Proof.System.Takeuti.FormulaArg.FreeVarOccurs._f a)).1

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (a : L.1) (a_1 : LRA.Logic.Proof.System.Takeuti.FormulaArg L), (LRA.Logic.Proof.System.Takeuti.FormulaArg.brecOn.go a_1 (LRA.Logic.Proof.System.Takeuti.FormulaArg.FreeVarOccurs._f a)).1

Logical form (Lean):

```lean
def FormulaArg.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    FormulaArg L -> Prop
  | FormulaArg.free b => b = a
  | FormulaArg.bound _ => False
  | FormulaArg.func _ args => exists i, FormulaArg.FreeVarOccurs a (args i)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FormulaArg.FreeVarOccurs {L : Alphabet} (a : L.FreeVar) :
    FormulaArg L -> Prop
  | FormulaArg.free b => b = a
  | FormulaArg.bound _ => False
  | FormulaArg.func _ args => exists i, FormulaArg.FreeVarOccurs a (args i)

/--
`FormulaArg.BoundVarOccurs` TODO

Predicate logic:

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.BoundVar) (a : LRA.Logic.Proof.System.Takeuti.FormulaArg L), (LRA.Logic.Proof.System.Takeuti.FormulaArg.brecOn.go a (LRA.Logic.Proof.System.Takeuti.FormulaArg.BoundVarOccurs._f x)).1

Predicate logic (unfolded):

  ∀ {L : LRA.Logic.Proof.System.Takeuti.Alphabet} (x : L.2) (a : LRA.Logic.Proof.System.Takeuti.FormulaArg L), (LRA.Logic.Proof.System.Takeuti.FormulaArg.brecOn.go a (LRA.Logic.Proof.System.Takeuti.FormulaArg.BoundVarOccurs._f x)).1

Logical form (Lean):

```lean
def FormulaArg.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    FormulaArg L -> Prop
  | FormulaArg.free _ => False
  | FormulaArg.bound y => y = x
  | FormulaArg.func _ args => exists i, FormulaArg.BoundVarOccurs x (args i)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def FormulaArg.BoundVarOccurs {L : Alphabet} (x : L.BoundVar) :
    FormulaArg L -> Prop
  | FormulaArg.free _ => False
  | FormulaArg.bound y => y = x
  | FormulaArg.func _ args => exists i, FormulaArg.BoundVarOccurs x (args i)

end LRA.Logic.Proof.System.Takeuti
