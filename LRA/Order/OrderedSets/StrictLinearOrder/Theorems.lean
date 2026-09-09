import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/--
`ExactlyTrichotomousImpliesIrreflexive` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.ExactlyTrichotomous relation → LRA.Relation.Irreflexive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsExactlyTrichotomous : LRA.Relation.ExactlyTrichotomous relation
  Prove
    (∀ (x y : Alpha), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False)))))) → ∀ (x : Alpha), relation x x → False

Logical form (Lean):

```lean
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.Relation.ExactlyTrichotomous relation) :
    LRA.Relation.Irreflexive relation
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
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.Relation.ExactlyTrichotomous relation) :
    LRA.Relation.Irreflexive relation := by
  sorry
/--
`StrictLinearOrderIsStrictOrder` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.StrictLinearOrder relation → LRA.Order.StrictOrder relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsStrictLinearOrder : StrictLinearOrder relation
  Prove
    (((∀ (x : Alpha), relation x x → False) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ (∀ (x y : Alpha), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False))))))) → ((∀ (x : Alpha), relation x x → False) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
theorem StrictLinearOrderIsStrictOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    StrictOrder relation
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
theorem StrictLinearOrderIsStrictOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    StrictOrder relation := by
  sorry
/--
`StrictLinearOrderIsExactlyTrichotomous` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Order.StrictLinearOrder relation → LRA.Relation.ExactlyTrichotomous relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : LRA.Relation.Endorelation Alpha
    relationIsStrictLinearOrder : StrictLinearOrder relation
  Prove
    (((∀ (x : Alpha), relation x x → False) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ (∀ (x y : Alpha), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False))))))) → ∀ (x y : Alpha), Or ((relation x y ∧ ((x = y → False) ∧ (relation y x → False)))) (Or ((x = y ∧ ((relation x y → False) ∧ (relation y x → False)))) ((relation y x ∧ ((relation x y → False) ∧ (x = y → False)))))

Logical form (Lean):

```lean
theorem StrictLinearOrderIsExactlyTrichotomous
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    LRA.Relation.ExactlyTrichotomous relation
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
theorem StrictLinearOrderIsExactlyTrichotomous
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    LRA.Relation.ExactlyTrichotomous relation := by
  sorry
end LRA.Order
