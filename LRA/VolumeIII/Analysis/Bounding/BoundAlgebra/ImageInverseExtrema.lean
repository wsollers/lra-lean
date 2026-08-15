import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Extrema of monotone continuous images and inverse images.
-/

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extremal
open LRA.Analysis.Bounds

/-- Let `I A : Set ℝ` and `s : ℝ`. If `setContainedInDomain : A ⊆ I`, `nonemptyHypothesis :
A.Nonempty`, `supremumHypothesis : IsSupremum s A`, `supremumInDomain : s ∈ I`, `f : ℝ → ℝ`,
`monotoneHypothesis : MonotoneOn f I`, and `continuityHypothesis : ContinuousWithinAt f I s`.
Then `IsSupremum (f s) (f '' A)`.

Logical form:

```lean
theorem IncreasingImagePreservesSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsSupremum (f s) (f '' A)
```
-/
theorem IncreasingImagePreservesSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsSupremum (f s) (f '' A) := by
  sorry

/-- Let `I A : Set ℝ` and `i : ℝ`. If `setContainedInDomain : A ⊆ I`, `nonemptyHypothesis :
A.Nonempty`, `infimumHypothesis : IsInfimum i A`, `infimumInDomain : i ∈ I`, `f : ℝ → ℝ`,
`monotoneHypothesis : MonotoneOn f I`, and `continuityHypothesis : ContinuousWithinAt f I i`.
Then `IsInfimum (f i) (f '' A)`.

Logical form:

