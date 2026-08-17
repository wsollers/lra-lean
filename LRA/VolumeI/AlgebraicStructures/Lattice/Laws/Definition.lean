import LRA.VolumeI.AlgebraicStructures.JoinSemilattice.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.MeetSemilattice.Laws.Definition
import LRA.VolumeI.Operations.Laws.Absorption.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Algebraic lattice laws for explicit join and meet operations. -/
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet

end LRA.AlgebraicStructures
