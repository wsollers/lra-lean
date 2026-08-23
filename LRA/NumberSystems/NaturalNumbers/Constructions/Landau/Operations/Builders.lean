                                                                                 
                                                                         

import LRA.AlgebraicStructures
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Addition
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations.Multiplication

namespace LRA.NumberSystems.NaturalNumbers.Constructions.Landau

open LRA.AlgebraicStructures
open LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                  
                                                                   
                                                

                                                                            
                                                                            
                                                                         
                            

   
                         
                                           
                                                              
   

                                                                             
                                                                            
                                                                            
                                                        
  

                          

                                                            
def LandauOneOn (model : PeanoSystem Element SetObject) : OfNat Element 1 :=
  ⟨model.one⟩

                                                           
def LandauSuccOn (model : PeanoSystem Element SetObject) :
    HasSuccessor Element :=
  ⟨model.successor⟩

                                                                   
noncomputable def LandauAddOn (model : PeanoSystem Element SetObject) :
    Add Element :=
  ⟨LandauAddition model⟩

                                                                         
noncomputable def LandauMulOn (model : PeanoSystem Element SetObject) :
    Mul Element :=
  ⟨LandauMultiplication model⟩

                                                                     

                                                                                      
noncomputable def LandauAdditiveSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveSemigroupLaws Element (LandauAddOn model) :=
  @AdditiveSemigroupLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsAssociative model)

                                                                                          
noncomputable def LandauAdditiveCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @AdditiveCommutativeLaws Element (LandauAddOn model) :=
  @AdditiveCommutativeLaws.mk Element (LandauAddOn model)
    (LandauAdditionIsCommutative model)

                                                                                                  
noncomputable def LandauMultiplicativeSemigroupLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeSemigroupLaws Element (LandauMulOn model) :=
  @MultiplicativeSemigroupLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsAssociative model)

                                                                                                      
noncomputable def LandauMultiplicativeCommutativeLawsOn
    (model : PeanoSystem Element SetObject) :
    @MultiplicativeCommutativeLaws Element (LandauMulOn model) :=
  @MultiplicativeCommutativeLaws.mk Element (LandauMulOn model)
    (LandauMultiplicationIsCommutative model)

                                                                           
noncomputable def LandauDistributiveLawsOn
    (model : PeanoSystem Element SetObject) :
    @DistributiveLaws Element (LandauAddOn model) (LandauMulOn model) :=
  @DistributiveLaws.mk Element (LandauAddOn model) (LandauMulOn model)
    (LandauLeftDistributivityOfMultiplicationOverAddition model)
    (LandauMultiplicationDistributesOverAddition model)

                                      

example (model : PeanoSystem Element SetObject) (a b c : Element) : True := by
  letI := LandauAddOn model
  letI := LandauAdditiveSemigroupLawsOn model
  letI := LandauAdditiveCommutativeLawsOn model
  have associated : (a + b) + c = a + (b + c) := AddAssociative a b c
  have commuted : a + b = b + a := AddCommutative a b
  trivial

end LRA.NumberSystems.NaturalNumbers.Constructions.Landau
