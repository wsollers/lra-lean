import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.NestedIntervalProperty

/-!
Hub-and-spoke equivalences with `HasLeastUpperBoundProperty` as the hub.
Each spoke pairs the least-upper-bound property against another genuine
completeness characterization; the TFAE theorems at the end chain them into
the completeness equivalence currently justified by the displayed structure.

Two properties are intentionally excluded from the equivalence list:

- reciprocal convergence is an Archimedean consequence, not a completeness
  characterization (the rationals are the standard counterexample);
- Cauchy-sequence convergence is now stated in project-native epsilon form, but
  its relationship to order completeness belongs in a separate theorem over an
  explicitly certified ordered-field setting rather than through an arbitrary
  Mathlib uniformity.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/-- Least-upper-bound and greatest-lower-bound completeness are equivalent in
an Archimedean ordered field with its order topology.

Logical form:

```lean
theorem HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F
```
-/
theorem HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F := by
  sorry

/-- Least-upper-bound completeness is equivalent to the nested interval
property in the displayed ordered-field setting.

Logical form:

```lean
theorem HasLeastUpperBoundPropertyIffNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F
```
-/
theorem HasLeastUpperBoundPropertyIffNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F := by
  sorry

/-- Least-upper-bound completeness is equivalent to the Bolzano-Weierstrass
property in the displayed ordered-field setting.

Logical form:

```lean
theorem HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F
```
-/
theorem HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F := by
  sorry

/-- Least-upper-bound completeness and convergence of bounded monotone
processes are equivalent in the displayed ordered-field setting.

Logical form:

```lean
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE
```
-/
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE := by
  sorry

/-- Least-upper-bound completeness and the nested interval property are
logically equivalent in the displayed ordered-field setting.

Logical form:

```lean
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE
```
-/
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE := by
  sorry

/-- The standard completeness characterizations currently asserted by this
module, excluding reciprocal convergence and Cauchy convergence.

Logical form:

```lean
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      BolzanoWeierstrassProperty F].TFAE
```
-/
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      BolzanoWeierstrassProperty F].TFAE := by
  sorry

end LRA.Analysis.Completeness
