import LRA.AlgebraicStructures.JoinSemilattice.Laws.Definition
import LRA.AlgebraicStructures.MeetSemilattice.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

                                                                    
def LatticeLaws {Carrier : Type u}
    (join meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  JoinSemilatticeLaws join /\
    MeetSemilatticeLaws meet /\
    LRA.Operation.Laws.Absorption.MutualAbsorptionLaw join meet

end LRA.AlgebraicStructures
