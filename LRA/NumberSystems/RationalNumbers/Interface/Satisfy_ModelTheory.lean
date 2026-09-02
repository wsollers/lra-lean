import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Theory
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

/-- The densely-ordered-field theory carried by any `RationalModel`'s own
signature — generic over every backend, not tied to a specific carrier.

Logical form:

```lean
def genericTheory (M : RationalModel) : Prop :=
  RationalNumbersTheory M.signature
```
-/
def genericTheory (M : RationalModel) : Prop :=
  RationalNumbersTheory M.signature

/-- Every `RationalModel` satisfies `genericTheory` at its own signature:
`M.fieldCert`, `M.orderCert`, `M.strictCert`, `M.addOrderCert`,
`M.mulOrderCert`, and `M.denseCert` already carry the laws
`RationalNumbersTheory` states. -/
theorem satisfiesModelTheory (M : RationalModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
