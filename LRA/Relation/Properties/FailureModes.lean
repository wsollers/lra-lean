import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

/--
`ProperlyPartial` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain), (LRA.Relation.RightUnique relation ∧ ¬ LRA.Relation.LeftTotal relation)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop), (∀ (x : Domain) (y₁ y₂ : Codomain), relation x y₁ → relation x y₂ → y₁ = y₂ ∧ (∀ (x : Domain), Exists fun y => relation x y) → False)

Logical form (Lean):

```lean
def ProperlyPartial {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation ∧ ¬ LeftTotal relation
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
def ProperlyPartial {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation ∧ ¬ LeftTotal relation

/--
`ProperlyMultivalued` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain), (LRA.Relation.LeftTotal relation ∧ ¬ LRA.Relation.RightUnique relation)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop), (∀ (x : Domain), Exists fun y => relation x y ∧ (∀ (x : Domain) (y₁ y₂ : Codomain), relation x y₁ → relation x y₂ → y₁ = y₂) → False)

Logical form (Lean):

```lean
def ProperlyMultivalued {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LeftTotal relation ∧ ¬ RightUnique relation
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
def ProperlyMultivalued {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LeftTotal relation ∧ ¬ RightUnique relation

end LRA.Relation
