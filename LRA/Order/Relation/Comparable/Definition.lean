import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u

/--
`Comparable` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha) (left right : alpha), Or (relation left right) (relation right left)

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop) (left right : alpha), Or (relation left right) (relation right left)

Logical form (Lean):

```lean
def Comparable {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left
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
def Comparable {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right : alpha) : Prop :=
  relation left right \/ relation right left

end LRA.Order
