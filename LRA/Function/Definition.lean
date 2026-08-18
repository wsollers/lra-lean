import LRA.Relation.Definition
import LRA.Relation.Properties.Definition

/-!
The working presentation of a function.

To every subject outside `LRA.Function.SetTheoretic`, a function *is* an arrow
`Domain → Codomain`. That arrow is deliberately not definitionally a
set-theoretic triple: it is computable, it carries no proof fields, and it
composes with Lean core and Mathlib without conversion.

What a function *is* set-theoretically is the business of
`LRA.Function.SetTheoretic`, which owns the relation and function triples, their
conditions, and their bundles. The two presentations meet at exactly one
theorem, `LRA.Function.SetTheoretic.TypedFunctionGraphRepresentation`. There are
no coercions, no instances, and no second bridge.

`Graph` is the one-way reading of an arrow as a relation, and is how this
subject inherits the `LRA.Relation` calculus instead of restating it.
-/

namespace LRA

universe u v

/-- A function from `Domain` to `Codomain` is the arrow itself. -/
abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain

end LRA

namespace LRA.Function

universe u v

/-- The underlying heterogeneous relation type used to present a function graph. -/
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

/-- An endofunction is an arrow from a carrier to itself. -/
abbrev Endofunction (Carrier : Type u) := LRA.Function Carrier Carrier

/-- The graph relation of an arrow: it relates each input to its value. -/
def Graph {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : FunctionRelation Domain Codomain :=
  fun input output => function input = output

end LRA.Function
