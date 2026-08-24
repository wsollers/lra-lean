import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/--
`LowerCover` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (element cover : alpha), (strictRelation cover element ∧ ∀ (middle : alpha), ¬ (strictRelation cover middle ∧ strictRelation middle element))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (element cover : alpha), (strictRelation cover element ∧ ∀ (middle : alpha), (strictRelation cover middle ∧ strictRelation middle element) → False)

Logical form (Lean):

```lean
def LowerCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation cover element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def LowerCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation cover element

end LRA.Order
