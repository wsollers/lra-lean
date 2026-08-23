import LRA.EuclideanSpace.Definition
import LRA.NumberSystems.RealNumbers.ConstructionModels

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

universe u

abbrev CoordinateTuple (real_model : RealModel) (n : ℕ) : Type u :=
  Fin n → real_model.Carrier

def OriginCoordinates (real_model : RealModel) (n : ℕ) :
    CoordinateTuple real_model n :=
  fun _ => 0

structure CoordinateSystemDefinition
    (space : EuclideanSpaceDefinition)
    (real_model : RealModel)
    (n : ℕ) where
  origin : space.Carrier
  coordinates : space.Carrier → CoordinateTuple real_model n
  pointOf : CoordinateTuple real_model n → space.Carrier

end LRA.EuclideanSpace
