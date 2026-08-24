import LRA.EuclideanSpace.Model.RealLine

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

                                                                     
abbrev R2 (real_model : RealModel) := Rn real_model 2

                                                            
def ClosedRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left ≤ getX (by decide) point ∧ getX (by decide) point ≤ right ∧
      bottom ≤ getY (by decide) point ∧ getY (by decide) point ≤ top }

                                                          
def OpenRectangle (real_model : RealModel)
    (left right bottom top : RealCoordinate real_model) : Set (R2 real_model) :=
  { point |
      left < getX (by decide) point ∧ getX (by decide) point < right ∧
      bottom < getY (by decide) point ∧ getY (by decide) point < top }

                                                                    
def Circle (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

                                                                  
def Disk (real_model : RealModel)
    (center : R2 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | squaredDistance real_model point center ≤ radiusSq }

                                                                    
def GraphOf (real_model : RealModel)
    (f : RealCoordinate real_model → RealCoordinate real_model) :
    Set (R2 real_model) :=
  { point | getY (by decide) point = f (getX (by decide) point) }

                                                                     
def CartesianPlaneModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 2

end LRA.EuclideanSpace
