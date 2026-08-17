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

/-- Point-image membership is equality with the function value. -/
theorem PointImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (input : Domain) (output : Codomain) :
    PointImageClass function input output ↔ output = Value function input := by
  sorry

/-- Fiber membership is exactly the equation `f(input) = output`. -/
theorem FiberClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (output : Codomain) (input : Domain) :
    FiberClass function output input ↔ output = Value function input := by
  sorry

/-- Range membership is existence of an input with the given value. -/
theorem RangeClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (output : Codomain) :
    RangeClass function output ↔
      ∃ input, output = Value function input := by
  sorry

/-- Image membership is existence of a source input with the given value. -/
theorem ImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (source : LRA.Set.SetClass Domain)
    (output : Codomain) :
    ImageClass function source output ↔
      ∃ input, source input ∧ output = Value function input := by
  sorry

/-- Preimage membership means the function value belongs to the target class. -/
theorem PreimageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : RelationalFunction Domain Codomain)
    (target : LRA.Set.SetClass Codomain)
    (input : Domain) :
    PreimageClass function target input ↔
      target (Value function input) := by
  sorry

end LRA.Function
