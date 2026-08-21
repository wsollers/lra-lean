import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

/-!
Directional implications between the least-upper-bound property and
bounded monotone process convergence.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, and `leastUpperBoundProperty
: HasLeastUpperBoundProperty F`. Then `IncreasingBoundedProcessesConverge F`.

Logical form:

```lean
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F
```
-/
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F := by
  sorry

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, and `leastUpperBoundProperty
: HasLeastUpperBoundProperty F`. Then `DecreasingBoundedProcessesConverge F`.

Logical form:

```lean
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F
```
-/
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, `[OrderTopology F]`, and `monotoneProcessConvergenceHypothesis :
IncreasingBoundedProcessesConverge F`. Then `HasLeastUpperBoundProperty F`.

Logical form:

```lean
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F
```
-/
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F := by
  sorry

end LRA.Analysis.Completeness
