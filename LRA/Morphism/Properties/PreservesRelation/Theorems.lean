import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesRelation.apply` TODO

Predicate logic:

  targetRelation (function left) (function right)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (left right : Source), sourceRelation left right → targetRelation (function left) (function right)) → ∀ {left right : Source}, sourceRelation left right → targetRelation (function left) (function right)

Logical form (Lean):

```lean
theorem PreservesRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesRelation function sourceRelation targetRelation)
    {left right : Source}
    (related : sourceRelation left right) :
    targetRelation (function left) (function right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem PreservesRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : PreservesRelation function sourceRelation targetRelation)
    {left right : Source}
    (related : sourceRelation left right) :
    targetRelation (function left) (function right) := by
  sorry
end LRA.Morphism
