import LRA.AlgebraicStructures.Lattice.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

/-- Algebraic bounded-lattice laws for explicit join, meet, bottom, and top. -/
def BoundedLatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier)
    (bottom top : Carrier) : Prop :=
  LatticeLaws join meet /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity join bottom /\
    LRA.Operation.Laws.Identity.TwoSidedIdentity meet top

end LRA.AlgebraicStructures
