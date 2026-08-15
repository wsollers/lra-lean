import LRA.Function
import LRA.Identity
import LRA.Order
import LRA.Analysis.Bounds
import LRA.Analysis.MetricSpaces
import LRA.Analysis.MeasureTheory
import LRA.NumberSystems

universe u v

namespace LRA.SemanticImportsSmoke

example : LRA.Function Nat Bool := fun value => value = 0

example (Domain : Type u) (Codomain : Type v) :
    LRA.Function Domain Codomain = (Domain → Codomain) := rfl

end LRA.SemanticImportsSmoke
