import LRA.EuclideanSpace.Model.RealLine

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

/-- The two-dimensional coordinate plane over a chosen real model. -/
abbrev R2 (real_model : RealModel) := Rn real_model 2

/-- The closed rectangle `[left, right] × [bottom, top]`. -/
def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }

/-- The open rectangle `(left, right) × (bottom, top)`. -/
def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }

/-- The circle of radius-squared `radiusSq` centered at `center`. -/
def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

/-- The disk of radius-squared `radiusSq` centered at `center`. -/
def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

/-- The graph of a unary scalar function in the coordinate plane. -/
def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }

/-- The first-order `L_geom` model carried by the Cartesian plane. -/
def CartesianPlaneModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2

end LRA.EuclideanSpace
