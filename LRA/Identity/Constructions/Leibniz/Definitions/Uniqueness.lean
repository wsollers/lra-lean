namespace LRA.Identity

universe u

/--
`Unique` TODO

Predicate logic:

  ∀ {Carrier : Type u} (predicate : Carrier → Prop) (left right : Carrier), (predicate left ∧ predicate right) → left = right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (predicate : Carrier → Prop) (left right : Carrier), (predicate left ∧ predicate right) → left = right

Logical form (Lean):

```lean
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right
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
def Unique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  ∀ left right, predicate left -> predicate right -> left = right

end LRA.Identity
