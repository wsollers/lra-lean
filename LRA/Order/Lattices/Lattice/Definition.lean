import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/--
`Lattice` TODO

Predicate logic:

  ∀ {alpha : Type u} (relation : LRA.Relation.Endorelation alpha), (LRA.Order.PartialOrder relation ∧ ∀ (left right : alpha), (Exists fun join => LRA.Order.Join relation left right join ∧ Exists fun meet => LRA.Order.Meet relation left right meet))

Predicate logic (unfolded):

  ∀ {alpha : Type u} (relation : alpha → alpha → Prop), ((∀ (x : alpha), relation x x ∧ (∀ (x y : alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : alpha), (Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : alpha), relation left upper → relation right upper → relation join upper)) ∧ Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : alpha), relation lower left → relation lower right → relation lower meet))))

Logical form (Lean):

```lean
def Lattice {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def Lattice {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)

end LRA.Order
