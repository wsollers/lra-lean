import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                      

                                                       

                                                            


             

       
                          
                                          
                                  
                                                                
   
  
theorem SuccessorInjective
    (ps : PeanoSystem Element SetObject) :
    forall first second : Element,
      ps.successor first = ps.successor second -> first = second := by
  sorry

   
                                      

                                                                       
        

                                                           


             

       
                         
                                          
                             
                                   
   
  
theorem OneIsNotSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ ps.one := by
  sorry

   
                                              

                                                                        
        

                                                                      


             

       
                                    
                                        
                                            
                                                           
                                                            
   
  
theorem SuccessorPreservesInequality
    (ps : PeanoSystem Element SetObject)
    (first_element second_element : Element)
    (elements_not_equal : first_element ≠ second_element) :
    ps.successor first_element ≠ ps.successor second_element := by
  sorry

   
                                               

                                                                   

                                                                       


             

       
                                     
                                        
                              
                                                              
   
  
theorem SuccessorInequalityReflection
    (ps : PeanoSystem Element SetObject)
    (first second : Element) :
    ps.successor first ≠ ps.successor second -> first ≠ second := by
  sorry

   
                                                          

                                                                          
                                        

                                                                       


             

       
                                     
                                          
                             
                         
                                     
                                            
   
  
theorem EveryElementIsOneOrASuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      element = ps.one \/
        exists predecessor : Element,
          ps.successor predecessor = element := by
  sorry

   
                                     

                                                           

                                                                   


             

       
                                 
                                          
                             
                                    
   
  
theorem NoObjectIsItsOwnSuccessor
    (ps : PeanoSystem Element SetObject) :
    forall element : Element,
      ps.successor element ≠ element := by
  sorry

   
                                               

                                                                                
                             

                                                                 


             

       
                               
                                        
                         
                                  
                                             
                    
   
  
theorem OneIsUniqueNonSuccessor
    (ps : PeanoSystem Element SetObject)
    (element : Element) :
    (forall predecessor : Element,
      ps.successor predecessor ≠ element) <->
    element = ps.one := by
  sorry

   
                                                                                                          

             

       
                                                             
   
  
abbrev OneIsTheUniqueNonSuccessor := @OneIsUniqueNonSuccessor

end LRA.NumberSystems.PeanoSystem
