import LRA.UniversalAlgebra.Algebra.Definition

namespace LRA.Relation.UniversalAlgebra

open LRA.Logic

/--
`RelationOperationSymbol` TODO

Predicate logic:

  inductive RelationOperationSymbol : Type
    | converse
    | compose
    | union
    | inter
    | complement
    deriving DecidableEq

Predicate logic (unfolded):

  inductive RelationOperationSymbol : Type
    | converse
    | compose
    | union
    | inter
    | complement
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive RelationOperationSymbol : Type
  | converse
  | compose
  | union
  | inter
  | complement
  deriving DecidableEq
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
inductive RelationOperationSymbol : Type
  | converse
  | compose
  | union
  | inter
  | complement
  deriving DecidableEq

/--
`RelationRelationSymbol` TODO

Predicate logic:

  abbrev RelationRelationSymbol := Empty

Predicate logic (unfolded):

  abbrev RelationRelationSymbol := Empty (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RelationRelationSymbol := Empty
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
abbrev RelationRelationSymbol := Empty

/--
`RelationConstantSymbol` TODO

Predicate logic:

  inductive RelationConstantSymbol : Type
    | empty
    | universal
    | identity
    deriving DecidableEq

Predicate logic (unfolded):

  inductive RelationConstantSymbol : Type
    | empty
    | universal
    | identity
    deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive RelationConstantSymbol : Type
  | empty
  | universal
  | identity
  deriving DecidableEq
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
inductive RelationConstantSymbol : Type
  | empty
  | universal
  | identity
  deriving DecidableEq

/--
`relationOperationArity` TODO

Predicate logic:

  def relationOperationArity : RelationOperationSymbol → Nat
    | .converse => 1
    | .compose => 2
    | .union => 2
    | .inter => 2
    | .complement => 1

Predicate logic (unfolded):

  def relationOperationArity : RelationOperationSymbol → Nat
    | .converse => 1
    | .compose => 2
    | .union => 2
    | .inter => 2
    | .complement => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def relationOperationArity : RelationOperationSymbol → Nat
  | .converse => 1
  | .compose => 2
  | .union => 2
  | .inter => 2
  | .complement => 1
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
def relationOperationArity : RelationOperationSymbol → Nat
  | .converse => 1
  | .compose => 2
  | .union => 2
  | .inter => 2
  | .complement => 1

/--
`RelationOperationSymbols` TODO

Predicate logic:

  def RelationOperationSymbols : ArityIndexedSymbols where
    Symbol := RelationOperationSymbol
    arity := relationOperationArity

Predicate logic (unfolded):

  def RelationOperationSymbols : ArityIndexedSymbols where
    Symbol := RelationOperationSymbol
    arity := relationOperationArity (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationOperationSymbols : ArityIndexedSymbols where
  Symbol := RelationOperationSymbol
  arity := relationOperationArity
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
def RelationOperationSymbols : ArityIndexedSymbols where
  Symbol := RelationOperationSymbol
  arity := relationOperationArity

/--
`RelationSignature` TODO

Predicate logic:

  def RelationSignature : Signature :=
    LRA.UniversalAlgebra.algebraicSignature
      RelationOperationSymbols
      RelationConstantSymbol

Predicate logic (unfolded):

  def RelationSignature : Signature :=
    LRA.UniversalAlgebra.algebraicSignature
      RelationOperationSymbols
      RelationConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationSignature : Signature :=
  LRA.UniversalAlgebra.algebraicSignature
    RelationOperationSymbols
    RelationConstantSymbol
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
def RelationSignature : Signature :=
  LRA.UniversalAlgebra.algebraicSignature
    RelationOperationSymbols
    RelationConstantSymbol

end LRA.Relation.UniversalAlgebra
