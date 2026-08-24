                                                                    
                                             

import LRA.NumberSystems.Integers.Constructions.Mendelson.Behavior
import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.Integers.Mendelson

                                                                     
          

             

       
                                                
                                              
                                         
                                        
                                                                        
                      
   
  
theorem PositiveClassesRecoverNaturalNumberModel
    (positiveData : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element := by
  sorry

                                                                  
                          

             

       
                                                            
                                              
                                                                            
                                          
   
  
theorem MendelsonIntegersFormDiscretelyOrderedIntegralDomain
    (positiveData : PositiveNaturalPairData) :
    ∃ model : LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier positiveData := by
  sorry

                                                                         

             

       
                                            
                                              
                                                                     
                                                        
   
  
theorem MendelsonRealizesIntegerNumberSystem
    (positiveData : PositiveNaturalPairData) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier positiveData := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
