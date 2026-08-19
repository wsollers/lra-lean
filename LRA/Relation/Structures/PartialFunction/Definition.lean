import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

/-- A partial-function relation is right-unique, but need not be left-total. -/
def PartialFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation

/-- A relational presentation of a partial function. -/
structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph

/-- A partial endofunction is a partial function from a carrier to itself. -/
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

end LRA.Relation
