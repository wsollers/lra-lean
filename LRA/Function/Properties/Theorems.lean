import LRA.Function.Properties.Definition
import LRA.Function.Calculus.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

/-- Injectivity is equivalent to every fiber containing at most one input. -/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Injective function ↔
      ∀ output left right,
        FiberClass function output left →
        FiberClass function output right →
        left = right := by
  sorry

/-- Surjectivity is equivalent to every fiber being nonempty. -/
theorem SurjectiveIffFibersNonempty
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Surjective function ↔
      ∀ output, ∃ input, FiberClass function output input := by
  sorry

/-- A function is injective exactly when its converse graph is single-valued. -/
theorem InjectiveIffConverseSingleValued
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Injective function ↔
      SingleValued (LRA.Relation.Converse function.graph) := by
  sorry

/-- A function is surjective exactly when its converse graph is total. -/
theorem SurjectiveIffConverseTotal
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Surjective function ↔
      Total (LRA.Relation.Converse function.graph) := by
  sorry

/-- A function is bijective exactly when its converse graph is itself a function relation. -/
theorem BijectiveIffConverseIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) :
    Bijective function ↔
      IsFunctionRelation (LRA.Relation.Converse function.graph) := by
  sorry

end LRA.Function
