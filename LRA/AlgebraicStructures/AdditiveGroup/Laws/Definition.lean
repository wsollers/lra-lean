import LRA.AlgebraicStructures.AdditiveMonoid.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                                
  

                                                  
class AdditiveInverseLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop where
  NegAddCancel :
    LRA.Operation.Laws.Inverse.LeftInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)
  AddNegCancel :
    LRA.Operation.Laws.Inverse.RightInverse
      (fun a b : R => a + b) 0 (fun a : R => -a)

                                               
class SubtractionCompatibilityLaw (R : Type u)
    [Sub R] [Add R] [Neg R] : Prop where
  SubEqAddNeg : ∀ a b : R, a - b = a + -b

                           
class abbrev AdditiveGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R

section Wrappers

variable {R : Type u}

                                               
theorem NegAddCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, -a + a = 0 :=
  AdditiveInverseLaws.NegAddCancel

                                                
theorem AddNegCancel [Add R] [Neg R] [OfNat R 0]
    [AdditiveInverseLaws R] :
    ∀ a : R, a + -a = 0 :=
  AdditiveInverseLaws.AddNegCancel

                                               
theorem SubEqAddNeg [Sub R] [Add R] [Neg R]
    [SubtractionCompatibilityLaw R] :
    ∀ a b : R, a - b = a + -b :=
  SubtractionCompatibilityLaw.SubEqAddNeg

end Wrappers

end LRA.AlgebraicStructures
