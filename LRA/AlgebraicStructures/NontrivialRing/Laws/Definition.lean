import LRA.AlgebraicStructures.Ring.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

                                        

                                          
class NontrivialityLaw (R : Type u) [OfNat R 0] [OfNat R 1] : Prop where
  OneNeZero : (1 : R) ≠ 0

                            
class abbrev NontrivialRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  RingLaws R, NontrivialityLaw R

section Wrappers

variable {R : Type u}

                                 
theorem OneNeZero [OfNat R 0] [OfNat R 1] [NontrivialityLaw R] :
    (1 : R) ≠ 0 :=
  NontrivialityLaw.OneNeZero

end Wrappers

end LRA.AlgebraicStructures
