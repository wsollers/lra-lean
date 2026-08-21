import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.NestedIntervalProperty

/-!
Hub-and-spoke equivalences with `HasLeastUpperBoundProperty` as the hub.
Each spoke pairs the least-upper-bound property against one of the other
standard completeness characterizations; the TFAE theorems at the end chain
them into the full completeness equivalence.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `HasLeastUpperBoundProperty F ↔
HasGreatestLowerBoundProperty F`.

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

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `HasLeastUpperBoundProperty F ↔
NestedIntervalProperty F`.

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

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `HasLeastUpperBoundProperty F ↔
ArchimedeanReciprocalProperty`.

Logical form:

```lean
theorem HasLeastUpperBoundPropertyIffArchimedeanReciprocalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ ArchimedeanReciprocalProperty
```
-/
theorem HasLeastUpperBoundPropertyIffArchimedeanReciprocalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ ArchimedeanReciprocalProperty := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[UniformSpace F]`, and `[OrderTopology F]`. Then `HasLeastUpperBoundProperty F ↔
CauchySequencesConverge F`.

Logical form:

```lean
theorem HasLeastUpperBoundPropertyIffCauchySequencesConverge
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [UniformSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ CauchySequencesConverge F
```
-/
theorem HasLeastUpperBoundPropertyIffCauchySequencesConverge
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [UniformSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ CauchySequencesConverge F := by
  sorry

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `HasLeastUpperBoundProperty F ↔
BolzanoWeierstrassProperty F`.

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

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F,
IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F].TFAE`.

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

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`,
`[TopologicalSpace F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F,
NestedIntervalProperty F].TFAE`.

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

/-- If `[Field F]`, `[LinearOrder F]`, `[IsStrictOrderedRing F]`, `[Archimedean F]`, `[UniformSpace
F]`, and `[OrderTopology F]`. Then `[HasLeastUpperBoundProperty F, HasGreatestLowerBoundProperty
F, IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F,
NestedIntervalProperty F, ArchimedeanReciprocalProperty, CauchySequencesConverge F,
BolzanoWeierstrassProperty F].TFAE`.

Logical form:

```lean
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [UniformSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      ArchimedeanReciprocalProperty,
      CauchySequencesConverge F,
      BolzanoWeierstrassProperty F].TFAE
```
-/
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [UniformSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      ArchimedeanReciprocalProperty,
      CauchySequencesConverge F,
      BolzanoWeierstrassProperty F].TFAE := by
  sorry

end LRA.Analysis.Completeness
