import LRA.Relation.Interface.Definitions

namespace LRA.Morphism

universe u v

/--
`PreservesRelation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : LRA.Relation.Endorelation Source) (targetRelation : LRA.Relation.Endorelation Target) (left right : Source), sourceRelation left right → targetRelation (function left) (function right)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceRelation : Source → Source → Prop) (targetRelation : Target → Target → Prop) (left right : Source), sourceRelation left right → targetRelation (function left) (function right)

Logical form (Lean):

```lean
def PreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ∀ left right,
    sourceRelation left right → targetRelation (function left) (function right)
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
def PreservesRelation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target) : Prop :=
  ∀ left right,
    sourceRelation left right → targetRelation (function left) (function right)

end LRA.Morphism
