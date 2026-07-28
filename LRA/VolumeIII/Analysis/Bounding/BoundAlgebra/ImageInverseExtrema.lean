import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Extrema of monotone continuous images and inverse images.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- Increasing continuous images preserve suprema. -/
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

/-- Increasing continuous images preserve infima. -/
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

/-- Decreasing continuous images send infima to suprema. -/
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

/-- Decreasing continuous images send suprema to infima. -/
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

/-- Increasing continuous inverse images preserve suprema. -/
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

/-- Increasing continuous inverse images preserve infima. -/
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

/-- Decreasing continuous inverse images send infima to suprema. -/
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

/-- Decreasing continuous inverse images send suprema to infima. -/
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

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
