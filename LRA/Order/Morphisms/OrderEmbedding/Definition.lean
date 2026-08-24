import LRA.Morphism.Properties.RelationEmbedding.Definition
import LRA.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v

/--
`OrderEmbedding` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : LRA.Relation.Endorelation Alpha) (targetRelation : LRA.Relation.Endorelation Beta) (map : Alpha → Beta), (LRA.Morphism.PreservesRelation map sourceRelation targetRelation ∧ LRA.Morphism.ReflectsRelation map sourceRelation targetRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : Alpha → Alpha → Prop) (targetRelation : Beta → Beta → Prop) (map : Alpha → Beta), (∀ (left right : Alpha), sourceRelation left right → targetRelation (map left) (map right) ∧ ∀ (left right : Alpha), targetRelation (map left) (map right) → sourceRelation left right)

Logical form (Lean):

```lean
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesAndReflectsRelation map sourceRelation targetRelation
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
def OrderEmbedding
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesAndReflectsRelation map sourceRelation targetRelation

end LRA.Order
