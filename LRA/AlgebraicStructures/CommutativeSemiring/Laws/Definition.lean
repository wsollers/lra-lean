import LRA.AlgebraicStructures.CommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

   
                                      
  

                                 
class abbrev CommutativeSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

end LRA.AlgebraicStructures
