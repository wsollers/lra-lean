import LRA.Function.Calculus.Definition

namespace LRA.Function

universe u v

/-- The selected function value is related to its input by the graph. -/
theorem GraphRelatesValue {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) :
    function.graph input (Value function input) := by
  sorry

/-- A graph output equals the selected value of the function. -/
theorem GraphOutputEqualsValue {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (input : Domain) (output : Codomain)
    (related : function.graph input output) :
    output = Value function input := by
  sorry

/-- Every input belongs to the domain class of a function. -/
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain) (input : Domain) :
    DomainClass function input := by
  sorry

end LRA.Function
