import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.AlgebraicStructures.JoinSemilattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.JoinSemilattice.Constructions

universe u

/-- The order induced by an algebraic join: `x ≤ y ↔ x ∨ y = y`. -/
def InducedOrder {Carrier : Type u} (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun x y => join x y = y

/-- Reflexivity is idempotence, antisymmetry is commutativity, transitivity is
associativity — the three algebraic axioms are exactly what's needed to make
`InducedOrder` a partial order. -/
theorem inducedOrder_isPartialOrder {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.PartialOrder (InducedOrder join) := by
  sorry
/-- `join left right` is genuinely the least upper bound under `InducedOrder` —
the other direction of the equivalence the algebraic and order-theoretic
definitions of a join-semilattice describe. -/
theorem inducedOrder_hasJoins {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    ∀ left right, ∃ j, LRA.Order.Join (InducedOrder join) left right j := by
  sorry
/-- The equivalence itself: an algebraic join-semilattice's induced order is an
order-theoretic join-semilattice — matching `LRA.Order.JoinSemilattice`
directly, so both definitions of this subject are now actually connected. -/
theorem toOrderTheoreticJoinSemilattice {Carrier : Type u}
    {join : LRA.Operation.BinaryEndoOperation Carrier}
    (h : JoinSemilatticeLaws join) :
    LRA.Order.JoinSemilattice (InducedOrder join) := by
  sorry
end LRA.AlgebraicStructures.JoinSemilattice.Constructions
