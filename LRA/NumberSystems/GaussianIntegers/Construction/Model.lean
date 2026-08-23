                                                             
                                                                  
                                        

import LRA.VolumeII.Arithmetic.Model.All
import LRA.VolumeII.Integers.Construction
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

namespace LRA.NumberSystems.GaussianIntegers.Construction

open LRA.NumberSystems.Arithmetic.Model
open LRA.AlgebraicStructures
open LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

universe u

   
                                              
                                                                  
                                                                   

                                                                         
                                                                     
                                                                      
                                                                          
                                                                  
                                                                      
                                                                    
                                                                    
                                                                      
                                                                      
                                                                    
  

                                                           

             

       
                                                                            
   
  
abbrev ActiveGaussianInteger := GaussianInteger LRA.NumberSystems.Integers.Z

                                                                     
                                

             

       
                                            
                                                     
                                                                   
                                                   
   
  
def gaussianArithmeticRingModel (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel (GaussianInteger R)

                                                        

             

       
                                 
                                                                   
                                                          
   
  
def GaussianArithmeticRingModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  gaussianArithmeticRingModel LRA.NumberSystems.Integers.Z

                                                                       

example : CommutativeRingLaws ActiveGaussianInteger := inferInstance

example (a b : ActiveGaussianInteger) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Construction
