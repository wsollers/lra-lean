import LRA.Relation.Operations.Converse.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Relation

universe u v

                                                            
theorem LeftTotalIffConverseRightTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftTotal relation ↔ RightTotal (Converse relation) := by
  sorry

                                                            
theorem RightTotalIffConverseLeftTotal
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightTotal relation ↔ LeftTotal (Converse relation) := by
  sorry

                                                                
theorem RightUniqueIffConverseLeftUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    RightUnique relation ↔ LeftUnique (Converse relation) := by
  sorry

                                                                
theorem LeftUniqueIffConverseRightUnique
    {Alpha : Type u} {Beta : Type v}
    (relation : HeterogeneousBinaryRelation Alpha Beta) :
    LeftUnique relation ↔ RightUnique (Converse relation) := by
  sorry

   
                                  

                                                         

             

       
                          
                                     
                                           
   
  
theorem ConverseInvolutive
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Converse (Converse relation) = relation := by
  sorry

   
                                    

                                        

             

       
                            
                                     
                                                        
   
  
theorem ReflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Reflexive (Converse relation) ↔ Reflexive relation := by
  sorry

   
                                      

                                          

             

       
                              
                                     
                                                            
   
  
theorem IrreflexiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Irreflexive (Converse relation) ↔ Irreflexive relation := by
  sorry

   
                                     

                                         

             

       
                             
                                     
                                                          
   
  
theorem TransitiveConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive (Converse relation) ↔ Transitive relation := by
  sorry

   
                                        

                                         

             

       
                                
                                     
                                                                
   
  
theorem AntisymmetricConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Antisymmetric (Converse relation) ↔ Antisymmetric relation := by
  sorry

   
                                

                                     

             

       
                        
                                     
                                                
   
  
theorem TotalConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Total (Converse relation) ↔ Total relation := by
  sorry

   
                                

                                    

             

       
                        
                                     
                                                
   
  
theorem DenseConverseIff
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Dense (Converse relation) ↔ Dense relation := by
  sorry

end LRA.Relation
