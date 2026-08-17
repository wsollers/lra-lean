import LRA.VolumeI.Operations.Laws.Associative.Definition
import LRA.VolumeI.Operations.Laws.Commutative.Definition
import LRA.VolumeI.Operations.Laws.Idempotent.Definition

namespace LRA.AlgebraicStructures

universe u

/-- Algebraic meet-semilattice laws for an explicit meet operation. -/
def MeetSemilatticeLaws {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative meet /\
    LRA.Operation.Laws.Commutative.Commutative meet /\
    LRA.Operation.Laws.Idempotent.Idempotent meet

end LRA.AlgebraicStructures
