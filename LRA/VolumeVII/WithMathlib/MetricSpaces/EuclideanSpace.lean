import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

namespace LRA.VolumeVII.WithMathlib

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
noncomputable def realPlaneEuclideanMetric : Metric (Real × Real) where
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
noncomputable def realPlaneMetricSpace : MetricSpace (Real × Real) where
  metric := realPlaneEuclideanMetric

end LRA.VolumeVII.WithMathlib
