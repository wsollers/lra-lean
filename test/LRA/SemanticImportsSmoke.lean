import LRA.VolumeI.Map
import LRA.Identity
import LRA.Order
import LRA.Analysis.Bounds
import LRA.Analysis.MetricSpaces
import LRA.Analysis.MeasureTheory
import LRA.NumberSystems

universe u v

namespace LRA.SemanticImportsSmoke

example : LRA.Map.Typed.TypedMap Nat Bool := fun value => value = 0

example (Domain : Type u) (Codomain : Type v) :
    LRA.Map.Typed.TypedMap Domain Codomain = (Domain → Codomain) := rfl

end LRA.SemanticImportsSmoke
