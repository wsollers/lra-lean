import LRA.Function.Operations.Composition.Definition
import LRA.Function.Calculus.Definition

namespace LRA.Function

universe u v w

/-- Evaluation of a composite agrees with successive evaluation. -/
theorem ComposeValue
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    (rightFunction : RelationalFunction Beta Gamma)
    (leftFunction : RelationalFunction Alpha Beta)
    (input : Alpha) :
    Value (Compose rightFunction leftFunction) input =
      Value rightFunction (Value leftFunction input) := by
  sorry

end LRA.Function
