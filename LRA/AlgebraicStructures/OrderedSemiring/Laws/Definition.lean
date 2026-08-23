import LRA.AlgebraicStructures.Semiring.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
namespace LRA.AlgebraicStructures

open LRA.Order

universe u

   
                                  

                                                                         
                                                                            
                                   
  

                             
class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  SemiringLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
