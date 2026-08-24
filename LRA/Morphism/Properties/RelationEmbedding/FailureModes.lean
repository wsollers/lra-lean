import LRA.Morphism.Properties.RelationEmbedding.Definition

namespace LRA.Morphism

universe u v

/--
`FailsRelationEmbedding` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target), LRA.Morphism.RelationEmbedding function sourceRelation targetRelation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop), (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right) ∧ ∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right)) → False

Logical form (Lean):

```lean
def FailsRelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ RelationEmbedding function sourceRelation targetRelation
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
def FailsRelationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ RelationEmbedding function sourceRelation targetRelation

end LRA.Morphism
