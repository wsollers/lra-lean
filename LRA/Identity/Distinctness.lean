namespace LRA.Identity

universe u

/--
`Distinct` TODO

Predicate logic:

  ∀ {Carrier : Type u} (left right : Carrier), left = right → False

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (left right : Carrier), left = right → False

Logical form (Lean):

```lean
def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right
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
def Distinct {Carrier : Type u} (left right : Carrier) : Prop :=
  ¬ left = right

end LRA.Identity
