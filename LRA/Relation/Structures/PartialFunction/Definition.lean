import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

                                                                               
def PartialFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation

                                                       
structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph

                                                                             
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

end LRA.Relation
