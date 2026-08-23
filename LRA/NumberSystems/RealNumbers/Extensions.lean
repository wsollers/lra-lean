                                                
                                                              

import LRA.NumberSystems.Models.UniversalProperties

namespace LRA.NumberSystems.RealNumbers.Extensions
open LRA.NumberSystems.Models

   
                                        
                                                     
                                                       
                                                     

                                                                            
                                                                            
                                                                           
                                                                   
                                                                              
  

open LRA.NumberSystems.Models

   
                         

                                                                                                                                                                                                                                                                                                


             

       
                 
                            
                                                                              
                                 
                        
                                   
                                                     
   
  
def integer_power
    (real_model : RealModel)
    (base : real_model.signature.carrier) : Nat → real_model.signature.carrier
  | 0 => real_model.signature.one
  | Nat.succ exponent =>
      real_model.signature.multiply
        (integer_power real_model base exponent) base

   
                       

                                                                                                                                               


             

       
               
                            
                  
                                                            
                                                 
   
  
def is_nth_root
    (real_model : RealModel)
    (degree : Nat)
    (root radicand : real_model.signature.carrier) : Prop :=
  integer_power real_model root degree = radicand

   
                                        

                                                                                                                                                                                                                                                                                                                                                                  

                             


             

       
                                
                                                          
                                                                              
                                                                                       
                                                          
                                                    
                                           
                                                         
                                                              
               
                                                    
             
                                                         
                                                              
   
  
theorem archimedean_integer_part
    (integer_model : DiscretelyOrderedIntegralDomainModel)
    (rational_extension : ArchimedeanDenseOrderedFieldExtension integer_model)
    (real_extension : CofinalRealExtension rational_extension.DenselyOrderedFieldModel)
    (value : real_extension.RealModel.signature.carrier) :
    ∃ lower upper : integer_model.signature.carrier,
      real_extension.RealModel.signature.le
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField lower))
        value ∧
      real_extension.RealModel.signature.StrictOrder
        value
        (real_extension.DenseOrderedFieldEmbedding.ToReal
          (rational_extension.IntegerEmbedding.ToField upper)) := by
  sorry

   
                                                     

                                                                                                                                                                                                                                                                                         

                             


             

       
                                             
                            
                  
                                  
                                             
                           
                                                                   
                                          
                                                              
                                                   
   
  
theorem nth_root_exists_for_nonnegative_reals
    (real_model : RealModel)
    (degree : Nat)
    (degree_positive : 0 < degree)
    (radicand : real_model.signature.carrier)
    (radicand_nonnegative :
      real_model.signature.le real_model.signature.zero radicand) :
    ∃ root : real_model.signature.carrier,
      real_model.signature.le real_model.signature.zero root ∧
        is_nth_root real_model degree root radicand := by
  sorry

   
                                                         

                                                                                                                                                                                                                                                                                                                                                 

                             


             

       
                                                 
                                
                                                                       
                                                                                 
                                                     
                                        
   
  
theorem complete_archimedean_ordered_field_unique
    (first second : RealModel) :
    ∃! comparison : first.signature.carrier → second.signature.carrier,
      LRA.NumberSystems.Models.CanonicalEmbeddings.EmbeddingPreservesOrderedField
        first.signature second.signature comparison ∧
      LRA.Function.Surjective comparison := by
  sorry

end LRA.NumberSystems.RealNumbers.Extensions
