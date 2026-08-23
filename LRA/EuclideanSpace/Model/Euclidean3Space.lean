import LRA.EuclideanSpace.Model.CartesianPlane

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

                                                                             
abbrev R3 (real_model : RealModel) := Rn real_model 3

                                                                      
def ClosedBox (real_model : RealModel)
    (left right front back bottom top : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      front ≤ getY (by decide) point ∧ getY (by decide) point ≤ back ∧
      bottom ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ top }

                                                                    
def Sphere (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

                                                                        
def Ball (real_model : RealModel)
    (center : R3 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R3 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

                                    
def Plane (real_model : RealModel)
    (a b c d : RealCoordinate real_model) : Set (R3 real_model) :=
  { point |
      a * getX (by decide) point +
      b * getY (by decide) point +
      c * getZ (by decide) point = d }

                                                             
def Euclidean3SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 3

end LRA.EuclideanSpace
