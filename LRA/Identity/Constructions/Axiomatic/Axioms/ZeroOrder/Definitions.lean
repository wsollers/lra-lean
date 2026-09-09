namespace LRA.Identity.Constructions.Axiomatic.ZeroOrder

/--
`SyntacticIdentity` TODO

Predicate logic:

  ∀ {Formula : Type} (a a_1 : Formula), a = a_1

Predicate logic (unfolded):

  ∀ {Formula : Type} (a a_1 : Formula), a = a_1

Logical form (Lean):

```lean
abbrev SyntacticIdentity {Formula : Type} : Formula -> Formula -> Prop := Eq
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
abbrev SyntacticIdentity {Formula : Type} : Formula -> Formula -> Prop := Eq

end LRA.Identity.Constructions.Axiomatic.ZeroOrder
