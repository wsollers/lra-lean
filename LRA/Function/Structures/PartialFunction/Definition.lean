import LRA.Function.Definition
import LRA.Relation.Structures.PartialFunction.Definition

   
                                                  

                                                                               
                                                                              
                                                     

                                                                                
                                                                               
                                                                                
                                                                             
                      
  

namespace LRA.Function

universe u v

                                                                     
structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain

                                                                             
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

                                                
def PartialGraph {Domain : Type u} {Codomain : Type v}
    (function : PartialFunction Domain Codomain) :
    FunctionRelation Domain Codomain :=
  fun input output => ∃ defined : function.DefinedAt input,
    function.value input defined = output

end LRA.Function
