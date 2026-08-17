import LRA.VolumeI.AlgebraicStructures.BoundedLattice.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.DistributiveLattice.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Algebraic Boolean-algebra laws for explicit operations. -/
def BooleanAlgebraLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (complement : LRA.Operation.UnaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  BoundedLatticeLaws join meet bottom top /\
    DistributiveLatticeLaws join meet /\
    (forall element, join element (complement element) = top) /\
    (forall element, meet element (complement element) = bottom)

end LRA.AlgebraicStructures
