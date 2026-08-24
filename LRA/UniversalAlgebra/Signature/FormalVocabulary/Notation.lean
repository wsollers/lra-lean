import LRA.Logic.Language.Notation

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

/--
`NotationRole` TODO

Predicate logic:

  inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript

Predicate logic (unfolded):

  inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript
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
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript

/--
`NotationAssignment` TODO

Predicate logic:

  structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole

Predicate logic (unfolded):

  structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole
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
structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole

end LRA.UniversalAlgebra.Signature.FormalVocabulary
