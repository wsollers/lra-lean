                                                
                                                                         

import LRA.VolumeII.NumberSystems.Models
import LRA.AlgebraicStructures.OrderedRing.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model
import LRA.VolumeII.Arithmetic.Model.All
import LRA.VolumeII.PeanoSystems.Presburger.ModelTheory.All
import LRA.VolumeII.Integers.Implementation

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Models
open LRA.AlgebraicStructures.OrderedRing.Interface.Signature
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.NumberSystems.Arithmetic.Model
open LRA.NumberSystems.PeanoSystems.Presburger.ModelTheory

   
                                     
                                                          
                                                                      
                      

                                                                  
                                                               
                                                                                        
                                
  

                                                                  
         

             

       
                         
                                                                
                              
   
  
def integerNumbersModel :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  orderedRingFirstOrderModel Z

                                                                   
                                                              

             

       
                                 
                                                                    
                                  
   
  
def additiveOrderedIntegerModel :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  additiveOrderedFirstOrderModel Z

                                                                  
               

             

       
                                
                                                                   
                                 
   
  
def arithmeticRingIntegerModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel Z

                                                                
                                                              

             

       
                                                                                               
                                                  
   
  
def integerNumberSystemModel : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel :=
  DiscretelyOrderedIntegralDomainModel.ofCarrier Z

                                                                 
                          

             

       
                                                     
                                    
   
  
def integerNumbersSignature : OrderedRingSignature :=
  integerNumberSystemModel.signature

end LRA.NumberSystems.Integers
