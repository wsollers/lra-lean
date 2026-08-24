import LRA.Morphism.Properties.PreservesRelation.Definition

namespace LRA.Order

universe u v

/--
`Monotone` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : LRA.Relation.Endorelation Alpha) (targetRelation : LRA.Relation.Endorelation Beta) (map : Alpha → Beta) (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : Alpha → Alpha → Prop) (targetRelation : Beta → Beta → Prop) (map : Alpha → Beta) (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right)

Logical form (Lean):

```lean
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation targetRelation
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
def Monotone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation targetRelation

end LRA.Order
