import LRA.Function.Calculus.Classes.Definition

/-!
Evaluation of a function is application of the arrow. There is nothing to
define, so this concept owns theorems only: each one relates an application
`function input` to the class calculus inherited from `LRA.Relation`.
-/

namespace LRA.Function

universe u v

/-- The graph relates every input to its value. -/
theorem GraphRelatesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    Graph function input (function input) := by
  sorry

/-- A graph output equals the value of the function at that input. -/
theorem GraphOutputEqualsValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain)
    (related : Graph function input output) :
    output = function input := by
  sorry

/-- Point-image membership is equality with the function value. -/
theorem PointImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (input : Domain) (output : Codomain) :
    PointImageClass function input output ↔ output = function input := by
  sorry

/-- Fiber membership is exactly the equation `function input = output`. -/
theorem FiberClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) (input : Domain) :
    FiberClass function output input ↔ output = function input := by
  sorry

/-- Range membership is existence of an input with the given value. -/
theorem RangeClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (output : Codomain) :
    RangeClass function output ↔
      ∃ input, output = function input := by
  sorry

/-- Image membership is existence of a source input with the given value. -/
theorem ImageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : LRA.Set.SetClass Domain)
    (output : Codomain) :
    ImageClass function source output ↔
      ∃ input, source input ∧ output = function input := by
  sorry

/-- Preimage membership means the function value belongs to the target class. -/
theorem PreimageClassIffValue
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : LRA.Set.SetClass Codomain)
    (input : Domain) :
    PreimageClass function target input ↔
      target (function input) := by
  sorry

end LRA.Function
