import LRA.Operation
import LRA.Operation
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

                                                                      
def MeetSemilatticeLaws {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative meet /\
    LRA.Operation.Laws.Commutative.Commutative meet /\
    LRA.Operation.Laws.Idempotent.Idempotent meet

end LRA.AlgebraicStructures
