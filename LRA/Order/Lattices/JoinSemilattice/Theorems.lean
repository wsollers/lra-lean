import LRA.Order.Lattices.JoinSemilattice.Definition

namespace LRA.Order

universe u

/--
`JoinSemilatticeHasJoin` TODO

Predicate logic:

  (∀ left right ∈ Alpha), exists join, Join relation left right join

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper))) → ∀ (left right : Alpha), Exists fun join => (relation left join ∧ (relation right join ∧ ∀ (upper : Alpha), relation left upper → relation right upper → relation join upper))

Logical form (Lean):

```lean
theorem JoinSemilatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsJoinSemilattice : JoinSemilattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem JoinSemilatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsJoinSemilattice : JoinSemilattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join := by
  sorry

end LRA.Order
