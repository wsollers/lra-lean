namespace LRA.Set

universe u

/--
`SetClass` TODO

Predicate logic:

  abbrev SetClass (α : Type u) := α → Prop

Predicate logic (unfolded):

  abbrev SetClass (α : Type u) := α → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev SetClass (α : Type u) := α → Prop
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
abbrev SetClass (α : Type u) := α → Prop

/--
`BelongsToClass` TODO

Predicate logic:

  ∀ {α : Type u} (element : α) (setClass : LRA.Set.SetClass α), setClass element

Predicate logic (unfolded):

  ∀ {α : Type u} (element : α) (setClass : α → Prop), setClass element

Logical form (Lean):

```lean
def BelongsToClass {α : Type u} (element : α) (setClass : SetClass α) : Prop :=
  setClass element
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
def BelongsToClass {α : Type u} (element : α) (setClass : SetClass α) : Prop :=
  setClass element

end LRA.Set
