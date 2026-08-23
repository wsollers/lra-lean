                                                                              

namespace LRA.UniversalAlgebra.Quotient

   
                                                                        
        

                                                                            
                                                                          
                                                                         
                                                                       
                                                                               
  

   
                                                          

                                                                          
        

                                                                                                                                                


             

       
                            
                    
                             
                                             
                                                         
                                                         
            
                                      
                                       
   
  
def unary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    setoid.r
      (operation first_representative)
      (operation second_representative)

   
                                                                       

                                                                                                                                                                


             

       
                                  
                    
                             
                                                       
                                                                           
                                                     
            
                                                            
                                                         
   
  
def binary_operation_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement second_representative : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_representative)

   
                                                                        

                                                                                                                                                                 


             

       
                                   
                    
                             
                                                       
                                                                            
                                                       
            
                                                            
                                                         
   
  
def binary_operation_respects_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative second_representative second_replacement : Carrier,
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_representative second_replacement)

   
                                                           

                                                                                                                                                           


             

       
                             
                    
                             
                                                       
                                          
                                                       
                                                     
                                                       
            
                                                            
                                                      
   
  
def binary_operation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    setoid.r
      (operation first_representative second_representative)
      (operation first_replacement second_replacement)

   
                                               

                                                                             
                            

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                    
                    
                             
                                               
                                                
                                                       
                                                      
   
  
theorem binary_operation_respects_iff_left_and_right
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier) :
    binary_operation_respects setoid operation ↔
      binary_operation_respects_left setoid operation ∧
      binary_operation_respects_right setoid operation := by
  sorry

   
                                                                       

                                                                            
                           

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                       
                    
                             
                                             
                               
                               
                                                        
                              
                                                        
                                              
   
  
theorem commutative_operation_respects_of_respects_left
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (operation : Carrier → Carrier → Carrier)
    (operation_is_commutative :
      ∀ first second : Carrier,
        operation first second = operation second first)
    (operation_respects_left :
      binary_operation_respects_left setoid operation) :
    binary_operation_respects setoid operation := by
  sorry

   
                                                                                 

                                                                         
                                                                           
                    

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                       
                    
                             
                                                            
                                        
                                                                  
                          
                                                            
                                                             
                          
                                                     
                                                        
                            
                                     
                                  
                                    
   
  
theorem induced_binary_operation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_operation : Carrier → Carrier → Carrier)
    (representative_operation_respects :
      binary_operation_respects setoid representative_operation) :
    ∃ quotient_operation :
        Quotient setoid → Quotient setoid → Quotient setoid,
      ∀ first_representative second_representative : Carrier,
        quotient_operation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) =
          Quotient.mk setoid
            (representative_operation
              first_representative
              second_representative) := by
  sorry

   
                                                    

                                                                                                                                       


             

       
                      
                    
                             
                                          
                                                         
                                                         
                                                                      
   
  
def predicate_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop) : Prop :=
  ∀ first_representative second_representative : Carrier,
    setoid.r first_representative second_representative →
    (predicate first_representative ↔ predicate second_representative)

   
                                                   

                                                                                                                                               


             

       
                     
                    
                             
                                                   
                                          
                                                       
                                                     
                                                       
                                                          
                                                    
   
  
def relation_respects
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (relation : Carrier → Carrier → Prop) : Prop :=
  ∀ first_representative first_replacement
    second_representative second_replacement : Carrier,
    setoid.r first_representative first_replacement →
    setoid.r second_representative second_replacement →
    (relation first_representative second_representative ↔
      relation first_replacement second_replacement)

   
                                                                        

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                          
                    
                             
                                
                                                                   
                                                          
                                     
                                                            
                                                                    
   
  
theorem compatible_predicate_has_constant_truth_on_classes
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (predicate : Carrier → Prop)
    (predicate_is_compatible : predicate_respects setoid predicate)
    (first_representative second_representative : Carrier)
    (representatives_are_equivalent :
      setoid.r first_representative second_representative) :
    predicate first_representative ↔ predicate second_representative := by
  sorry

   
                                                              

                                                                                                                                                                                                                                                                                                      

                             


             

       
                               
                    
                             
                                                        
                                       
                                                         
                                                                   
                                                             
                         
                                                     
                                                        
                                 
                                
                                 
   
  
theorem induced_relation_exists
    {Carrier : Type}
    (setoid : Setoid Carrier)
    (representative_relation : Carrier → Carrier → Prop)
    (representative_relation_respects :
      relation_respects setoid representative_relation) :
    ∃ quotient_relation : Quotient setoid → Quotient setoid → Prop,
      ∀ first_representative second_representative : Carrier,
        quotient_relation
            (Quotient.mk setoid first_representative)
            (Quotient.mk setoid second_representative) ↔
          representative_relation
            first_representative
            second_representative := by
  sorry

end LRA.UniversalAlgebra.Quotient
