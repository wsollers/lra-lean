                                         
                                                     

import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures
import LRA.Order
namespace LRA.NumberSystems.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
open LRA.Order

universe u

   
                                                  
                                            
                                             

                                                                       
                                                                    
                                                                        
                                                                      
                                                                        
                                                                  
                                                                         
                                                        
                                                                         
                                                                  
                                                      

                                                                       
                                                                      
                                                                    

                                                                      
                                                                    
                                                               
  

                                                                 

   
                                                                                    

             

       
                                                                   
                  
                         
                         
                         
                              
                             
                       
                       
                                           
                                       
                                                    
                                                    
                                                          
                                               
   
  
structure DiscretelyOrderedIntegralDomainModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [domainCert : IntegralDomainLaws Carrier]
  [orderCert : LinearOrderLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [addOrderCert : AdditionRespectsOrderLaws Carrier]
  [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
  [discreteCert : OrderDiscretenessLaw Carrier]

attribute [instance] DiscretelyOrderedIntegralDomainModel.addInst DiscretelyOrderedIntegralDomainModel.mulInst
  DiscretelyOrderedIntegralDomainModel.negInst DiscretelyOrderedIntegralDomainModel.zeroInst DiscretelyOrderedIntegralDomainModel.oneInst
  DiscretelyOrderedIntegralDomainModel.ltInst DiscretelyOrderedIntegralDomainModel.leInst DiscretelyOrderedIntegralDomainModel.domainCert
  DiscretelyOrderedIntegralDomainModel.orderCert DiscretelyOrderedIntegralDomainModel.strictCert
  DiscretelyOrderedIntegralDomainModel.addOrderCert DiscretelyOrderedIntegralDomainModel.mulOrderCert
  DiscretelyOrderedIntegralDomainModel.discreteCert

                                                      

             

       
                                                               
                                                                 
                                              
                                   
                                                                     
                                                                      
                  
   
  
def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }

                                                               
                             
def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

                                         

   
                                                                                 
                                                                              

             

       
                                                       
                  
                         
                         
                         
                         
                              
                             
                       
                       
                                        
                                                    
                                     
   
  
structure DenselyOrderedFieldModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [fieldCert : OrderedFieldLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [denseCert : DenseOrderLaw Carrier]

attribute [instance] DenselyOrderedFieldModel.addInst DenselyOrderedFieldModel.mulInst
  DenselyOrderedFieldModel.negInst DenselyOrderedFieldModel.invInst DenselyOrderedFieldModel.zeroInst
  DenselyOrderedFieldModel.oneInst DenselyOrderedFieldModel.ltInst DenselyOrderedFieldModel.leInst
  DenselyOrderedFieldModel.fieldCert DenselyOrderedFieldModel.strictCert
  DenselyOrderedFieldModel.denseCert

                                                                   

             

       
                                                   
                                                                         
                                                        
                                                   
                  
   
  
def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }

                                    
def DenselyOrderedFieldModel.signature (M : DenselyOrderedFieldModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

                                                          

                                                                         
                                                       

             

       
                                                          
                 
                                                
   
  
structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]

attribute [instance] RealModel.completeCert

                                                  

             

       
                                    
                                                                         
                                                        
                                                                      
                  
   
  
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

                                 

             

       
                                                                  
                                        
   
  
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature

                                                   

   
                                                                                                     

             

       
                                                                                                                                            
   
  
def mathlibDiscretelyOrderedIntegralDomainModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int

                                                                           

             

       
                                                                 
                                        
   
  
def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat

   
                                                                       

             

       
                                                                          
   
  
noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real

                                                                

                                                                     
                                                                     
        

   
                                                                                                           

             

       
                                                   
                                                                 
                                                                       
           
                                                                           
             
                   
                                                     
                               
                              
                     
                   
                                                               
                     
                                                
                           
                   
                                                               
                             
                   
                                                     
   
  
structure OrderedRingEmbeddingIntoDenseOrderedField
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToField :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToField first = ToField second → first = second
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition :
    ∀ first second,
      ToField (first + second) = ToField first + ToField second
  PreservesNegation :
    ∀ value, ToField (-value) = -(ToField value)
  PreservesMultiplication :
    ∀ first second,
      ToField (first * second) = ToField first * ToField second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToField first ≤ ToField second ↔ first ≤ second

                                                                           
                                                                             

             

       
                                               
                                                                           
                                                         
                    
                                                                                           
                       
                                                       
                                                    
                                                             
   
  
structure ArchimedeanDenseOrderedFieldExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToField IntegerValue

   
                                                                                                 

             

       
                                            
                                                                 
                                         
          
                                                                        
             
                                                                 
                              
                             
                     
                   
                                                            
                     
                                              
                           
                   
                                                            
                    
                                                          
                             
                                                                 
   
  
structure DenseOrderedFieldEmbeddingIntoReal
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedDenselyOrderedFieldModel.Carrier → SelectedRealModel.Carrier
  injective :
    ∀ first second, ToReal first = ToReal second → first = second
  PreservesZero : ToReal 0 = 0
  PreservesOne : ToReal 1 = 1
  PreservesAddition :
    ∀ first second,
      ToReal (first + second) = ToReal first + ToReal second
  PreservesNegation :
    ∀ value, ToReal (-value) = -(ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal (first * second) = ToReal first * ToReal second
  PreservesInverse :
    ∀ value, value ≠ 0 → ToReal value⁻¹ = (ToReal value)⁻¹
  PreservesAndReflectsOrder :
    ∀ first second, ToReal first ≤ ToReal second ↔ first ≤ second

                                                                            
                                         

             

       
                              
                                                                           
                           
                              
                                                                                 
                                       
                                    
                                                                 
                                                                   
   
  
structure CofinalRealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < DenseOrderedFieldEmbedding.ToReal RationalValue

                                                                   

example (M : DiscretelyOrderedIntegralDomainModel) (a b : M.Carrier) : a + b = b + a :=
  AddCommutative a b

example (M : DenselyOrderedFieldModel) (a b : M.Carrier) (h : a < b) :
    ∃ middle, a < middle ∧ middle < b :=
  ExistsBetween a b h

example (M : RealModel) :
    LRA.Order.LeastUpperBoundProperty
      (Set M.Carrier) (fun a b : M.Carrier => a ≤ b) :=
  Completeness

example (a b : mathlibDiscretelyOrderedIntegralDomainModel.Carrier) : a * b = b * a :=
  MulCommutative a b

end LRA.NumberSystems.Interface.ModelTheory
