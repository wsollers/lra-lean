import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Bounds.Extrema.SupremaInfima

/-!
Process-level completeness characterizations: bounded monotone sequence
convergence, and the Archimedean reciprocal property.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
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

end LRA.Analysis.Completeness
