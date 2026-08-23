import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Models

universe u

                                                                          

             

       
                  
                                                        
                       
          
                                       
   
  
def NaturalNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Nat → model.Carrier
  | 0 => 0
  | n + 1 => NaturalNumeral model n + 1

                                                             
                      

                                                               
                                                                     
                 

             

       
                  
                                                        
                       
                                         
                                                    
   
  
def IntegerNumeral
    (model : DiscretelyOrderedIntegralDomainModel.{u}) :
    Int → model.Carrier
  | Int.ofNat n => NaturalNumeral model n
  | Int.negSucc n => -(NaturalNumeral model (n + 1))

                                                                          
                                                                     

                                                                       
                                                                              
                                                                     

             

       
                                                  
                                                  
                                
                            
                                                           
   
  
structure IntegerNumberSystem : Type (u + 1) where
  Model : DiscretelyOrderedIntegralDomainModel.{u}
  EveryElementIsIntegerNumeral :
    ∀ value : Model.Carrier,
      ∃ integer : Int, IntegerNumeral Model integer = value

                                                                    
           

             

       
                                  
                                               
                                          
                      
                                                          
   
  
theorem IntegerNumeralIsSurjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ value : integerSystem.Model.Carrier,
      ∃ integer : Int,
        IntegerNumeral integerSystem.Model integer = value := by
  exact integerSystem.EveryElementIsIntegerNumeral

                                                                          
       

                                                               
                                                                         

             

       
                                 
                                               
                         
                                                
                                                     
                      
   
  
theorem IntegerNumeralIsInjective
    (integerSystem : IntegerNumberSystem.{u}) :
    ∀ first second : Int,
      IntegerNumeral integerSystem.Model first =
          IntegerNumeral integerSystem.Model second →
        first = second := by
  sorry

end LRA.NumberSystems.Integers
