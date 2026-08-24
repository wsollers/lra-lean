import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

/--
`FailsReflectsRelation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target), LRA.Morphism.ReflectsRelation function sourceRelation targetRelation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop), (∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right) → False

Logical form (Lean):

```lean
def FailsReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ ReflectsRelation function sourceRelation targetRelation
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
def FailsReflectsRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ ReflectsRelation function sourceRelation targetRelation

end LRA.Morphism
