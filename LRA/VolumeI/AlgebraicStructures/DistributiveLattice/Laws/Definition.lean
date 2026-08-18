import LRA.VolumeI.AlgebraicStructures.Lattice.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- Algebraic distributive-lattice laws for explicit join and meet operations. -/
def DistributiveLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive join meet /\
    LRA.Operation.Laws.Distributive.TwoSidedDistributive meet join

end LRA.AlgebraicStructures
