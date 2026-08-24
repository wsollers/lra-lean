import LRA.Relation.Definition

namespace LRA.Relation
universe u

/--
`RelationUnion` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α) (a a_1 : α), Or (R a a_1) (S a a_1)

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop) (a a_1 : α), Or (R a a_1) (S a a_1)

Logical form (Lean):

```lean
def RelationUnion {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∨ S x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def RelationUnion {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∨ S x y

/--
`RelationIntersection` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α) (a a_1 : α), (R a a_1 ∧ S a a_1)

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop) (a a_1 : α), (R a a_1 ∧ S a a_1)

Logical form (Lean):

```lean
def RelationIntersection {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ S x y
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
def RelationIntersection {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ S x y

/--
`RelationComplement` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α) (a a_1 : α), R a a_1 → False

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop) (a a_1 : α), R a a_1 → False

Logical form (Lean):

```lean
def RelationComplement {α : Type u} (R : Endorelation α) : Endorelation α := fun x y => ¬ R x y
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
def RelationComplement {α : Type u} (R : Endorelation α) : Endorelation α := fun x y => ¬ R x y

/--
`RelationDifference` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α) (a a_1 : α), (R a a_1 ∧ ¬ S a a_1)

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop) (a a_1 : α), (R a a_1 ∧ S a a_1 → False)

Logical form (Lean):

```lean
def RelationDifference {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ ¬ S x y
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
def RelationDifference {α : Type u} (R S : Endorelation α) : Endorelation α := fun x y => R x y ∧ ¬ S x y

/--
`RelationSymmetricDifference` TODO

Predicate logic:

  ∀ {α : Type u} (R S : LRA.Relation.Endorelation α) (a a_1 : α), Or ((R a a_1 ∧ ¬ S a a_1)) ((S a a_1 ∧ ¬ R a a_1))

Predicate logic (unfolded):

  ∀ {α : Type u} (R S : α → α → Prop) (a a_1 : α), Or ((R a a_1 ∧ S a a_1 → False)) ((S a a_1 ∧ R a a_1 → False))

Logical form (Lean):

```lean
def RelationSymmetricDifference {α : Type u} (R S : Endorelation α) : Endorelation α :=
  fun x y => (R x y ∧ ¬ S x y) ∨ (S x y ∧ ¬ R x y)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def RelationSymmetricDifference {α : Type u} (R S : Endorelation α) : Endorelation α :=
  fun x y => (R x y ∧ ¬ S x y) ∨ (S x y ∧ ¬ R x y)

end LRA.Relation
