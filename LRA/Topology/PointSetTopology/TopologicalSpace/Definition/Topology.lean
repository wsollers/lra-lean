import Mathlib.Topology.Basic

   
                                                                          
               
  

namespace LRA.Topology

universe u

                                                        

                                                

                                                                            
                                                                             
                                                   

                                                                           


             

       
                                               
                                                
                       
                                   
                               
                               
                         
                                                
                 
                                                              
                                                                           
                
                                                       
   
  
structure TopologyDefinition (X : Type u) where
                                                
  IsOpen : Set X → Prop
                                   
  isOpen_univ : IsOpen Set.univ
                               
  isOpen_empty : IsOpen ∅
                                                
  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)
                                                                           
  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)

end LRA.Topology
