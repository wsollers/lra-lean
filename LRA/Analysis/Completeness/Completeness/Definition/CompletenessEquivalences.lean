import Mathlib.Data.Set.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.Bounds.Extrema.SupremaInfima

/-!
Order, sequential, and subsequence completeness characterizations paired
against the least-upper-bound property.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/-- A preorder has the greatest-lower-bound property when every nonempty bounded-below set has an infimum.

Logical form:

```lean
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A
```
-/
def HasGreatestLowerBoundProperty [Preorder F] : Prop :=
  ∀ A : Set F, A.Nonempty → (∃ l, IsLowerBound l A) → ∃ i, IsInfimum i A

/-- Every Cauchy sequence converges.

Logical form:

```lean
def CauchySequencesConverge [UniformSpace F] : Prop :=
  ∀ a : ℕ → F, CauchySeq a → ∃ L, Filter.Tendsto a Filter.atTop (nhds L)
```
-/
def CauchySequencesConverge [UniformSpace F] : Prop :=
  ∀ a : ℕ → F, CauchySeq a → ∃ L, Filter.Tendsto a Filter.atTop (nhds L)

/-- Every bounded sequence has a convergent subsequence.

Logical form:

```lean
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)
```
-/
def BolzanoWeierstrassProperty [Preorder F] [TopologicalSpace F] : Prop :=
  ∀ a : ℕ → F, (∃ u, IsUpperBound u (Set.range a)) →
    (∃ l, IsLowerBound l (Set.range a)) →
      ∃ indexMap : ℕ → ℕ,
        StrictMono indexMap ∧ ∃ L, Filter.Tendsto (a ∘ indexMap) Filter.atTop (nhds L)

end LRA.Analysis.Completeness
