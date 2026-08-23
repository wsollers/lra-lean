import LRA.Function.Calculus.Classes.Definition

   
                                                       

                                                                             
                                                             
                                                                              
                                                                            
                                                                            
                                                                              
                                                                         
                                                 
  

namespace LRA.Function

open LRA.Set
universe u v

                                                                               
         
def FinitelyEnumerates {Element : Type u}
    (values : List Element) (selected : SetClass Element) : Prop :=
  ∀ value : Element, value ∈ values ↔ selected value

                                                                     
def HasFiniteEnumeration {Element : Type u}
    (selected : SetClass Element) : Prop :=
  ∃ values : List Element, FinitelyEnumerates values selected

                                                              
def FiniteImage {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  HasFiniteEnumeration (ImageClass function source)

                                         
def FiniteRange {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasFiniteEnumeration (RangeClass function)

end LRA.Function
