import LRA.UniversalAlgebra.Satisfaction.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

   
                                              
                                              
                                                            
                                                

                                                                 
                                                                     
                                                                 
                                                                  
                                                              
                                                       

                                                                
                                                                     
                                                                      
                                                                      
                                                             
  

                                                                     
                            

             

       
                                      
                                             
                           
                     
                                         
                                                                    
                                                          
                                                                       
                     
                                        
                                                
                                          
                     
                                         
                                                                    
                                                    
                                                                       
   
  
structure Homomorphism {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) where
  map : M.Domain → N.Domain
  preservesFunction :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      map (M.interpretFunction functionSymbol arguments) =
        N.interpretFunction functionSymbol (fun i => map (arguments i))
  preservesConstant :
    ∀ constantSymbol : S.ConstantSymbol,
      map (M.interpretConstant constantSymbol) =
        N.interpretConstant constantSymbol
  preservesRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      M.interpretRelation relationSymbol arguments →
        N.interpretRelation relationSymbol (fun i => map (arguments i))

                              

             

       
                                                       
                          
                               
                                     
                                   
                                             
   
  
def Homomorphism.id {S : Signature} (M : Model.{u} S) :
    Homomorphism M M where
  map := fun element => element
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds

                                 

             

       
                                     
                                                         
                                                            
                          
                                                      
                                                         
                                                          
                                               
                                                          
                                                            
                                             
                                                              
   
  
def Homomorphism.comp {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S} {P : Model.{v} S}
    (second : Homomorphism N P) (first : Homomorphism M N) :
    Homomorphism M P where
  map := fun element => second.map (first.map element)
  preservesFunction := fun functionSymbol arguments => by
    rw [first.preservesFunction, second.preservesFunction]
  preservesConstant := fun constantSymbol => by
    rw [first.preservesConstant, second.preservesConstant]
  preservesRelation := fun relationSymbol arguments holds =>
    second.preservesRelation relationSymbol _
      (first.preservesRelation relationSymbol arguments holds)

                                               

             

       
                                                               
                                                         
                                     
                                                                 
                                                       
                                                                    
   
  
theorem Homomorphism.commutesWithTermEvaluation {S : Signature}
    {Variable : Type} {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (assignment : Variable → M.Domain) (term : Term S Variable) :
    homomorphism.map (evaluateTerm M assignment term) =
      evaluateTerm N (fun v => homomorphism.map (assignment v)) term := by
  sorry

                                                                      
                                                             
                                 

             

       
                                               
                                         
                                                  
                                        
                                                 
                                  
                                     
                                   
                                                                                   
   
  
noncomputable def termExtension {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : Model.{0} S) (hAlgebraic : S.IsAlgebraic)
    (assignment : Variable → M.Domain) :
    Homomorphism (termAlgebra S Variable) M where
  map := evaluateTerm M assignment
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun relationSymbol => False.elim (hAlgebraic relationSymbol)

                                                                     
                                                                     
           

             

       
                                           
                                         
                     
                                      
                                                            
                        
                                                                 
                             
                                                            
   
  
theorem termExtensionUnique {S : Signature}
    {Variable : Type} [Nonempty Variable]
    (M : Model.{0} S)
    (assignment : Variable → M.Domain)
    (homomorphism : Homomorphism (termAlgebra S Variable) M)
    (agreesOnVariables :
      ∀ v : Variable, homomorphism.map (.var v) = assignment v) :
    ∀ term : Term S Variable,
      homomorphism.map term = evaluateTerm M assignment term := by
  sorry

                                                                   
                               

             

       
                                                         
                                                         
                                     
                                                                                  
                                    
                                                      
                                
   
  
theorem equationTransportsAlongSurjection {S : Signature}
    {Variable : Type} {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective : ∀ target : N.Domain, ∃ source, homomorphism.map source = target)
    (equation : Equation S Variable)
    (sourceSatisfies : SatisfiesEquation M equation) :
    SatisfiesEquation N equation := by
  sorry

end LRA.UniversalAlgebra
