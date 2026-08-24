import LRA.Logic.Language.Symbols.Signature

namespace LRA.Logic.Language.Notation

/--
`LogicalConnective` TODO

Predicate logic:

  inductive LogicalConnective where
  | neg
  | impl

Predicate logic (unfolded):

  inductive LogicalConnective where
  | neg
  | impl (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive LogicalConnective where
  | neg
  | impl
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive LogicalConnective where
  | neg
  | impl

/--
`LogicalConnectives` TODO

Predicate logic:

  def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2

Predicate logic (unfolded):

  def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2
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
def LogicalConnectives : ArityIndexedSymbols where
  Symbol := LogicalConnective
  arity
    | .neg => 1
    | .impl => 2

/--
`LogicalConnectives.negIsUnary` TODO

Predicate logic:

  LogicalConnectives.IsUnary .neg

Predicate logic (unfolded):

  LRA.Logic.Language.Notation.LogicalConnectives.2 LRA.Logic.Language.Notation.LogicalConnective.neg = instOfNatNat 1.1

Logical form (Lean):

```lean
theorem LogicalConnectives.negIsUnary :
    LogicalConnectives.IsUnary .neg
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LogicalConnectives.negIsUnary :
    LogicalConnectives.IsUnary .neg := rfl

/--
`LogicalConnectives.implIsBinary` TODO

Predicate logic:

  LogicalConnectives.IsBinary .impl

Predicate logic (unfolded):

  LRA.Logic.Language.Notation.LogicalConnectives.2 LRA.Logic.Language.Notation.LogicalConnective.impl = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem LogicalConnectives.implIsBinary :
    LogicalConnectives.IsBinary .impl
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LogicalConnectives.implIsBinary :
    LogicalConnectives.IsBinary .impl := rfl

/--
`LogicalEquality` TODO

Predicate logic:

  inductive LogicalEquality where
  | eq

Predicate logic (unfolded):

  inductive LogicalEquality where
  | eq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive LogicalEquality where
  | eq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive LogicalEquality where
  | eq

/--
`LogicalEqualitySymbols` TODO

Predicate logic:

  def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2

Predicate logic (unfolded):

  def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2
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
def LogicalEqualitySymbols : ArityIndexedSymbols where
  Symbol := LogicalEquality
  arity
    | .eq => 2

/--
`LogicalEqualitySymbols.eqIsBinary` TODO

Predicate logic:

  LogicalEqualitySymbols.IsBinary .eq

Predicate logic (unfolded):

  LRA.Logic.Language.Notation.LogicalEqualitySymbols.2 LRA.Logic.Language.Notation.LogicalEquality.eq = instOfNatNat 2.1

Logical form (Lean):

```lean
theorem LogicalEqualitySymbols.eqIsBinary :
    LogicalEqualitySymbols.IsBinary .eq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem LogicalEqualitySymbols.eqIsBinary :
    LogicalEqualitySymbols.IsBinary .eq := rfl

/--
`LogicalQuantifier` TODO

Predicate logic:

  inductive LogicalQuantifier where
  | forallQ

Predicate logic (unfolded):

  inductive LogicalQuantifier where
  | forallQ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive LogicalQuantifier where
  | forallQ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
inductive LogicalQuantifier where
  | forallQ

end LRA.Logic.Language.Notation
