import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

universe u

/-!
Coordinatewise point arithmetic on `Rn`. `EuclideanSpace` is explicitly not
a vector space (see this subject's top-level module doc), so these are
concrete tuple operations built directly from the chosen real model's own
`+`/`*`/`-`, not an inherited module structure.
-/

/-- The origin: the point whose every coordinate is `0`. -/
def OriginPoint (real_model : RealModel) (n : ℕ) : Rn real_model n :=
  { coord := fun _ => 0 }

/-- Coordinatewise sum of two points, read as "point plus displacement". -/
def PointAdd {real_model : RealModel} {n : ℕ}
    (p q : Rn real_model n) : Rn real_model n :=
  { coord := fun i => p.coord i + q.coord i }

/-- Coordinatewise difference of two points: the displacement from `q`
to `p`. -/
def PointSub {real_model : RealModel} {n : ℕ}
    (p q : Rn real_model n) : Rn real_model n :=
  { coord := fun i => p.coord i + -(q.coord i) }

/-- Scale every coordinate of a point by `k`. -/
def PointScale {real_model : RealModel} {n : ℕ}
    (k : RealCoordinate real_model) (p : Rn real_model n) : Rn real_model n :=
  { coord := fun i => k * p.coord i }

/-- The dot product of two points, read as coordinate tuples. -/
def dot (real_model : RealModel) {n : ℕ}
    (p q : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i => p.coord i * q.coord i)

/-! ## Statements

Model definitions and statements only; proofs left as `sorry` pending a
dedicated proof-completion pass (see `LRA.EuclideanSpace.ProofsToDo`). -/

theorem PointAdd_comm {real_model : RealModel} {n : ℕ} (p q : Rn real_model n) :
    PointAdd p q = PointAdd q p := by
  sorry

theorem PointAdd_origin {real_model : RealModel} {n : ℕ} (p : Rn real_model n) :
    PointAdd p (OriginPoint real_model n) = p := by
  sorry

theorem PointSub_self {real_model : RealModel} {n : ℕ} (p : Rn real_model n) :
    PointSub p p = OriginPoint real_model n := by
  sorry

/-- Undoing a subtraction by re-adding what was subtracted recovers the
original point. -/
theorem PointAdd_sub_cancel {real_model : RealModel} {n : ℕ}
    (p q : Rn real_model n) : PointAdd (PointSub p q) q = p := by
  sorry

/-- Squared distance is the dot product of a point with itself, applied to
the displacement between the two points. -/
theorem squaredDistance_eq_dot_sub {real_model : RealModel} {n : ℕ}
    (x y : Rn real_model n) :
    squaredDistance real_model x y = dot real_model (PointSub x y) (PointSub x y) := by
  sorry

end LRA.EuclideanSpace
