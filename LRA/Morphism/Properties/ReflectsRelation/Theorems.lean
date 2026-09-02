import LRA.Morphism.Properties.ReflectsRelation.Definition

namespace LRA.Morphism

universe u v

/--
`ReflectsRelation.apply` TODO

Predicate logic:

  sourceRelation left right

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceRelation : Source → Source → Prop} {targetRelation : Target → Target → Prop}, (∀ (left right : Source), targetRelation (function left) (function right) → sourceRelation left right) → ∀ {left right : Source}, targetRelation (function left) (function right) → sourceRelation left right

Logical form (Lean):

```lean
theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation function sourceRelation targetRelation)
    {left right : Source}
    (relatedValues : targetRelation (function left) (function right)) :
    sourceRelation left right
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
theorem ReflectsRelation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceRelation : LRA.Relation.Endorelation Source}
    {targetRelation : LRA.Relation.Endorelation Target}
    (law : ReflectsRelation function sourceRelation targetRelation)
    {left right : Source}
    (relatedValues : targetRelation (function left) (function right)) :
    sourceRelation left right := by
  sorry
end LRA.Morphism
