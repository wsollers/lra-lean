import LRA.Order.Lattices.MeetSemilattice.Definition

namespace LRA.Order

universe u

/--
`MeetSemilatticeHasMeet` TODO

Predicate logic:

  (∀ left right ∈ Alpha), exists meet, Meet relation left right meet

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) ∧ ∀ (left right : Alpha), Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))) → ∀ (left right : Alpha), Exists fun meet => (relation meet left ∧ (relation meet right ∧ ∀ (lower : Alpha), relation lower left → relation lower right → relation lower meet))

Logical form (Lean):

```lean
theorem MeetSemilatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsMeetSemilattice : MeetSemilattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet
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
theorem MeetSemilatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsMeetSemilattice : MeetSemilattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet := by
  sorry
end LRA.Order
