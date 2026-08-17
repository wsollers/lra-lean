import LRA.VolumeI.AlgebraicStructures.Lattice.Laws.Definition
import LRA.VolumeI.Order.Lattices.Lattice.Definition

namespace LRA.Order.Interoperability.Lattices

universe u

/-!
Bridge home between order-theoretic lattices and algebraic lattices.

`Order/Lattices` owns lattices as ordered sets with joins and meets.
`AlgebraicStructures/Lattice` owns lattices as algebras with primitive join
and meet operations satisfying equational laws. This module records the
interoperability surface without duplicating either theory.
-/

/-- The order induced by an algebraic join operation. -/
def OrderFromJoin {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => join left right = right

/-- The order induced by an algebraic meet operation. -/
def OrderFromMeet {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => meet left right = left

/--
An algebraic lattice induces an order-theoretic lattice through the join
order.
-/
theorem AlgebraicLatticeJoinOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromJoin join) := by
  sorry

/--
An algebraic lattice induces an order-theoretic lattice through the meet
order.
-/
theorem AlgebraicLatticeMeetOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromMeet meet) := by
  sorry

/--
Chosen join and meet operations for an order-theoretic lattice form an
algebraic lattice.
-/
theorem OrderLatticeOperationsAreAlgebraic
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (orderLattice : LRA.Order.Lattice relation)
    (joinSpec :
      forall left right : Carrier, LRA.Order.Join relation left right (join left right))
    (meetSpec :
      forall left right : Carrier, LRA.Order.Meet relation left right (meet left right)) :
    LRA.AlgebraicStructures.LatticeLaws join meet := by
  sorry

end LRA.Order.Interoperability.Lattices
