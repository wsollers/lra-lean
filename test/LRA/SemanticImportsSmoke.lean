import LRA.Function
import LRA.Identity
import LRA.Order
import LRA.Analysis.Bounds
import LRA.Analysis.MetricSpaces
import LRA.Analysis.MeasureTheory
import LRA.NumberSystems

/-!
Smoke test: the canonical semantic import routes load together, and the typed
function abbreviation behaves as specified across independent universes.
-/

universe u v

namespace LRA.SemanticImportsSmoke

example : LRA.Function Nat Bool := fun value => value = 0

example (Domain : Type u) (Codomain : Type v) :
    LRA.Function Domain Codomain = (Domain → Codomain) := rfl

example (Domain : Type u) : LRA.Function.Endofunction Domain :=
  fun element => element

end LRA.SemanticImportsSmoke
