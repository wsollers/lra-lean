import LRA.Logic.Language.Symbols

namespace LRA.UniversalAlgebra.Signature.FormalVocabulary

/--
`Arity` TODO

Predicate logic:

  abbrev Arity := Nat

Predicate logic (unfolded):

  abbrev Arity := Nat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Arity := Nat
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
abbrev Arity := Nat

/--
`Nullary` TODO

Predicate logic:

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = 0

Predicate logic (unfolded):

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = instOfNatNat 0.1

Logical form (Lean):

```lean
def Nullary (arity : Arity) : Prop := arity = 0
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
def Nullary (arity : Arity) : Prop := arity = 0

/--
`Unary` TODO

Predicate logic:

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = 1

Predicate logic (unfolded):

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = instOfNatNat 1.1

Logical form (Lean):

```lean
def Unary (arity : Arity) : Prop := arity = 1
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
def Unary (arity : Arity) : Prop := arity = 1

/--
`Binary` TODO

Predicate logic:

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = 2

Predicate logic (unfolded):

  ∀ (arity : LRA.UniversalAlgebra.Signature.FormalVocabulary.Arity), arity = instOfNatNat 2.1

Logical form (Lean):

```lean
def Binary (arity : Arity) : Prop := arity = 2
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
def Binary (arity : Arity) : Prop := arity = 2

end LRA.UniversalAlgebra.Signature.FormalVocabulary
