import LRA.Logic.Syntax.FirstOrder.Sentence
import LRA.Logic.Semantics.Sentence
import LRA.Logic.Semantics.SecondOrderMonadic.SOSatisfaction

namespace LRA.Logic.FirstOrder

universe u

   
                     

                                                                           
                                                                        
                                                                          
                                                                      
                                                               
  

                                                       

             

       
                                                         
                          
   
  
abbrev FormulaTheory (S : Signature) (Variable : Type) :=
  Set (Formula S Variable)

                                                        

             

       
                                                                         
                           
   
  
abbrev Theory (S : Signature) (Variable : Type) [DecidableEq Variable] :=
  Set (Sentence S Variable)

                                                                                 
                       

             

       
                         
                                                            
                                    
                    
                                                            
   
  
def ModelsOfFormulaTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> Satisfies M assignment φ

                                                                          

             

       
                  
                                                            
                             
                    
                                                                                     
   
  
def ModelsOfTheory
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : Theory S Variable) :
    Set (Model S) :=
  fun M => ∀ assignment sentence, sentence ∈ Γ -> Satisfies M assignment sentence.val

                                                                              
                            

             

       
                  
                                                            
                             
                        
                                                                                 
   
  
def TheoryOfModels
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (K : Set (Model.{u} S)) :
    Theory S Variable :=
  fun sentence => ∀ M, M ∈ K -> ∀ assignment, Satisfies M assignment sentence.val

                                               

             

       
                       
                                                            
                                                                     
                                  
                                                           
   
  
def SemanticConsequence
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (Γ : FormulaTheory S Variable) (φ : Formula S Variable) : Prop :=
  ∀ M : Model.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> Satisfies M assignment φ

end LRA.Logic.FirstOrder

namespace LRA.Logic.SecondOrderMonadic

universe u

   
                              

                                                                             
                                                                              
      
  

                                                   

             

       
                                                                     
                                        
   
  
abbrev FormulaTheory (S : Signature) (Variable SetVariable : Type) :=
  Set (SOFormula S Variable SetVariable)

                                                                         
                                                               

             

       
                         
                                                 
                                                    
                                                
                          
                                                              
   
  
def ModelsOfFormulaTheory
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable) :
    Set (HenkinModel S) :=
  fun M => ∀ assignment φ, φ ∈ Γ -> SOSatisfies M assignment φ

                                                                         
                 

             

       
                       
                                                 
                                                    
                                              
                                                    
                                        
                                                             
   
  
def SemanticConsequence
    {S : Signature} {Variable SetVariable : Type}
    [DecidableEq Variable] [DecidableEq SetVariable]
    (Γ : FormulaTheory S Variable SetVariable)
    (φ : SOFormula S Variable SetVariable) : Prop :=
  ∀ M : HenkinModel.{u} S, ∀ assignment,
    M ∈ ModelsOfFormulaTheory Γ -> SOSatisfies M assignment φ

end LRA.Logic.SecondOrderMonadic
