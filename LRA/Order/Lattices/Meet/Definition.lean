import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
`Meet` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha) (left right meet : alpha), (relation meet left ∧ (relation meet right ∧ ∀ (lower : alpha), relation lower left → relation lower right → relation lower meet))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop) (left right meet : alpha), (relation meet left ∧ (relation meet right ∧ ∀ (lower : alpha), relation lower left → relation lower right → relation lower meet))

Logical form (Lean):

```lean
def Meet {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet
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
def Meet {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet

end LRA.Order
