import LRA.AlgebraicStructures.NontrivialRing.Laws.Definition
import LRA.Operation

namespace LRA.AlgebraicStructures

universe u

   
                               

                                                                             
                                          
  

                                                                         
class MultiplicativeInverseLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop where
  MulInvCancel : ∀ a : R, a ≠ 0 →
    LRA.Operation.Laws.Inverse.RightInverseOf
      (fun x y : R => x * y) 1 a a⁻¹
  InvZero : (0 : R)⁻¹ = 0

                                                 
class DivisionCompatibilityLaw (R : Type u)
    [Div R] [Mul R] [Inv R] : Prop where
  DivEqMulInv : ∀ a b : R, a / b = a * b⁻¹

                                                                  
class abbrev DivisionRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] : Prop :=
  RingLaws R, NontrivialityLaw R, MultiplicativeInverseLaws R

section Wrappers

variable {R : Type u}

                                                      
theorem MulInvCancel [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 :=
  MultiplicativeInverseLaws.MulInvCancel

                                                  
theorem InvZero [Mul R] [Inv R] [OfNat R 0] [OfNat R 1]
    [MultiplicativeInverseLaws R] :
    (0 : R)⁻¹ = 0 :=
  MultiplicativeInverseLaws.InvZero

                                                 
theorem DivEqMulInv [Div R] [Mul R] [Inv R]
    [DivisionCompatibilityLaw R] :
    ∀ a b : R, a / b = a * b⁻¹ :=
  DivisionCompatibilityLaw.DivEqMulInv

end Wrappers

end LRA.AlgebraicStructures
