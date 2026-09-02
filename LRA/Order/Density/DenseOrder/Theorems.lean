import LRA.Order.Density.DenseOrder.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.Relation.CoverRelation.Definition
import LRA.Order.Relation.StrictPart.Definition

namespace LRA.Order

universe u

/--
`DenseOrderOfStrictPartIffDense` TODO

Predicate logic:

  DenseOrder (StrictPart relation) ↔ LRA.Relation.Dense (StrictPart relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ((∀ (x : Alpha), (relation x x ∧ ¬ x = x) → False ∧ ∀ (x y z : Alpha), (relation x y ∧ x = y → False) → (relation y z ∧ y = z → False) → (relation x z ∧ x = z → False)) ∧ ∀ (x y : Alpha), (relation x y ∧ x = y → False) → Exists fun z => ((relation x z ∧ x = z → False) ∧ (relation z y ∧ z = y → False))) ↔ ∀ (x y : Alpha), (relation x y ∧ x = y → False) → Exists fun z => ((relation x z ∧ x = z → False) ∧ (relation z y ∧ z = y → False))

Logical form (Lean):

```lean
theorem DenseOrderOfStrictPartIffDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation) :
    DenseOrder (StrictPart relation) ↔
      LRA.Relation.Dense (StrictPart relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem DenseOrderOfStrictPartIffDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation) :
    DenseOrder (StrictPart relation) ↔
      LRA.Relation.Dense (StrictPart relation) := by
  sorry
/--
`DenseOrderHasNoCovers` TODO

Predicate logic:

  forall lower upper, Not (CoverRelation strictRelation lower upper)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {strictRelation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), strictRelation x x → False ∧ ∀ (x y z : Alpha), strictRelation x y → strictRelation y z → strictRelation x z) ∧ ∀ (x y : Alpha), strictRelation x y → Exists fun z => (strictRelation x z ∧ strictRelation z y)) → ∀ (lower upper : Alpha), (strictRelation lower upper ∧ ∀ (middle : Alpha), (strictRelation lower middle ∧ strictRelation middle upper) → False) → False

Logical form (Lean):

```lean
theorem DenseOrderHasNoCovers
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsDenseOrder : DenseOrder strictRelation) :
    forall lower upper, Not (CoverRelation strictRelation lower upper)
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
theorem DenseOrderHasNoCovers
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsDenseOrder : DenseOrder strictRelation) :
    forall lower upper, Not (CoverRelation strictRelation lower upper) := by
  sorry
end LRA.Order
