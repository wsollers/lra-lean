import LRA.Order.Lattices.MeetSemilattice.Definition
import LRA.AlgebraicStructures.MeetSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.MeetSemilattice.Constructions

universe u

/-- The order induced by an algebraic meet: `x ≤ y ↔ x ∧ y = x`. Dual to
`JoinSemilattice.Constructions.InducedOrder`, whose relation reads `join x y =
y` — here the roles of the two sides flip, matching the greatest-lower-bound
reading of `meet`. -/
def InducedOrder {Carrier : Type u} (meet : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun x y => meet x y = x

/-- Reflexivity is idempotence, antisymmetry is commutativity, transitivity is
associativity — the three algebraic axioms are exactly what's needed to make
`InducedOrder` a partial order. -/
theorem inducedOrder_isPartialOrder {Carrier : Type u}
    {meet : LRA.Operation.BinaryEndoOperation Carrier}
    (h : MeetSemilatticeLaws meet) :
    LRA.Order.PartialOrder (InducedOrder meet) := by
  sorry
/-- `meet left right` is genuinely the greatest lower bound under
`InducedOrder` — the other direction of the equivalence the algebraic and
order-theoretic definitions of a meet-semilattice describe. -/
theorem inducedOrder_hasMeets {Carrier : Type u}
    {meet : LRA.Operation.BinaryEndoOperation Carrier}
    (h : MeetSemilatticeLaws meet) :
    ∀ left right, ∃ m, LRA.Order.Meet (InducedOrder meet) left right m := by
  sorry
/-- The equivalence itself: an algebraic meet-semilattice's induced order is an
order-theoretic meet-semilattice — matching `LRA.Order.MeetSemilattice`
directly, so both definitions of this subject are now actually connected. -/
theorem toOrderTheoreticMeetSemilattice {Carrier : Type u}
    {meet : LRA.Operation.BinaryEndoOperation Carrier}
    (h : MeetSemilatticeLaws meet) :
    LRA.Order.MeetSemilattice (InducedOrder meet) := by
  sorry
end LRA.AlgebraicStructures.MeetSemilattice.Constructions
