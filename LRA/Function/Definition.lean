import LRA.Relation.Definition
import LRA.Relation.Properties.Definition

   
                                       

                                                                              
                                                                    
                                                                          
                                                       

                                                         
                                                                                
                                                                        
                                                                                
                                                 

                                                                         
                                                                     
  

namespace LRA

universe u v

                                                                  
abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain

end LRA

namespace LRA.Function

universe u v

                                                                                   
abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain

                                                                                 
abbrev SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.RightUnique relation

                                                                           
abbrev Total {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.LeftTotal relation

                                                                      
def IsFunctionRelation {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  Total relation ∧ SingleValued relation

                                                            
abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier

                                                                          
def Graph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : FunctionRelation Domain Codomain :=
  fun input output => function input = output

end LRA.Function
