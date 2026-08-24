import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

/--
`UpperCover` TODO

Predicate logic:

  ∀ {alpha : Type u} (strictRelation : LRA.Relation.Endorelation alpha) (element cover : alpha), (strictRelation element cover ∧ ∀ (middle : alpha), ¬ (strictRelation element middle ∧ strictRelation middle cover))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (strictRelation : alpha → alpha → Prop) (element cover : alpha), (strictRelation element cover ∧ ∀ (middle : alpha), (strictRelation element middle ∧ strictRelation middle cover) → False)

Logical form (Lean):

```lean
def UpperCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation element cover
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
def UpperCover
    {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha)
    (element cover : alpha) : Prop :=
  CoverRelation strictRelation element cover

end LRA.Order
