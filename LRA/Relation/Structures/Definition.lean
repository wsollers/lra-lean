import LRA.Relation.Properties

namespace LRA.Relation
universe u

/--
`EquivalenceRelation` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α), (LRA.Relation.Reflexive R ∧ (LRA.Relation.Symmetric R ∧ LRA.Relation.Transitive R))

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop), (∀ (x : α), R x x ∧ (∀ (x y : α), R x y → R y x ∧ ∀ (x y z : α), R x y → R y z → R x z))

Logical form (Lean):

```lean
def EquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R ∧ Transitive R
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
def EquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R ∧ Transitive R

/--
`PartialEquivalenceRelation` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α), (LRA.Relation.Symmetric R ∧ LRA.Relation.Transitive R)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop), (∀ (x y : α), R x y → R y x ∧ ∀ (x y z : α), R x y → R y z → R x z)

Logical form (Lean):

```lean
def PartialEquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Symmetric R ∧ Transitive R
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
def PartialEquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Symmetric R ∧ Transitive R

/--
`ToleranceRelation` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α), (LRA.Relation.Reflexive R ∧ LRA.Relation.Symmetric R)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop), (∀ (x : α), R x x ∧ ∀ (x y : α), R x y → R y x)

Logical form (Lean):

```lean
def ToleranceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R
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
def ToleranceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R

/--
`CompatibilityRelation` TODO

Predicate logic:

  ∀ {α : Type u} (R : LRA.Relation.Endorelation α), (LRA.Relation.Reflexive R ∧ LRA.Relation.Symmetric R)

Predicate logic (unfolded):

  ∀ {α : Type u} (R : α → α → Prop), (∀ (x : α), R x x ∧ ∀ (x y : α), R x y → R y x)

Logical form (Lean):

```lean
abbrev CompatibilityRelation {α : Type u} (R : Endorelation α) : Prop := ToleranceRelation R
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
abbrev CompatibilityRelation {α : Type u} (R : Endorelation α) : Prop := ToleranceRelation R

end LRA.Relation
