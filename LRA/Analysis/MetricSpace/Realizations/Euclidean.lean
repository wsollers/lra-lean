import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.MetricSpace.Definition.MetricSpace
import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.Analysis.MetricSpace

open LRA.NumberSystems.Models
open LRA.EuclideanSpace

universe u

/-!
Euclidean realization of the metric-space interface.

This file packages the tuple-based Euclidean carrier `Rn` with a named metric,
separating the concrete Euclidean backend from the generic metric-space
interface.
-/

/-- The `n`-dimensional Euclidean tuple carrier specialized to Mathlib's
`ℝ`-backed real model, so its coordinates land in actual Lean reals. -/
abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n

/-- Read a model Euclidean point as its coordinate function `Fin n → ℝ`. -/
abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord

/-- Extensionality for the `mathlibRealModel` Euclidean tuple carrier. -/
theorem mathlibRn_ext {n : ℕ} {x y : MathlibRn n}
    (h : ∀ i : Fin n, coordinates x i = coordinates y i) : x = y := by
  cases x with
  | mk xcoord =>
    cases y with
    | mk ycoord =>
      have hfun : xcoord = ycoord := funext h
      cases hfun
      rfl

/-- The metric on `MathlibRn n` inherited from the ambient Mathlib metric
on the coordinate function space `Fin n → ℝ`. -/
noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition mathlibRealModel (MathlibRn n) where
  distance x y := dist (coordinates x) (coordinates y)
  positive x y := by
    constructor
    · exact dist_nonneg
    · constructor
      · intro hxy
        apply mathlibRn_ext
        exact fun i => by
          exact congrFun (dist_eq_zero.mp hxy) i
      · intro hxy
        cases hxy
        exact dist_self (coordinates x)
  symmetric x y := dist_comm (coordinates x) (coordinates y)
  triangle x y z := dist_triangle (coordinates x) (coordinates y) (coordinates z)

/-- The metric-space definition obtained by appending the Euclidean metric
to the carrier `Rn mathlibRealModel n`. -/
noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition mathlibRealModel where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n

/-- A metric-space realization that extends the tuple-based Euclidean `Rn`
carrier by adding a metric, while keeping the original Euclidean
`L_geom`-structure visible as its base. -/
structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    extends MetricSpaceDefinition real_model where
  euclideanStructure : TarskiStructure := EuclideanTupleModel real_model n
  carrier_eq : Carrier = euclideanStructure.Domain

/-- Package any metric on the tuple carrier `Rn real_model n` as a metric-space
realization extending the base Euclidean tuple model. -/
def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition real_model (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  Carrier := Rn real_model n
  metric := metric
  carrier_eq := rfl

/-- The canonical metric-space realization of the tuple-based Euclidean
carrier in the Mathlib-real specialization. -/
noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n
  carrier_eq := rfl

end LRA.Analysis.MetricSpace
