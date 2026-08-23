import LRA.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

   
                                    
  

                               
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R

end LRA.AlgebraicStructures
