namespace LRA.Set

universe u v w

   
                                                                        
                                                                        

                                                         
                                                                       
                                                                      
                                                                      
                                                                       
                                                               
                                                                      

                                                                       
                                                           
                                                                         
                                                                        
                                                                      
                                                  
  

                                      

                                                                   
                                                                    
                                                                       
                                     

             

       
                                      
                    
   
  
class HasComplement (α : Type u) where
  complement : α → α

scoped postfix:1024 "ᶜ" => HasComplement.complement

                                                               
                                                                       
       

             

       
                                     
               
   
  
class HasUniversal (α : Type u) where
  universal : α

scoped notation "𝒰" => HasUniversal.universal

                                          

                                                              
                                                                   
                                      

             

       
                                    
                      
   
  
class HasSymmDiff (α : Type u) where
  symmDiff : α → α → α

scoped infixl:100 " ∆ " => HasSymmDiff.symmDiff

                                                                         
                                                                          
                                                                       
                                                                         
                                                                      
                                                                          
                                                                          
                                     

             

       
                                                                            
                                                       
   
  
class HasSeparation (Element : outParam (Type u)) (SetObject : Type v) where
  separation : SetObject → (Element → Prop) → SetObject

                                                                    

                                                                        
                                                                          
                                                                         
                                                        
                                                                    
                                                    

             

       
                                                                             
                                   
   
  
class HasPowerset (SetObject : Type u) (Collection : outParam (Type v)) where
  powerset : SetObject → Collection

                                                                       
                                                                       
                                                               

             

       
                                                
                                                                   
   
  
class HasIndexedUnion (SetObject : Type v) where
  indexedUnion : {Index : Type w} → (Index → SetObject) → SetObject

                                                                          
                             

             

       
                                                       
                                                                          
   
  
class HasIndexedIntersection (SetObject : Type v) where
  indexedIntersection : {Index : Type w} → (Index → SetObject) → SetObject

                                                                      
                                                                 
                                                                 
                                                                    
                       

             

       
                                                  
                                                
   
  
class HasCountableUnion (SetObject : Type v) where
  countableUnion : (Nat → SetObject) → SetObject

                                                                     

             

       
                                                         
                                                       
   
  
class HasCountableIntersection (SetObject : Type v) where
  countableIntersection : (Nat → SetObject) → SetObject

                                                                         
                                                                       
                                                       

             

       
                                                                                    
                                          
   
  
class HasCollectionUnion (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionUnion : Collection → SetObject

                                                                          
                                                                        
                                                                 
                                                              

             

       
                                                                                           
                                                 
   
  
class HasCollectionIntersection (SetObject : outParam (Type v)) (Collection : Type w) where
  collectionIntersection : Collection → SetObject

end LRA.Set
