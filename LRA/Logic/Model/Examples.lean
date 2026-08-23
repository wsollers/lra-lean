import LRA.Logic.Model.Model
import LRA.Logic.Language.Examples

namespace LRA.Logic.FirstOrder

   
                           

                                                         
                                                                           
                                                                         
                                                                            
                                                                        
                                                                        
                             

                                          

                                                                          
                                                                           
                                                                         
                                                                       
                                                                         
                                                  

                                                                                       
                                                                       
                                                                          
                                                                           
                                                                        
                                                                           
                                                                         
                                                                    
                                                                                  
                                                                          
                                                                     
                   
  

   
                                                              
  

                                                                       
                             

             

       
                                                   
               
                       
                   
                                                             
                                         
                   
               
   
  
def natMulMonoidModel : Model monoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .one => 1

   
                                                                                 

             

       
                                                   
                 
                                            
                                                   
   
  
theorem natMulMonoidModel.mulComputesMultiplication
    (a b : Nat) :
    natMulMonoidModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

   
                                                           

             

       
                                          
                                                        
   
  
theorem natMulMonoidModel.oneComputesOne :
    natMulMonoidModel.interpretConstant .one = (1 : Nat) := rfl

   
                                                                
  

                                                                         
                        

             

       
                                                           
               
                       
                   
                                                             
                                         
                   
                
   
  
def natAddMonoidModel : Model additiveMonoidSignature where
  Domain := Nat
  domainNonempty := ⟨0⟩
  interpretFunction
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
  interpretRelation := fun r => nomatch r
  interpretConstant
    | .zero => 0

   
                                                                     

             

       
                                             
                 
                                            
                                                   
   
  
theorem natAddMonoidModel.addComputesAddition
    (a b : Nat) :
    natAddMonoidModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

   
                                                               

             

       
                                            
                                                         
   
  
theorem natAddMonoidModel.zeroComputesZero :
    natAddMonoidModel.interpretConstant .zero = (0 : Nat) := rfl

   
                                                         

                                                                         
                                                                           
                                                       
  

                                                                        
                                                                       
                                                                        

             

       
                                                          
               
                       
                   
                                                             
                                                             
                                          
                   
                                                            
                   
                
               
   
  
def intOrderedRingModel : Model orderedRingSignature where
  Domain := Int
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

   
                                                                       

             

       
                                               
                 
                                              
                                                   
   
  
theorem intOrderedRingModel.addComputesAddition
    (a b : Int) :
    intOrderedRingModel.interpretFunction .add
      (fun i => if i.val = 0 then a else b) = a + b := rfl

   
                                                                                   

             

       
                                                     
                 
                                              
                                                   
   
  
theorem intOrderedRingModel.mulComputesMultiplication
    (a b : Int) :
    intOrderedRingModel.interpretFunction .mul
      (fun i => if i.val = 0 then a else b) = a * b := rfl

   
                                                                       

             

       
                                               
               
                                                                
   
  
theorem intOrderedRingModel.negComputesNegation
    (a : Int) :
    intOrderedRingModel.interpretFunction .neg (fun _ => a) = -a := rfl

   
                                                                      

             

       
                                              
                 
                                             
                                                     
   
  
theorem intOrderedRingModel.ltComputesLessThan
    (a b : Int) :
    intOrderedRingModel.interpretRelation .lt
      (fun i => if i.val = 0 then a else b) = (a < b) := rfl

   
                                                                 

             

       
                                              
                                                           
   
  
theorem intOrderedRingModel.zeroComputesZero :
    intOrderedRingModel.interpretConstant .zero = (0 : Int) := rfl

   
                                                             

             

       
                                            
                                                          
   
  
theorem intOrderedRingModel.oneComputesOne :
    intOrderedRingModel.interpretConstant .one = (1 : Int) := rfl

end LRA.Logic.FirstOrder
