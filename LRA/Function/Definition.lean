import LRA.Relation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Function

universe u v

/-- The underlying heterogeneous relation type used to present a function. -/
abbrev FunctionRelation (Domain : Type u) (Codomain : Type v) :=
  LRA.Relation.HeterogeneousBinaryRelation Domain Codomain

/-- Function-level spelling of right-uniqueness: one output at most per input. -/
abbrev SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.RightUnique relation

/-- Function-level spelling of left-totality: every input has an output. -/
abbrev Total {Domain : Type u} {Codomain : Type v}
    (relation : FunctionRelation Domain Codomain) : Prop :=
  LRA.Relation.LeftTotal relation

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

/-- Ordinary Lean functions are the typed presentation of function values. -/
abbrev TypedFunction (Domain : Type u) (Codomain : Type v) := Domain → Codomain

/-- The graph relation associated with an ordinary typed function. -/
def Graph {Domain : Type u} {Codomain : Type v}
    (function : TypedFunction Domain Codomain) : FunctionRelation Domain Codomain :=
  fun input output => function input = output

/-- Regard an ordinary typed function as a relational function.

The proof fields are intentionally left to the learner. -/
def OfTypedFunction {Domain : Type u} {Codomain : Type v}
    (function : TypedFunction Domain Codomain) : RelationalFunction Domain Codomain where
  graph := Graph function
  total := by
    sorry
  singleValued := by
    sorry

end LRA.Function
