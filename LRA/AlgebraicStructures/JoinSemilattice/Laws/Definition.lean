import LRA.Operation
import LRA.Operation
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

                                                                      
def JoinSemilatticeLaws {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  LRA.Operation.Laws.Associative.Associative join /\
    LRA.Operation.Laws.Commutative.Commutative join /\
    LRA.Operation.Laws.Idempotent.Idempotent join

end LRA.AlgebraicStructures
