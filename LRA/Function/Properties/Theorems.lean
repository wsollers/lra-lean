import LRA.Function.Properties.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

/-- Injectivity is equivalent to every fiber containing at most one input. -/
theorem InjectiveIffFibersSubsingleton
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      ∀ output left right,
        FiberClass function output left →
        FiberClass function output right →
        left = right := by
  sorry

/-- Surjectivity is equivalent to every fiber being nonempty. -/
theorem SurjectiveIffFibersNonempty
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      ∀ output, ∃ input, FiberClass function output input := by
  sorry

/-- A function is injective exactly when its converse graph is single-valued. -/
theorem InjectiveIffConverseSingleValued
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      SingleValued (LRA.Relation.Converse (Graph function)) := by
  sorry

/-- A function is surjective exactly when its converse graph is total. -/
theorem SurjectiveIffConverseTotal
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔
      Total (LRA.Relation.Converse (Graph function)) := by
  sorry

/-- A function is bijective exactly when its converse graph is itself a function relation. -/
theorem BijectiveIffConverseIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Bijective function ↔
      IsFunctionRelation (LRA.Relation.Converse (Graph function)) := by
  sorry

/-- The graph of an arrow is a function relation: total and single-valued.

This is the arrow-level counterpart of the set-theoretic function condition. It
is a theorem here, not a definitional identity: the arrow is the working
presentation, and what a function *is* belongs to `LRA.Function.SetTheoretic`. -/
theorem GraphIsFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    IsFunctionRelation (Graph function) := by
  sorry

/-- LRA injectivity agrees with the standard formulation. -/
theorem InjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔ ∀ left right, function left = function right → left = right := by
  sorry

/-- LRA surjectivity agrees with the standard formulation. -/
theorem SurjectiveIffStandard {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output, ∃ input, function input = output := by
  sorry

/-- A function is surjective exactly when its range class covers the codomain. -/
theorem SurjectiveIffRangeCoversCodomain {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Surjective function ↔ ∀ output : Codomain, RangeClass function output := by
  sorry

end LRA.Function
