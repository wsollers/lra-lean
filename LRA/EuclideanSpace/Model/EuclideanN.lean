import LRA.NumberSystems.RealNumbers.ConstructionModels
import LRA.EuclideanSpace.Interface.ModelTheory.Model
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

universe u

/-!
The model-first Euclidean carrier: ordered tuples over an arbitrary
`RealModel`. This is the analytic-geometry playground before the later
metric/topological/normed vocabulary is emphasized.
-/

/-- The scalar carrier supplied by a chosen real model. -/
abbrev RealCoordinate (real_model : RealModel) : Type u := real_model.Carrier

/-- A point of `n`-dimensional Euclidean space over a chosen real model,
stored as an ordered tuple of coordinates. -/
structure EuclideanPoint (real_model : RealModel) (n : ℕ) where
  coord : Fin n → RealCoordinate real_model

/-- Generic `n`-space over the chosen real model. -/
abbrev Rn (real_model : RealModel) (n : ℕ) := EuclideanPoint real_model n

/-- The first coordinate of a tuple, available in every nonempty dimension. -/
def getX {real_model : RealModel} {n : ℕ} (hn : 1 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨0, Nat.lt_of_lt_of_le (by decide) hn⟩

/-- The second coordinate of a tuple, available from dimension 2 onward. -/
def getY {real_model : RealModel} {n : ℕ} (hn : 2 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨1, Nat.lt_of_lt_of_le (by decide) hn⟩

/-- The third coordinate of a tuple, available from dimension 3 onward. -/
def getZ {real_model : RealModel} {n : ℕ} (hn : 3 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨2, Nat.lt_of_lt_of_le (by decide) hn⟩

/-- The fourth coordinate of a tuple, available from dimension 4 onward. -/
def getW {real_model : RealModel} {n : ℕ} (hn : 4 ≤ n)
    (point : Rn real_model n) : RealCoordinate real_model :=
  point.coord ⟨3, Nat.lt_of_lt_of_le (by decide) hn⟩

/-- Sum a finite tuple without asking for the full Mathlib additive
hierarchy on the carrier. -/
def sumFin {n : ℕ} {R : Type u} [Add R] [OfNat R 0] (f : Fin n → R) : R :=
  match n with
  | 0 => 0
  | m + 1 => f (Fin.last m) + sumFin (fun i => f (Fin.castSucc i))

instance (real_model : RealModel) (n : ℕ) : Nonempty (Rn real_model n) :=
  ⟨{ coord := fun _ => 0 }⟩

/-- Coordinatewise affine betweenness on ordered tuples. -/
instance (real_model : RealModel) (n : ℕ) : Between (Rn real_model n) where
  between x y z :=
    ∃ t : RealCoordinate real_model, 0 ≤ t ∧ t ≤ 1 ∧
      ∀ i : Fin n, y.coord i = (1 + -t) * x.coord i + t * z.coord i

/-- Squared Euclidean distance, defined without an explicit square root. -/
def squaredDistance (real_model : RealModel) {n : ℕ}
    (x y : Rn real_model n) : RealCoordinate real_model :=
  sumFin (fun i =>
    let delta := x.coord i + -(y.coord i)
    delta * delta)

/-- Segment congruence as equality of squared distances. -/
instance (real_model : RealModel) (n : ℕ) : Congruent (Rn real_model n) where
  congruent x y z w :=
    squaredDistance real_model x y = squaredDistance real_model z w

/-- Register the generic ordered-tuple carrier as an `L_geom` model. -/
def EuclideanTupleModel (real_model : RealModel) (n : ℕ) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  BuildTarskiModel
    (Point := Rn real_model n)
    (between := fun x y z => between x y z)
    (congruent := fun x y z w => congruent x y z w)

end LRA.EuclideanSpace
