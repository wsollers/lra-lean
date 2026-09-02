import LRA.NumberSystems.Integers.Interface.ModelTheory.Theory
import LRA.NumberSystems.Integers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

/-- The discretely-ordered-integral-domain theory carried by any
`IntegerModel`'s own signature — generic over every backend, not tied to a
specific carrier.

Logical form:

```lean
def genericTheory (M : IntegerModel) : Prop :=
  IntegersTheory M.signature
```
-/
def genericTheory (M : IntegerModel) : Prop :=
  IntegersTheory M.signature

/-- Every `IntegerModel` satisfies `genericTheory` at its own signature:
`M.domainCert`, `M.orderCert`, `M.strictCert`, `M.addOrderCert`,
`M.mulOrderCert`, and `M.discreteCert` already carry the laws
`IntegersTheory` states. -/
theorem satisfiesModelTheory (M : IntegerModel) : genericTheory M := by
  sorry
end LRA.NumberSystems.Integers.Interface.ModelTheory
