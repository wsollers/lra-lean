                                                      
                                                                   

import LRA.NumberSystems.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings

open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

   
                                     
                                                         
                                                           
                                                     
  
structure EmbeddingPreservesOrderedRing
    (source target : OrderedRingSignature)
    (map : source.carrier → target.carrier) : Prop where
  injective : ∀ first second, map first = map second → first = second
  PreservesZero : map source.zero = target.zero
  PreservesOne : map source.one = target.one
  PreservesAddition :
    ∀ first second,
      map (source.add first second) =
        target.add (map first) (map second)
  PreservesNegation :
    ∀ value, map (source.neg value) = target.neg (map value)
  PreservesMultiplication :
    ∀ first second,
      map (source.multiply first second) =
        target.multiply (map first) (map second)
  PreservesAndReflectsOrder :
    ∀ first second,
      target.le (map first) (map second) ↔
        source.le first second
structure EmbeddingPreservesOrderedField
    (source target : OrderedFieldSignature)
    (map : source.carrier → target.carrier) : Prop
    extends EmbeddingPreservesOrderedRing
      source.toOrderedRingSignature target.toOrderedRingSignature map where
  PreservesInverse :
    ∀ value,
      value ≠ source.zero →
        map (source.inv value) = target.inv (map value)
   
                                                          

             

       
                                 
                                                                 
                                                                                                                
                                                                                                                                             
                           
                                 
                                    
                                                                                                             
                                                                            
                           
                                  
                                                                                      
                                                      
                                                                    
   
  

structure AdjacentTowerEmbeddings
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) : Prop where
  IntegerToFieldPreserves :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature.toOrderedRingSignature
      SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField
  RationalToRealPreserves :
    EmbeddingPreservesOrderedField
      SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel.signature
      SelectedCofinalRealExtension.RealModel.signature
      SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
   
                                                         

             

       
                          
                                                                 
                                                                                                                
                                                                                                                                  
                                                                                                        
              
                                                                  
                                                                                    
   
  

def CompositeIntegerToReal
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel) :
    SelectedIntegerModel.signature.carrier → SelectedCofinalRealExtension.RealModel.signature.carrier :=
  fun value =>
    SelectedCofinalRealExtension.DenseOrderedFieldEmbedding.ToReal
      (SelectedArchimedeanDenseOrderedFieldExtension.IntegerEmbedding.ToField value)
   
                                                                    

             

       
                                         
                                                                 
                                                                                                                
                                                                                                                                
                         
                                                                                                                                
                                 
                                    
                                                                             
                                                                                                         
   
  

theorem CompositeIntegerToRealIsEmbedding
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel}
    (SelectedArchimedeanDenseOrderedFieldExtension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel)
    (SelectedCofinalRealExtension : CofinalRealExtension SelectedArchimedeanDenseOrderedFieldExtension.DenselyOrderedFieldModel)
    (AdjacentEmbeddings :
      AdjacentTowerEmbeddings SelectedIntegerModel SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension) :
    EmbeddingPreservesOrderedRing
      SelectedIntegerModel.signature
      SelectedCofinalRealExtension.RealModel.signature.toOrderedRingSignature
      (CompositeIntegerToReal SelectedArchimedeanDenseOrderedFieldExtension SelectedCofinalRealExtension) := by
  sorry

end LRA.NumberSystems.Interface.ModelTheory.CanonicalEmbeddings
