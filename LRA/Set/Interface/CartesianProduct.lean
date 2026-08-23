                                          
                                                                    
                                                                 
                                                                 
                                                               

import LRA.Set.Interface.Pairing
import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

   
                                               
                                               
                                        

                                                                        
                                                                       
                                                                         
                                                            
                                                                   
                                                                      
                          

                                                                     
                                                                  
                                                                    
                                                                  
                                       
  

section CartesianProduct

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}

                                         

                                                                     
                                                                 

             

       
                                                   
                                                                 
                                       
                                               
                                                       
                                       
                                            
                                                      
   
  
def CartesianProductOf [HasPairing Left Right Pair]
    [Membership Left DomainObject] [Membership Right RangeObject]
    [HasSeparation Pair RelationObject]
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) : RelationObject :=
  HasSeparation.separation ambientPairs
    (fun member => ∃ (a : Left) (b : Right),
      member = OrderedPair a b ∧ a ∈ left ∧ b ∈ right)

end CartesianProduct

end LRA.Set
