import LRA.EuclideanSpace.Model.Euclidean3Space

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Models

                                                                            
abbrev R4 (real_model : RealModel) := Rn real_model 4

                                    
def ClosedHyperbox4 (real_model : RealModel)
    (xmin xmax ymin ymax zmin zmax wmin wmax : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point |
      xmin ≤ getX (by decide) point ∧ getX (by decide) point ≤ xmax ∧
      ymin ≤ getY (by decide) point ∧ getY (by decide) point ≤ ymax ∧
      zmin ≤ getZ (by decide) point ∧ getZ (by decide) point ≤ zmax ∧
      wmin ≤ getW (by decide) point ∧ getW (by decide) point ≤ wmax }

                                                             
def Sphere4 (real_model : RealModel)
    (center : R4 real_model) (radiusSq : RealCoordinate real_model) :
    Set (R4 real_model) :=
  { point | squaredDistance real_model point center = radiusSq }

                                                            
def Euclidean4SpaceModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 4

end LRA.EuclideanSpace
