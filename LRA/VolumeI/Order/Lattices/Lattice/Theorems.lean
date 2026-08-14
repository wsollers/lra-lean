import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.VolumeI.Order

universe u

/-- Every pair in a lattice has a join. -/
theorem LatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join := by
  sorry

/-- Every pair in a lattice has a meet. -/
theorem LatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet := by
  sorry

/-- Connecting lemma: `right` is the join of `left` and `right` exactly when `left ≤ right`. -/
theorem JoinEqualsRightIffRelated
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Join relation left right right ↔ relation left right := by
  sorry

/-- Dual connecting lemma for meets. -/
theorem MeetEqualsLeftIffRelated
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Meet relation left right left ↔ relation left right := by
  sorry

/-- Order-theoretic absorption: meeting an element with its join returns it. -/
theorem MeetWithJoinAbsorbs
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right join meet : Alpha}
    (joinIsJoin : Join relation left right join)
    (meetIsMeet : Meet relation left join meet) :
    meet = left := by
  sorry

/-- Dual order-theoretic absorption. -/
theorem JoinWithMeetAbsorbs
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right meet join : Alpha}
    (meetIsMeet : Meet relation left right meet)
    (joinIsJoin : Join relation left meet join) :
    join = left := by
  sorry

/-!
This package is the order-theoretic lattice interface. The equational
`join`/`meet` operation-signature presentation belongs in algebraic structures;
a future bridge should prove equivalence with this predicate presentation.
-/

end LRA.VolumeI.Order
