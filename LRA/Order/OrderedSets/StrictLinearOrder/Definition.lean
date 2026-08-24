import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/--
`StrictLinearOrder` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), (LRA.Order.StrictOrder relation ∧ LRA.Relation.ExactlyTrichotomous relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z) ∧ ∀ (x y : Alpha), Or ((relation x y ∧ (x = y → False ∧ relation y x → False))) (Or ((x = y ∧ (relation x y → False ∧ relation y x → False))) ((relation y x ∧ (relation x y → False ∧ x = y → False)))))

Logical form (Lean):

```lean
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation ∧
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

Related proof moves: constructor, cases, rcases, unfold

-/
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation ∧
    LRA.Relation.ExactlyTrichotomous relation

end LRA.Order
