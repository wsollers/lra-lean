import LRA.Order.Lattices.MeetSemilattice.Definition

namespace LRA.Order

universe u

/-- Every pair in a meet-semilattice has a meet. -/
theorem MeetSemilatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsMeetSemilattice : MeetSemilattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet := by
  sorry

end LRA.Order
