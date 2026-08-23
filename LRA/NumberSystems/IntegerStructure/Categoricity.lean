                                                       
                                                      

import LRA.NumberSystems.IntegerStructure.Definition

namespace LRA.NumberSystems.IntegerStructure

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                                                 

                                                                               
                                                                           
                                                                         
                                                                       
                                                           
                                                                          
                           

                                                                                      

             

       
                                                    
                                                       
                                              
                                                
                                                               
                                                               
                                            
                                              
                                                 
                                           
                                            
                                  
                                             
                                                  
                                  
                                               
                                                    
                                        
                                               
                                                  
                                        
                                                 
                                                    
                                                                           
                                                                              
   
  
theorem UniquenessOfIntegerStructuresUpToIsomorphism
    {SecondElement : Type u} {SecondSetObject : Type v}
    [Membership SecondElement SecondSetObject]
    (first : IntegerStructure Element SetObject)
    (firstFullInduction : FullTwoSidedPredicateInduction first)
    (second : IntegerStructure SecondElement SecondSetObject) :
    FullTwoSidedPredicateInduction second ->
    exists forward : Element -> SecondElement,
      exists backward : SecondElement -> Element,
        forward first.zero = second.zero /\
        backward second.zero = first.zero /\
        (forall element : Element,
          forward (first.successor element) =
            second.successor (forward element)) /\
        (forall element : Element,
          forward (first.predecessor element) =
            second.predecessor (forward element)) /\
        (forall element : SecondElement,
          backward (second.successor element) =
            first.successor (backward element)) /\
        (forall element : SecondElement,
          backward (second.predecessor element) =
            first.predecessor (backward element)) /\
        (forall element : Element, backward (forward element) = element) /\
        (forall element : SecondElement, forward (backward element) = element) := by

   
                                                                                 

                                                                               
                                                                           
                                                                         
                                                                       
                                                           
                                                                          
                           

                                                                                      

             

       
                                                    
                                                       
                                              
                                                
                                                               
                                                               
                                            
                                              
                                                 
                                           
                                            
                                  
                                             
                                                  
                                  
                                               
                                                    
                                        
                                               
                                                  
                                        
                                                 
                                                    
                                                                           
                                                                              
   
  
  sorry

end LRA.NumberSystems.IntegerStructure
