import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/--
`Adjacent` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (left right : alpha), Or (LRA.Order.CoverRelation strictRelation left right) (LRA.Order.CoverRelation strictRelation right left)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (left right : alpha), Or ((strictRelation left right ∧ ∀ (middle : alpha), (strictRelation left middle ∧ strictRelation middle right) → False)) ((strictRelation right left ∧ ∀ (middle : alpha), (strictRelation right middle ∧ strictRelation middle left) → False))

Logical form (Lean):

```lean
def Adjacent
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  CoverRelation strictRelation left right \/ CoverRelation strictRelation right left
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def Adjacent
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  CoverRelation strictRelation left right \/ CoverRelation strictRelation right left

end LRA.Order
