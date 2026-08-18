import LRA.Function.Operations.Composition.Definition

namespace LRA.Function

universe u v w

/-- Evaluation of a composite agrees with successive evaluation. -/
theorem ComposeValue
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) :
    Compose outer inner input = outer (inner input) := by
  sorry

end LRA.Function
