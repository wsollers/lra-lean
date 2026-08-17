import LRA.Function.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

/-- A typed function is a left inverse when it recovers every source value. -/
def LeftInverseTyped
    {Domain : Type u} {Codomain : Type v}
    (function : TypedFunction Domain Codomain)
    (inverse : TypedFunction Codomain Domain) : Prop :=
  ∀ input, inverse (function input) = input

/-- A typed function is a right inverse when every target value is recovered. -/
def RightInverseTyped
    {Domain : Type u} {Codomain : Type v}
    (function : TypedFunction Domain Codomain)
    (inverse : TypedFunction Codomain Domain) : Prop :=
  ∀ output, function (inverse output) = output

/-- A two-sided inverse satisfies both cancellation laws. -/
def TwoSidedInverseTyped
    {Domain : Type u} {Codomain : Type v}
    (function : TypedFunction Domain Codomain)
    (inverse : TypedFunction Codomain Domain) : Prop :=
  LeftInverseTyped function inverse ∧ RightInverseTyped function inverse

/-- Predicate form of the inverse-function relationship. -/
def IsInverseTypedFunction
    {Domain : Type u} {Codomain : Type v}
    (inverse : TypedFunction Codomain Domain)
    (function : TypedFunction Domain Codomain) : Prop :=
  TwoSidedInverseTyped function inverse

/-- A section is exactly a right inverse. -/
abbrev SectionOfTyped
    {Domain : Type u} {Codomain : Type v}
    (sectionFunction : TypedFunction Codomain Domain)
    (function : TypedFunction Domain Codomain) : Prop :=
  RightInverseTyped function sectionFunction

/-- A retraction is exactly a left inverse of the inclusion-like map. -/
abbrev RetractionOfTyped
    {Small : Type u} {Large : Type v}
    (retraction : TypedFunction Large Small)
    (inclusion : TypedFunction Small Large) : Prop :=
  LeftInverseTyped inclusion retraction

/-- The inverse of a bijective relational function, presented by the converse graph relation. -/
def Inverse
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (_bijective : Bijective function) :
    RelationalFunction Codomain Domain where
  graph := LRA.Relation.Converse function.graph
  total := by
    sorry
  singleValued := by
    sorry

end LRA.Function
