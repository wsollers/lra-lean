import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/--
`CoverRelationImpliesStrictRelation` TODO

Predicate logic:

  strictRelation lower upper

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {strictRelation : Alpha → Alpha → Prop} {lower upper : Alpha}, (strictRelation lower upper ∧ ∀ (middle : Alpha), (strictRelation lower middle ∧ strictRelation middle upper) → False) → strictRelation lower upper

Logical form (Lean):

```lean
theorem CoverRelationImpliesStrictRelation
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    {lower upper : Alpha}
    (lowerIsCoveredByUpper : CoverRelation strictRelation lower upper) :
    strictRelation lower upper
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem CoverRelationImpliesStrictRelation
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    {lower upper : Alpha}
    (lowerIsCoveredByUpper : CoverRelation strictRelation lower upper) :
    strictRelation lower upper := by
  sorry
end LRA.Order
