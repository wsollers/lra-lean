import LRA.Function.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Function

universe u v

/-- A function is a left inverse when it recovers every source value. -/
def LeftInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ input, inverse (function input) = input

/-- A function is a right inverse when every target value is recovered. -/
def RightInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  ∀ output, function (inverse output) = output

/-- A two-sided inverse satisfies both cancellation laws. -/
def TwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain) : Prop :=
  LeftInverse function inverse ∧ RightInverse function inverse

/-- Predicate form of the inverse-function relationship. -/
def IsInverseFunction
    {Domain : Type u} {Codomain : Type v}
    (inverse : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  TwoSidedInverse function inverse

/-- A section is exactly a right inverse. -/
abbrev SectionOf
    {Domain : Type u} {Codomain : Type v}
    (sectionFunction : LRA.Function Codomain Domain)
    (function : LRA.Function Domain Codomain) : Prop :=
  RightInverse function sectionFunction

/-- A retraction is exactly a left inverse of the inclusion-like function. -/
abbrev RetractionOf
    {Small : Type u} {Large : Type v}
    (retraction : LRA.Function Large Small)
    (inclusion : LRA.Function Small Large) : Prop :=
  LeftInverse inclusion retraction

end LRA.Function
