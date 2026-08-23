import LRA.NumberSystems.PeanoSystem.Recursion.Iterator

namespace LRA.NumberSystems.PeanoSystem.Recursion

open LRA.NumberSystems.PeanoSystem

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                                                                                    

             

       
                                  
                                        
                                   
                                                        
                                                              
                                                              
                                        
                           
        
            
                                               
                                           
                                
   
  
def BinaryIteratorOperationClauses
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (operation : parameterType -> Element -> target) : Prop :=
  forall parameterValue : parameterType,
    IteratorFunctionClauses
      ps
      target
      (initialValueForParameter parameterValue)
      (stepRuleForParameter parameterValue)
      (operation parameterValue)

   
                                                        

                                                                     
          

                                                                            


             

       
                                          
                                        
                                   
                                                        
                                                                
                                                          
                                    
          
                     
              
                                
                            
                 
   
  
theorem ExistenceOfBinaryIteratorOperation
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation := by
  sorry

   
                                                          

                                                                       
                                 

                                                                              


             

       
                                            
                                        
                                   
                                                        
                                                              
                                     
                                           
                                  
        
                   
            
                              
                          
                       
                                  
        
                   
            
                              
                          
                        
                                    
   
  
theorem UniquenessOfBinaryIteratorOperations
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target)
    (firstOperation secondOperation :
      parameterType -> Element -> target) :
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      firstOperation ->
    BinaryIteratorOperationClauses
      ps
      parameterType
      target
      initialValueForParameter
      stepRuleForParameter
      secondOperation ->
    firstOperation = secondOperation := by
  sorry

   
                                                          

                                                                               

                                                                            


             

       
                                          
                                        
                                   
                                                        
                                                                
                                                          
                                    
          
                     
              
                                
                            
                    
                                                                 
                                      
            
                       
                
                                  
                              
                           
                                  
   
  
theorem BinaryIteratorOperationWellDefined
    (ps : PeanoSystem Element SetObject)
    (parameterType target : Type w)
    (initialValueForParameter : parameterType -> target)
    (stepRuleForParameter : parameterType -> target -> target) :
    exists operation : parameterType -> Element -> target,
      BinaryIteratorOperationClauses
        ps
        parameterType
        target
        initialValueForParameter
        stepRuleForParameter
        operation /\
      forall otherOperation : parameterType -> Element -> target,
        BinaryIteratorOperationClauses
          ps
          parameterType
          target
          initialValueForParameter
          stepRuleForParameter
          otherOperation ->
        otherOperation = operation := by
  sorry

end LRA.NumberSystems.PeanoSystem.Recursion
