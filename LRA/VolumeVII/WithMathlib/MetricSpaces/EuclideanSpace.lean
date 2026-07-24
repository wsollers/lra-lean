import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

namespace LRA.VolumeVII.WithMathlib

/-- The two-dimensional Euclidean coordinate space, using Mathlib's Euclidean
space construction with index type `Fin 2`. -/
abbrev cartesianSpace : Type :=
  EuclideanSpace ℝ (Fin 2)

/-- The origin in two-dimensional Euclidean coordinate space. -/
noncomputable def cartesianOrigin : cartesianSpace :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![0, 0]

/-- The point `(1, 1)` in two-dimensional Euclidean coordinate space. -/
noncomputable def cartesianOneOne : cartesianSpace :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![1, 1]

/-- In `ℝ²` with Mathlib's Euclidean `L²` metric, the distance from `(0, 0)` to
`(1, 1)` is `sqrt 2`. -/
lemma dist_cartesianOrigin_cartesianOneOne :
    dist cartesianOrigin cartesianOneOne = Real.sqrt 2 := by
  rw [EuclideanSpace.dist_eq, Fin.sum_univ_two]
  simp [cartesianOrigin, cartesianOneOne, EuclideanSpace.equiv, Real.dist_eq]
  ring_nf

/-- Convert a point of `ℝ × ℝ` into Mathlib's two-dimensional Euclidean space. -/
noncomputable def toE (p : ℝ × ℝ) : EuclideanSpace ℝ (Fin 2) :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![p.1, p.2]

/-- Our coordinate formula agrees with Mathlib's Euclidean distance after
converting `ℝ × ℝ` into `EuclideanSpace ℝ (Fin 2)`. -/
lemma distance_eq_euclidean (p q : ℝ × ℝ) :
    Real.sqrt ((p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2) = dist (toE p) (toE q) := by
  rw [EuclideanSpace.dist_eq, Fin.sum_univ_two]
  simp [toE, EuclideanSpace.equiv, Real.dist_eq, sq_abs]

/-- The usual Euclidean metric on the real plane. -/
noncomputable def realPlaneScratchEuclideanMetric : ScratchMetric (Real × Real) where
  distance p q :=
    Real.sqrt ((p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2)

  distance_nonnegative := by
    intro p q
    exact Real.sqrt_nonneg _

  distance_eq_zero_iff_equal := by
    intro p q
    constructor
    -- =>
    · intro hypothesis
      have h_nonneg : 0 ≤ (p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2 := by positivity
      rw [Real.sqrt_eq_zero h_nonneg] at hypothesis
      ext
      · have h_sq : (p.1 - q.1) ^ 2 = 0 := by nlinarith
        rwa [sq_eq_zero_iff, sub_eq_zero] at h_sq
      · have h_sq : (p.2 - q.2) ^ 2 = 0 := by nlinarith
        rwa [sq_eq_zero_iff, sub_eq_zero] at h_sq
    -- <=
    · intro hypothesis
      rw [hypothesis]
      ring_nf
      exact Real.sqrt_zero

  distance_symmetric := by
    intro x y
    congr 1
    ring_nf

  distance_triangle := by
    intro x y z
    rw [distance_eq_euclidean, distance_eq_euclidean, distance_eq_euclidean]
    exact dist_triangle (toE x) (toE y) (toE z)

/-- The real plane equipped with the usual Euclidean metric. -/
noncomputable def realPlaneScratchMetricSpace : ScratchMetricSpace (Real × Real) where
  metric := realPlaneScratchEuclideanMetric

end LRA.VolumeVII.WithMathlib
