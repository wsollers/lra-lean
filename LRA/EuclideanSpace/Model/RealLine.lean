import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

/-- The one-dimensional coordinate model over a chosen real model. -/
abbrev R1 (real_model : RealModel) := Rn real_model 1

/-- The first coordinate of a point on the model real line. -/
def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩

/-- The open interval `(a, b)` in the model real line. -/
def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }

/-- The closed interval `[a, b]` in the model real line. -/
def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }

/-- The right-open ray `(a, ∞)` in the model real line. -/
def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }

/-- The left-open ray `(-∞, b)` in the model real line. -/
def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }

/-- The first-order `L_geom` model carried by the model real line. -/
def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1

end LRA.EuclideanSpace
