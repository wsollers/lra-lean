                                                
                                               

import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

   
                                         
                                                     
                                            

                                                                      
                                                                 
                                                              
                                                                      
                                                            
                                                                       
                                                           

                                                                     
                                                                       
                                                                   
                                                         
  

                                           
inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

                                           
inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq

                                     
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

                     
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

                                                                                      
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol

                                       
theorem MembershipSymbolIsBinary :
    MembershipSignature.IsBinaryRelationSymbol .mem := by
  sorry

                                  

                                  
abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n

                                  
abbrev emptyT : Term MembershipSignature Nat := .const .emptySet

                                                                                      
def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0)

                                    
def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right)

                                 
abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y)

                                 
abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y)

                         
def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ

                                    
def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ)

end LRA.Set.ModelTheory
