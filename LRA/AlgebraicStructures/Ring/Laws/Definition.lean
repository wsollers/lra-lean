import LRA.AlgebraicStructures.AbelianGroup.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

   
                      
  

                 
class abbrev RingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R

end LRA.AlgebraicStructures