```lean
theorem IncreasingImagePreservesInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsInfimum (f i) (f '' A)
```
-/
theorem IncreasingImagePreservesInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (monotoneHypothesis : MonotoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsInfimum (f i) (f '' A) := by
  sorry

/-- Let `I A : Set ℝ` and `i : ℝ`. If `setContainedInDomain : A ⊆ I`, `nonemptyHypothesis :
A.Nonempty`, `infimumHypothesis : IsInfimum i A`, `infimumInDomain : i ∈ I`, `f : ℝ → ℝ`,
`antitoneHypothesis : AntitoneOn f I`, and `continuityHypothesis : ContinuousWithinAt f I i`.
Then `IsSupremum (f i) (f '' A)`.

Logical form:

```lean
theorem DecreasingImageSendsInfimaToSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsSupremum (f i) (f '' A)
```
-/
theorem DecreasingImageSendsInfimaToSuprema {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {i : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (infimumInDomain : i ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I i) :
    IsSupremum (f i) (f '' A) := by
  sorry

/-- Let `I A : Set ℝ` and `s : ℝ`. If `setContainedInDomain : A ⊆ I`, `nonemptyHypothesis :
A.Nonempty`, `supremumHypothesis : IsSupremum s A`, `supremumInDomain : s ∈ I`, `f : ℝ → ℝ`,
`antitoneHypothesis : AntitoneOn f I`, and `continuityHypothesis : ContinuousWithinAt f I s`.
Then `IsInfimum (f s) (f '' A)`.

Logical form:

```lean
theorem DecreasingImageSendsSupremaToInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsInfimum (f s) (f '' A)
```
-/
theorem DecreasingImageSendsSupremaToInfima {I A : Set ℝ}
    (setContainedInDomain : A ⊆ I)
    (nonemptyHypothesis : A.Nonempty)
    {s : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (supremumInDomain : s ∈ I)
    {f : ℝ → ℝ}
    (antitoneHypothesis : AntitoneOn f I)
    (continuityHypothesis : ContinuousWithinAt f I s) :
    IsInfimum (f s) (f '' A) := by
  sorry

/-- Let `I J B : Set ℝ` and `u : ℝ`. If `f g : ℝ → ℝ`, `bijectionHypothesis : Set.BijOn f I J`,
`inverseHypothesis : Set.InvOn g f I J`, `setContainedInCodomain : B ⊆ J`, `nonemptyHypothesis :
B.Nonempty`, `supremumHypothesis : IsSupremum u B`, `supremumInCodomain : u ∈ J`,
`inverseMonotoneHypothesis : MonotoneOn g J`, and `inverseContinuityHypothesis :
ContinuousWithinAt g J u`. Then `IsSupremum (g u) (g '' B)`.

Logical form:

```lean
theorem IncreasingInversePreservesSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsSupremum (g u) (g '' B)
```
-/
theorem IncreasingInversePreservesSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsSupremum (g u) (g '' B) := by
  sorry

/-- Let `I J B : Set ℝ` and `v : ℝ`. If `f g : ℝ → ℝ`, `bijectionHypothesis : Set.BijOn f I J`,
`inverseHypothesis : Set.InvOn g f I J`, `setContainedInCodomain : B ⊆ J`, `nonemptyHypothesis :
B.Nonempty`, `infimumHypothesis : IsInfimum v B`, `infimumInCodomain : v ∈ J`,
`inverseMonotoneHypothesis : MonotoneOn g J`, and `inverseContinuityHypothesis :
ContinuousWithinAt g J v`. Then `IsInfimum (g v) (g '' B)`.

Logical form:

```lean
theorem IncreasingInversePreservesInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsInfimum (g v) (g '' B)
```
-/
theorem IncreasingInversePreservesInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseMonotoneHypothesis : MonotoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsInfimum (g v) (g '' B) := by
  sorry

/-- Let `I J B : Set ℝ` and `v : ℝ`. If `f g : ℝ → ℝ`, `bijectionHypothesis : Set.BijOn f I J`,
`inverseHypothesis : Set.InvOn g f I J`, `setContainedInCodomain : B ⊆ J`, `nonemptyHypothesis :
B.Nonempty`, `infimumHypothesis : IsInfimum v B`, `infimumInCodomain : v ∈ J`,
`inverseAntitoneHypothesis : AntitoneOn g J`, and `inverseContinuityHypothesis :
ContinuousWithinAt g J v`. Then `IsSupremum (g v) (g '' B)`.

Logical form:

```lean
theorem DecreasingInverseSendsInfimaToSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsSupremum (g v) (g '' B)
```
-/
theorem DecreasingInverseSendsInfimaToSuprema {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {v : ℝ}
    (infimumHypothesis : IsInfimum v B)
    (infimumInCodomain : v ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J v) :
    IsSupremum (g v) (g '' B) := by
  sorry

/-- Let `I J B : Set ℝ` and `u : ℝ`. If `f g : ℝ → ℝ`, `bijectionHypothesis : Set.BijOn f I J`,
`inverseHypothesis : Set.InvOn g f I J`, `setContainedInCodomain : B ⊆ J`, `nonemptyHypothesis :
B.Nonempty`, `supremumHypothesis : IsSupremum u B`, `supremumInCodomain : u ∈ J`,
`inverseAntitoneHypothesis : AntitoneOn g J`, and `inverseContinuityHypothesis :
ContinuousWithinAt g J u`. Then `IsInfimum (g u) (g '' B)`.

Logical form:

```lean
theorem DecreasingInverseSendsSupremaToInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsInfimum (g u) (g '' B)
```
-/
theorem DecreasingInverseSendsSupremaToInfima {I J B : Set ℝ}
    {f g : ℝ → ℝ}
    (bijectionHypothesis : Set.BijOn f I J)
    (inverseHypothesis : Set.InvOn g f I J)
    (setContainedInCodomain : B ⊆ J)
    (nonemptyHypothesis : B.Nonempty)
    {u : ℝ}
    (supremumHypothesis : IsSupremum u B)
    (supremumInCodomain : u ∈ J)
    (inverseAntitoneHypothesis : AntitoneOn g J)
    (inverseContinuityHypothesis : ContinuousWithinAt g J u) :
    IsInfimum (g u) (g '' B) := by
  sorry

end LRA.Analysis.Bounds.Algebra
