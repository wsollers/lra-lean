namespace LRA.Identity.Syntax

universe u

/--
`SyntacticallyIdentical` TODO

Predicate logic:

  ∀ {Syntax : Type u} (left right : Syntax), left = right

Predicate logic (unfolded):

  ∀ {Syntax : Type u} (left right : Syntax), left = right

Logical form (Lean):

```lean
abbrev SyntacticallyIdentical {Syntax : Type u} (left right : Syntax) : Prop :=
  left = right
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
abbrev SyntacticallyIdentical {Syntax : Type u} (left right : Syntax) : Prop :=
  left = right

end LRA.Identity.Syntax
