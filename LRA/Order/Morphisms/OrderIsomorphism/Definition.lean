import LRA.Order.Morphisms.OrderEmbedding.Definition

namespace LRA.Order

universe u v

/--
`OrderIsomorphism` TODO

Predicate logic:

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : LRA.Relation.Endorelation Alpha) (targetRelation : LRA.Relation.Endorelation Beta) (forward : Alpha → Beta) (inverse : Beta → Alpha), (∀ (source : Alpha), inverse (forward source) = source ∧ (∀ (target : Beta), forward (inverse target) = target ∧ LRA.Order.OrderEmbedding sourceRelation targetRelation forward))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {Beta : Type v} (sourceRelation : Alpha → Alpha → Prop) (targetRelation : Beta → Beta → Prop) (forward : Alpha → Beta) (inverse : Beta → Alpha), (∀ (source : Alpha), inverse (forward source) = source ∧ (∀ (target : Beta), forward (inverse target) = target ∧ (∀ (left right : Alpha), sourceRelation left right → targetRelation (forward left) (forward right) ∧ ∀ (left right : Alpha), targetRelation (forward left) (forward right) → sourceRelation left right)))

Logical form (Lean):

```lean
def OrderIsomorphism
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (forward : Alpha -> Beta) (inverse : Beta -> Alpha) : Prop :=
  (forall source, inverse (forward source) = source) /\
    (forall target, forward (inverse target) = target) /\
      OrderEmbedding sourceRelation targetRelation forward
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def OrderIsomorphism
    {Alpha : Type u} {Beta : Type v}
    (sourceRelation : LRA.Relation.Endorelation Alpha)
    (targetRelation : LRA.Relation.Endorelation Beta)
    (forward : Alpha -> Beta) (inverse : Beta -> Alpha) : Prop :=
  (forall source, inverse (forward source) = source) /\
    (forall target, forward (inverse target) = target) /\
      OrderEmbedding sourceRelation targetRelation forward

end LRA.Order
