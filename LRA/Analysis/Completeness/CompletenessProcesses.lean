import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.MonotoneContinuity
import LRA.Analysis.Completeness.ArchimedeanProperty
import LRA.Analysis.Completeness.AxiomOfCompleteness
import LRA.Analysis.Completeness.NestedIntervalProperty

/-!
Process-level consequences of completeness used before the sequence chapter.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extremal
open LRA.Analysis.Bounds

variable (F : Type*)

/-- Every bounded increasing process has a limiting endpoint.

Logical form:

```lean
def IncreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBound u (Set.range a)) →
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```
-/
def IncreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Monotone a → (∃ u, IsUpperBound u (Set.range a)) →
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

/-- Every bounded decreasing process has a limiting endpoint.

Logical form:

```lean
def DecreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBound l (Set.range a)) →
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```
-/
def DecreasingBoundedProcessesConverge [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, Antitone a → (∃ l, IsLowerBound l (Set.range a)) →
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

/-- The Archimedean reciprocal process tends to zero.

Logical form:

```lean
def ArchimedeanReciprocalProperty : Prop :=
  Filter.Tendsto (fun n : ℕ => 1 / (n : ℝ)) Filter.atTop (nhds 0)
```
-/
def ArchimedeanReciprocalProperty : Prop :=
  Filter.Tendsto (fun n : ℕ => 1 / (n : ℝ)) Filter.atTop (nhds 0)

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, `leastUpperBoundProperty :
HasLeastUpperBoundProperty F`, `a : ℕ → F`, `monotoneHypothesis : Monotone a`, and
`boundedAboveHypothesis : ∃ u, IsUpperBound u (Set.range a)`. Then `∃ L, IsSupremum L (Set.range
a) ∧ Filter.Tendsto a Filter.atTop (nhds L)`.

Logical form:

```lean
theorem IncreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (monotoneHypothesis : Monotone a)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u (Set.range a)) :
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```
-/
theorem IncreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (monotoneHypothesis : Monotone a)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u (Set.range a)) :
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L) := by
  sorry

/-- If `[LinearOrder F]`, `[TopologicalSpace F]`, `[OrderTopology F]`, `leastUpperBoundProperty :
HasLeastUpperBoundProperty F`, `a : ℕ → F`, `antitoneHypothesis : Antitone a`, and
`boundedBelowHypothesis : ∃ l, IsLowerBound l (Set.range a)`. Then `∃ L, IsInfimum L (Set.range
a) ∧ Filter.Tendsto a Filter.atTop (nhds L)`.

Logical form:

```lean
theorem DecreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (antitoneHypothesis : Antitone a)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l (Set.range a)) :
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```
-/
theorem DecreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (antitoneHypothesis : Antitone a)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l (Set.range a)) :
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L) := by
  sorry

/-- If `a b : ℕ → ℝ`, `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis : ∀ n, Set.Icc
(a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`, and `vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀
n ≥ N, b n - a n < ε`. Then `∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧ Filter.Tendsto a Filter.atTop
(nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x)`.

Logical form:

```lean
theorem ShrinkingNestedIntervalProcessHasUniqueLimit
    {a b : ℕ → ℝ}
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      Filter.Tendsto a Filter.atTop (nhds x) ∧
        Filter.Tendsto b Filter.atTop (nhds x)
```
-/
theorem ShrinkingNestedIntervalProcessHasUniqueLimit
    {a b : ℕ → ℝ}
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      Filter.Tendsto a Filter.atTop (nhds x) ∧
        Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- The theorem asserts `ArchimedeanReciprocalProperty`.

Logical form:

```lean
theorem ArchimedeanReciprocalProcessTendsToZero :
    ArchimedeanReciprocalProperty
```
-/
theorem ArchimedeanReciprocalProcessTendsToZero :
    ArchimedeanReciprocalProperty := by
  sorry

end LRA.Analysis.Completeness
