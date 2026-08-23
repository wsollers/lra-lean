import LRA.Relation.Properties.Definition

   
                                                       

                                                                    
                                                                        
                                                                              
                                                                            
  

namespace LRA.Relation

universe u v

                                                                             
def ProperlyPartial {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation ∧ ¬ LeftTotal relation

                                                                                 
def ProperlyMultivalued {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LeftTotal relation ∧ ¬ RightUnique relation

end LRA.Relation
