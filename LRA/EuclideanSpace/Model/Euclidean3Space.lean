import LRA.EuclideanSpace.Model.CartesianPlane

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

/-- Three-dimensional Euclidean coordinate space over a chosen real model. -/
abbrev R3 (real_model : RealModel) := Rn real_model 3

/-- The closed box `[left, right] × [front, back] × [bottom, top]`. -/
def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }

/-- The sphere of radius-squared `radiusSq` centered at `center`. -/
def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

/-- The solid ball of radius-squared `radiusSq` centered at `center`. -/
def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

/-- The plane `ax + by + cz = d`. -/
def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }

/-- The first-order `L_geom` model carried by three-space. -/
def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

end LRA.EuclideanSpace
