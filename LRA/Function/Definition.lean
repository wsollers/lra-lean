import LRA.Relation.Definition

namespace LRA.Function

universe u v

/-- The underlying heterogeneous relation type used to present a function. -/
abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain

/-- A relation is single-valued when each input is related to at most one output. -/
def SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  ∀ input firstOutput secondOutput,
    relation input firstOutput →
    relation input secondOutput →
    firstOutput = secondOutput

/-- A relation is total when every input is related to some output. -/
def Total {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  ∀ input, ∃ output, relation input output

/-- A function relation is exactly a total, single-valued relation. -/
def IsFunctionRelation {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  Total relation ∧ SingleValued relation

/-- A relational presentation of a function from `Domain` to `Codomain`.

Totality and single-valuedness are constitutive data of functionhood rather
than optional function properties. -/
structure RelationalFunction (Domain : Type u) (Codomain : Type v) where
  graph : FunctionRelation Domain Codomain
  total : Total graph
  singleValued : SingleValued graph

/-- An endofunction is a relational function from a carrier to itself. -/
abbrev Endofunction (Carrier : Type u) := RelationalFunction Carrier Carrier

end LRA.Function
