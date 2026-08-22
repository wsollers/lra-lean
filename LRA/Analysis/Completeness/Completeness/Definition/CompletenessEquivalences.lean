import Mathlib.Data.Set.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition.CauchySequencesConverge

/-!
Order, sequential, and subsequence completeness properties paired against the
least-upper-bound property.

`CauchySequencesConverge` is imported from its own Mathlib-free definition
module and is stated in the project's epsilon/difference language. The other
legacy properties in this file still use Mathlib topology and are tracked for
later migration to the project-native sequence vocabulary.
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
