import LRA.Order.Lattices.Join.Definition

namespace LRA.Order

universe u

/--
`JoinSemilattice` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), (LRA.Order.PartialOrder relation ∧ ∀ (left right : Alpha), Exists fun join => LRA.Order.Join relation left right join)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper)))

Logical form (Lean):

```lean
def JoinSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists join, Join relation left right join
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
def JoinSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists join, Join relation left right join

end LRA.Order
