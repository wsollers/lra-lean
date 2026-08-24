namespace LRA.Relation

universe u v

/--
`UnaryRelation` TODO

Predicate logic:

  abbrev UnaryRelation (α : Type u) := α → Prop

Predicate logic (unfolded):

  abbrev UnaryRelation (α : Type u) := α → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev UnaryRelation (α : Type u) := α → Prop
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
abbrev UnaryRelation (α : Type u) := α → Prop

/--
`HeterogeneousBinaryRelation` TODO

Predicate logic:

  abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop

Predicate logic (unfolded):

  abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop
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
abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop

/--
`HomogeneousBinaryRelation` TODO

Predicate logic:

  abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α

Predicate logic (unfolded):

  abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α
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
abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α

/--
`BinaryRelation` TODO

Predicate logic:

  abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α

Predicate logic (unfolded):

  abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α
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
abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α

/--
`Endorelation` TODO

Predicate logic:

  abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α

Predicate logic (unfolded):

  abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α
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
abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α

/--
`RelationIncluded` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α) (x y : α), R x y → S x y

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop) (x y : α), R x y → S x y

Logical form (Lean):

```lean
def RelationIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  ∀ x y, R x y → S x y
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
def RelationIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  ∀ x y, R x y → S x y

/--
`RelationProperlyIncluded` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α), (LRA.Relation.RelationIncluded R S ∧ Ne R S)

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop), (∀ (x y : α), R x y → S x y ∧ R = S → False)

Logical form (Lean):

```lean
def RelationProperlyIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  RelationIncluded R S ∧ R ≠ S
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def RelationProperlyIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  RelationIncluded R S ∧ R ≠ S

end LRA.Relation
