                                         
                                                                               

namespace LRA.Set

universe u v

   
                                     
                                      
                                                                       

                                                                   
                                                                     
                                                                      
                                                                    

                                                            
                                                 

                                                                      
                                                                      
                                                          
                                                                    
                                                                     
                                                                   
         

                                                                      
                                                                  
                                                                     
                   
  

                                      

                                                                   
                                                            

             

       
                                                 
                                    
                            
   
  
class HasPairing (Left : Type u) (Right : Type u)
    (Pair : outParam (Type u)) where
  pair : Left → Right → Pair

                                  

                                                              

             

       
                                                                       
                                             
                              
   
  
def OrderedPair {Left Right Pair : Type u} [HasPairing Left Right Pair]
    (first : Left) (second : Right) : Pair :=
  HasPairing.pair first second

                                         

                                                                    
                                                                     
                           

             

       
                                            
                                             
                 
                                                                     
                                        
                                              
                                                         
   
  
class PairingLaws (Left Right Pair : Type u)
    [HasPairing Left Right Pair] : Prop where
  PairInjective :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight

                                 

                                                               

             

       
                                                
                                                                
                                                                     
                                        
                                              
                                                         
   
  
theorem PairInjective {Left Right Pair : Type u}
    [HasPairing Left Right Pair] [PairingLaws Left Right Pair] :
    ∀ (firstLeft secondLeft : Left) (firstRight secondRight : Right),
      OrderedPair firstLeft firstRight =
          OrderedPair secondLeft secondRight ↔
        firstLeft = secondLeft ∧ firstRight = secondRight := by
  sorry

                                               

                                                                       
                                                                      
                                                                    
                                                                   
                                                        

                                    

             

       
                                                
                                           
           
   
  
instance instProdPairing {Left Right : Type u} :
    HasPairing Left Right (Left × Right) :=
  ⟨Prod.mk⟩

                                                              
             

             

       
                                                    
                                         
   
  
instance instProdPairingLaws {Left Right : Type u} :
    PairingLaws Left Right (Left × Right) where
  PairInjective := fun firstLeft secondLeft firstRight secondRight => by
    simp [OrderedPair, HasPairing.pair]

end LRA.Set
