import LRA.Logic.Semantics.Sentence

namespace LRA.Logic.FirstOrder

   
                                                                          
                                                                   
                                                              
                                                                          
                                                                     
                                      

                                                                     
                                                                     
                                                                   
                                                                       
                                                                       
                                                                       
                                                                      
  

                                                                        
             

             

       
                                  
     
     
   
  
inductive TestRelationSymbol where
  | A
  | B

                                                                      
                                 

             

       
                                      
                                  
                                               
                    
   
  
def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty

                                                                        
                                                                          
     

             

       
                                               
                
                        
                                            
                                      
                                 
   
  
def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

                                                                     
                                                               
                                                                        
                                                                        

             

       
                                                    
             
                                   
                                   
   
  
def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0)

                                                    

             

       
                                                      
                          
   
  
def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩

                                                                     
                                       

             

       
                                                                                
                                                    
   
  
theorem testFOLModel_satisfies_aAndB (assignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel assignment testFOLFormula := by
  show Satisfies testFOLModel assignment
    (Formula.and
      (Formula.relation .A Fin.elim0)
      (Formula.relation .B Fin.elim0))
  rw [satisfiesAndIffSatisfiesBoth]
  refine ⟨?_, ?_⟩
  · trivial
  · trivial

                                                                              
example
    (leftAssignment rightAssignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel leftAssignment testFOLSentence.val ↔
      Satisfies testFOLModel rightAssignment testFOLSentence.val :=
  satisfies_sentence_iff testFOLModel testFOLSentence

   
                              

                                                                  
                                                         

                                                                         
                                   
                                                                        
                                                                      
                                          

                                                                     
                                                                     
                                                                      
                                                                
  

                                                                   

             

       
                                        
     
   
  
inductive QuantifierRelationSymbol where
  | R

                                                                         
                                  

             

       
                                         
                                  
                                                     
                    
   
  
def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty

                                                                       

             

       
                                                     
                
                          
                                            
                                      
                                 
   
  
def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

                                                                        
           

             

       
                                                         
                
                          
                                            
                   
                                            
                                 
   
  
def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim

                                                                    
                                                                     
        

             

       
                
   
  
def x : Nat := 0

                           

             

       
                                                       
                                                               
   
  
def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x))

                           

             

       
                                                       
                                                               
   
  
def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x))

                                          

             

       
                                                                                        
                                                       
   
  
theorem alwaysTrueModel_satisfies_forallR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment forallRFormula := by
  show ∀ a : Bool, Satisfies alwaysTrueModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro a
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x a) (Term.var x))
  trivial

                                          

             

       
                                                                                        
                                                       
   
  
theorem alwaysTrueModel_satisfies_existsR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment existsRFormula := by
  show Satisfies alwaysTrueModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x true) (Term.var x))
  trivial

                                                                         

             

       
                                                 
                                                      
                                                             
   
  
theorem sometimesFalseModel_not_satisfies_forallR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    ¬ Satisfies sometimesFalseModel assignment forallRFormula := by
  show ¬ ∀ a : Bool, Satisfies sometimesFalseModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro h
  have hfalse : sometimesFalseModel.interpretRelation .R
      (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x false) (Term.var x)) :=
    h false
  simp [sometimesFalseModel, evaluateTerm, updateAssignment] at hfalse

                                                                 
            

             

       
                                             
                                                      
                                                           
   
  
theorem sometimesFalseModel_satisfies_existsR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    Satisfies sometimesFalseModel assignment existsRFormula := by
  show Satisfies sometimesFalseModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show sometimesFalseModel.interpretRelation .R
    (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x true) (Term.var x))
  simp [sometimesFalseModel, evaluateTerm, updateAssignment]

end LRA.Logic.FirstOrder
