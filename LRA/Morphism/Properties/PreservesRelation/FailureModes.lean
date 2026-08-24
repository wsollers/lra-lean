import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Morphism

universe u v

/--
`FailsPreservesRelation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target), LRA.Morphism.PreservesRelation function sourceRelation targetRelation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop), (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right)) → False

Logical form (Lean):

```lean
def FailsPreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ PreservesRelation function sourceRelation targetRelation
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
def FailsPreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ¬ PreservesRelation function sourceRelation targetRelation

end LRA.Morphism
