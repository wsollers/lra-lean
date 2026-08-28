import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Order

universe u v

/--
`Antitone` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : LRA.Relation.Endorelation Alpha) (targetRelation : LRA.Relation.Endorelation Beta) (map : Alpha → Beta) (left right : Alpha), sourceRelation left right → LRA.Relation.Converse targetRelation (map left) (map right)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : Alpha → Alpha → Prop) (targetRelation : Beta → Beta → Prop) (map : Alpha → Beta) (left right : Alpha), sourceRelation left right → targetRelation (map right) (map left)

Logical form (Lean):

```lean
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation
    (LRA.Relation.Converse targetRelation)
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
def Antitone
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (map : Alpha → Beta) : Prop :=
  LRA.Morphism.PreservesRelation map sourceRelation
    (LRA.Relation.Converse targetRelation)

end LRA.Order
