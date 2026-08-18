import LRA.Function.Definition
import LRA.Relation.Structures.PartialFunction.Definition

/-!
The partial function, in the working presentation.

A partial function is a domain-of-definition predicate together with a value at
every input where it is defined. The value is a dependent arrow, so evaluation
stays computable and no choice principle is involved.

This is deliberately distinct from `LRA.Relation.PartialFunction`, which bundles
a graph with right-uniqueness. That one is the *relational* presentation and is
the object the relation subject studies; this one is the arrow presentation used
by everything downstream, exactly as §1.2 splits the total case. The two meet
through `Graph` below.
-/

namespace LRA.Function

universe u v

/-- A partial function: a domain of definition, and a value on it. -/
structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain → Prop
  value : ∀ input, DefinedAt input → Codomain

/-- A partial endofunction is a partial function from a carrier to itself. -/
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

/-- The graph relation of a partial function. -/
def PartialGraph {Domain : Type u} {Codomain : Type v}
    (function : PartialFunction Domain Codomain) :
    FunctionRelation Domain Codomain :=
  fun input output => ∃ defined : function.DefinedAt input,
    function.value input defined = output

end LRA.Function
