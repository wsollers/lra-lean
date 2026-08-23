import LRA.UniversalAlgebra.Algebra.Definition
import Mathlib.Order.SetNotation

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

   
                                              
                                              
                                        

                                                                 
                                                               
                                                                   
                                                                   
                                                                    
                                                                   
                                                              
                                                              
                                       
  

                                                          
                                             

             

       
                                                          
                       
                       
   
  
structure Equation (S : Signature) (Variable : Type) where
  lhs : Term S Variable
  rhs : Term S Variable

                                                                     
                       

             

       
                                                       
                                                                
                                     
                                            
                                            
   
  
def SatisfiesEquation {S : Signature} {Variable : Type}
    (M : Model.{u} S) (equation : Equation S Variable) : Prop :=
  ∀ assignment : Variable → M.Domain,
    evaluateTerm M assignment equation.lhs =
      evaluateTerm M assignment equation.rhs

                                                                  

             

       
                                                            
                           
   
  
abbrev EquationalTheory (S : Signature) (Variable : Type) :=
  Set (Equation S Variable)

                                       

             

       
                                                              
                                                                 
                                                            
   
  
def ModelsOfEquationalTheory {S : Signature} {Variable : Type}
    (theory : EquationalTheory S Variable) : Set (Model.{u} S) :=
  fun M => ∀ equation ∈ theory, SatisfiesEquation M equation

                                                                    
                

             

       
                                                             
                                                                 
                                                            
   
  
def EquationalTheoryOfClass {S : Signature} {Variable : Type}
    (class_ : Set (Model.{u} S)) : EquationalTheory S Variable :=
  fun equation => ∀ M ∈ class_, SatisfiesEquation M equation

                                                                 
                                                                

             

       
                                                                    
                                    
                                            
   
  
def IsVariety {S : Signature} (class_ : Set (Model.{u} S)) : Prop :=
  ∃ theory : EquationalTheory S Nat,
    class_ = ModelsOfEquationalTheory theory

                                                           

             

       
                                                         
                                       
                                                   
   
  
theorem modelsOfEquationalTheoryIsVariety {S : Signature}
    (theory : EquationalTheory S Nat) :
    IsVariety (ModelsOfEquationalTheory.{u} theory) := by
  sorry

end LRA.UniversalAlgebra
