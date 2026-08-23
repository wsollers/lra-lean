import LRA.SetSystems

   
                                                 

                                                                    
                                                                      
                                                                     
                                 
  

namespace LRA.SetSystems

open LRA.Set

universe u v

                                         

                                                                


             

       
                                                               
   
  
abbrev AlgebraOfSetsDefinition := @LRA.SetSystems.AlgebraOfSets

                                     

                                                             


             

       
                                                         
   
  
abbrev RingOfSetsDefinition := @LRA.SetSystems.RingOfSets

                                   

                                                            


             

       
                                                             
   
  
abbrev SigmaRingDefinition := @LRA.SetSystems.SigmaRingOfSets

                                      

                                                               


             

       
                                                                   
   
  
abbrev SigmaAlgebraDefinition := @LRA.SetSystems.SigmaAlgebraOfSets

                                                                   
                                           

                                                                        


             

       
                                      
                                        
                               
                                                
                                                                          
                  
                                                
   
  
structure AlgebraOfSetsSpaceDefinition
    (Element : Type u) (SetObj : Type v)
    [Membership Element SetObj]
    [Union SetObj] [Inter SetObj] [SDiff SetObj]
    [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj] where
  ambient : SetObj
  algebra : LRA.SetSystems.AlgebraOfSets ambient

namespace AlgebraOfSetsSpaceDefinition

variable {Element : Type u} {SetObj : Type v}
variable [Membership Element SetObj]
variable [Union SetObj] [Inter SetObj] [SDiff SetObj]
variable [EmptyCollection SetObj] [HasSubset SetObj] [HasSymmDiff SetObj]

                                                                       

             

       
                
                                                                      
        
   
  
abbrev SetObject
    (_space : AlgebraOfSetsSpaceDefinition Element SetObj) : Type v :=
  SetObj

end AlgebraOfSetsSpaceDefinition

end LRA.SetSystems
