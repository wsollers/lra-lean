                                                                             
                                                                           

import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Carrier
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Laws
import LRA.NumberSystems.WholeNumbers.Constructions.Landau.Behavior

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

   
                                                
                                                                   
                                                

                                                                     
                                                                          
                                                                     
                                                                    
                                                                              
                                                                            
                                                                                
  

                          

                                                         
def zeroOn : OfNat (Carrier natural_data) 0 := ⟨zero natural_data⟩

                                                       
def oneOn : OfNat (Carrier natural_data) 1 := ⟨one natural_data⟩

                                                         
def succOn : HasSuccessor (Carrier natural_data) :=
  ⟨successor natural_data⟩

                                                       
noncomputable def addOn : Add (Carrier natural_data) :=
  ⟨addition natural_data⟩

                                                       
noncomputable def mulOn : Mul (Carrier natural_data) :=
  ⟨multiplication natural_data⟩

                                                     
def ltOn : LT (Carrier natural_data) := ⟨strictOrder natural_data⟩

                                                     
def leOn : LE (Carrier natural_data) := ⟨nonstrictOrder natural_data⟩

                              

                                                                                             
noncomputable def additiveSemigroupLawsOn :
    @AdditiveSemigroupLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveSemigroupLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).1

                                                                                                 
noncomputable def additiveCommutativeLawsOn :
    @AdditiveCommutativeLaws (Carrier natural_data) (addOn natural_data) :=
  @AdditiveCommutativeLaws.mk (Carrier natural_data) (addOn natural_data)
    (additive_structure natural_data).2.1

                                                                                           
noncomputable def additiveIdentityLawsOn :
    @AdditiveIdentityLaws (Carrier natural_data)
      (addOn natural_data) (zeroOn natural_data) :=
  @AdditiveIdentityLaws.mk (Carrier natural_data)
    (addOn natural_data) (zeroOn natural_data)
    (fun value => ((additive_structure natural_data).2.2.1 value).1)
    (fun value => ((additive_structure natural_data).2.2.1 value).2)

                                                                                                         
noncomputable def multiplicativeSemigroupLawsOn :
    @MultiplicativeSemigroupLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeSemigroupLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.1

                                                                                                             
noncomputable def multiplicativeCommutativeLawsOn :
    @MultiplicativeCommutativeLaws (Carrier natural_data) (mulOn natural_data) :=
  @MultiplicativeCommutativeLaws.mk (Carrier natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.1

                                                                                                       
noncomputable def multiplicativeIdentityLawsOn :
    @MultiplicativeIdentityLaws (Carrier natural_data)
      (mulOn natural_data) (oneOn natural_data) :=
  @MultiplicativeIdentityLaws.mk (Carrier natural_data)
    (mulOn natural_data) (oneOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.1 value).2)

                                                                                     
noncomputable def zeroAbsorbingLawsOn :
    @ZeroAbsorbingLaws (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @ZeroAbsorbingLaws.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).1)
    (fun value => ((semiring_structure natural_data).2.2.2.2.1 value).2)

                                                                                  
noncomputable def nontrivialityLawOn :
    @NontrivialityLaw (Carrier natural_data)
      (zeroOn natural_data) (oneOn natural_data) :=
  @NontrivialityLaw.mk (Carrier natural_data)
    (zeroOn natural_data) (oneOn natural_data)
    (semiring_structure natural_data).1.symm

                                                                                      
noncomputable def noZeroDivisorsLawOn :
    @NoZeroDivisorsLaw (Carrier natural_data)
      (mulOn natural_data) (zeroOn natural_data) :=
  @NoZeroDivisorsLaw.mk (Carrier natural_data)
    (mulOn natural_data) (zeroOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.2

                                                              
                                                
noncomputable def distributiveLawsOn :
    @DistributiveLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data) :=
  @DistributiveLaws.mk (Carrier natural_data)
    (addOn natural_data) (mulOn natural_data)
    (semiring_structure natural_data).2.2.2.2.2.1
    (by sorry)

                                                                    
                                                                
noncomputable def commutativeSemiringLawsOn :
    @CommutativeSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) := by
  letI := additiveSemigroupLawsOn natural_data
  letI := additiveIdentityLawsOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  letI := multiplicativeSemigroupLawsOn natural_data
  letI := multiplicativeIdentityLawsOn natural_data
  letI := multiplicativeCommutativeLawsOn natural_data
  letI := zeroAbsorbingLawsOn natural_data
  letI := distributiveLawsOn natural_data
  infer_instance

                                                                          
                     
noncomputable def partialOrderLawsOn :
    @PartialOrderLaws (Carrier natural_data) (leOn natural_data) :=
  @PartialOrderLaws.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_refl natural_data)
    (nonstrict_order_antisymm natural_data)
    (nonstrict_order_trans natural_data)

                                                                          
noncomputable def totalOrderLawOn :
    @TotalOrderLaw (Carrier natural_data) (leOn natural_data) :=
  @TotalOrderLaw.mk (Carrier natural_data) (leOn natural_data)
    (nonstrict_order_total natural_data)

                                                                          
                           
noncomputable def additionRespectsOrderLawsOn :
    @AdditionRespectsOrderLaws (Carrier natural_data)
      (addOn natural_data) (leOn natural_data) :=
  @AdditionRespectsOrderLaws.mk (Carrier natural_data)
    (addOn natural_data) (leOn natural_data)
    (by sorry)
    (by sorry)

                                                                         
                                                           
noncomputable def multiplicationRespectsOrderLawsOn :
    @MultiplicationRespectsOrderLaws (Carrier natural_data)
      (mulOn natural_data) (leOn natural_data) (zeroOn natural_data) :=
  @MultiplicationRespectsOrderLaws.mk (Carrier natural_data)
    (mulOn natural_data) (leOn natural_data) (zeroOn natural_data)
    (by sorry)

                                                                          
                                                                        
noncomputable def orderedSemiringLawsOn :
    @OrderedSemiringLaws (Carrier natural_data)
      (addOn natural_data) (mulOn natural_data)
      (zeroOn natural_data) (oneOn natural_data) (leOn natural_data) := by
  letI := commutativeSemiringLawsOn natural_data
  letI := partialOrderLawsOn natural_data
  letI := totalOrderLawOn natural_data
  letI := additionRespectsOrderLawsOn natural_data
  letI := multiplicationRespectsOrderLawsOn natural_data
  infer_instance

                                                                           
                                                
noncomputable def quotientOrderedPairsInput :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs := by
  letI := zeroOn natural_data
  letI := oneOn natural_data
  letI := addOn natural_data
  letI := mulOn natural_data
  letI := leOn natural_data
  letI := commutativeSemiringLawsOn natural_data
  letI := partialOrderLawsOn natural_data
  exact
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs.ofCarrier
      (Carrier natural_data)
      (by sorry)
      (by sorry)

                                      

example (a b : Carrier natural_data) : True := by
  letI := addOn natural_data
  letI := additiveCommutativeLawsOn natural_data
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
