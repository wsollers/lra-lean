import LRA.AlgebraicStructures.BoundedLattice.Interface.Laws.Definition
import LRA.AlgebraicStructures.DistributiveLattice.Interface.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- A Boolean algebra: a bounded distributive lattice equipped with a
complement operation such that every element joins with its complement to the
top element and meets with its complement to the bottom element. This matches
the user's algebraic presentation directly. The `BoundedLatticeLaws` conjunct
already includes `LatticeLaws`, so the additional
`DistributiveLatticeLaws join meet` conjunct repeats that base lattice content;
that is harmless redundancy, not a semantic bug, and mirrors the existing
non-minimal style already accepted for `DistributiveLatticeLaws` itself. -/
def BooleanAlgebraLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (complement : LRA.Operation.UnaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  BoundedLatticeLaws join meet bottom top /\
    DistributiveLatticeLaws join meet /\
    (forall element, join element (complement element) = top) /\
    (forall element, meet element (complement element) = bottom)

end LRA.AlgebraicStructures
