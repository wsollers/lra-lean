import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`Join` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha) (left right join : alpha), (relation left join ∧ (relation right join ∧ ∀ (upper : alpha), relation left upper → relation right upper → relation join upper))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop) (left right join : alpha), (relation left join ∧ (relation right join ∧ ∀ (upper : alpha), relation left upper → relation right upper → relation join upper))

Logical form (Lean):

```lean
def Join {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper
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
def Join {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper

end LRA.Order
