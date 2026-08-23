import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Algebra.Order.Ring.Cast
import Mathlib.Data.Rat.Cast.Order
import LRA.Logic.Model.Examples
import LRA.Logic.Model.Comparison.ModelEmbedding
import LRA.Logic.Model.Comparison.ModelIsomorphism
import LRA.Logic.Model.Comparison.Automorphism

namespace LRA.Logic.FirstOrder

   
                                      

                                                                        
                                                                       
                                                               

                                                                           
                                                                         
                                                                        

                                                                     
                                     

                                                                     
                                                                         
                                                                 
                                                                         
                                                 

                                                                
                                                                       
                                                                           
                                                                          
                                                                        
                             

                                                                     
                                                                         
                                                                         
                                                                           
                                                              
  

   
                                         
  

                                                                        
                

             

       
                                                        
               
                       
                   
                                                             
                                                             
                                          
                   
                                                            
                   
                
               
   
  
def qOrderedRingModel : Model orderedRingSignature where
  Domain := Rat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1

   
                                                                     

             

       
                                             
                 
                                            
                                                   
   
  
theorem qOrderedRingModel.addComputesAddition
    (a b : Rat) :
    qOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

   
                                                               

             

       
                                            
                                                         
   
  
theorem qOrderedRingModel.zeroComputesZero :
    qOrderedRingModel.interpretConstant .zero = (0 : Rat) := rfl

   
                                                           

             

       
                                          
                                                        
   
  
theorem qOrderedRingModel.oneComputesOne :
    qOrderedRingModel.interpretConstant .one = (1 : Rat) := rfl

                                                                         
                

             

       
                                                        
                
                       
                   
                                                             
                                                             
                                          
                   
                                                            
                   
                
               
   
  
def rOrderedRingModel : Model orderedRingSignature where
  Domain := Real
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretRelation
    | .lt, args => args ⟨0, by decide⟩ < args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1

   
                                                                     

             

       
                                             
                  
                                            
                                                   
   
  
theorem rOrderedRingModel.addComputesAddition
    (a b : Real) :
    rOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

   
                                                               

             

       
                                            
                                                          
   
  
theorem rOrderedRingModel.zeroComputesZero :
    rOrderedRingModel.interpretConstant .zero = (0 : Real) := rfl

   
                                                           

             

       
                                          
                                                         
   
  
theorem rOrderedRingModel.oneComputesOne :
    rOrderedRingModel.interpretConstant .one = (1 : Real) := rfl

   
                                                                        

                                                                          
                                                         
                                                                         
                                                               
                                                                         
  

                                                                            
                                                                        
    

             

       
                                                                              
                                  
                                                                                
                   
                                                                    
                                                                    
                                                                    
                   
                                                               
                                                              
                   
                                                                                
   
  
def zToQEmbedding : ModelEmbedding intOrderedRingModel qOrderedRingModel where
  toFun := (Int.cast : Int -> Rat)
  injective := (Int.cast_injective : Function.Injective (Int.cast : Int -> Rat))
  preservesFunction
    | .add, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .mul, args => by simp [intOrderedRingModel, qOrderedRingModel]
    | .neg, args => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesConstant
    | .zero => by simp [intOrderedRingModel, qOrderedRingModel]
    | .one => by simp [intOrderedRingModel, qOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [intOrderedRingModel, qOrderedRingModel, Int.cast_lt]

                                                                            
                                                                        
    

             

       
                                                                            
                                   
                                                                                 
                   
                                                                  
                                                                  
                                                                  
                   
                                                             
                                                            
                   
                                                                              
   
  
def qToREmbedding : ModelEmbedding qOrderedRingModel rOrderedRingModel where
  toFun := (Rat.cast : Rat -> Real)
  injective := (Rat.cast_injective : Function.Injective (Rat.cast : Rat -> Real))
  preservesFunction
    | .add, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .mul, args => by simp [qOrderedRingModel, rOrderedRingModel]
    | .neg, args => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesConstant
    | .zero => by simp [qOrderedRingModel, rOrderedRingModel]
    | .one => by simp [qOrderedRingModel, rOrderedRingModel]
  preservesRelation
    | .lt, args => by simp [qOrderedRingModel, rOrderedRingModel, Rat.cast_lt]

   
                                              

                                                                       
                                                                        
                                                                              
                                                                       
                                                                    
                                                                           
                                                                     
                                                        
  

                                                                         
            

             

       
                                                                             
                                         
   
  
def qToQIsomorphism : ModelIsomorphism qOrderedRingModel qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

                                                                      

             

       
                                                        
                                         
   
  
def qToQAutomorphism : Automorphism qOrderedRingModel :=
  Automorphism.identity qOrderedRingModel

   
                                                            

             

       
                                         
                                             
   
  
theorem qToQIsomorphism.toFunIsIdentity :
    qToQIsomorphism.toFun = (id : Rat -> Rat) := rfl

end LRA.Logic.FirstOrder
