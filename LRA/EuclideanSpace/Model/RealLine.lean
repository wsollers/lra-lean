import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.EuclideanSpace

open LRA.NumberSystems.Interface.ModelTheory

                                                                     
abbrev R1 (real_model : RealModel) := Rn real_model 1

                                                              
def getX1 (point : R1 real_model) : RealCoordinate real_model :=
  point.coord ⟨0, by decide⟩

                                                         
def OpenIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point ∧ getX1 point < b }

                                                           
def ClosedIntervalM (real_model : RealModel)
    (a b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a ≤ getX1 point ∧ getX1 point ≤ b }

                                                          
def OpenRayAboveM (real_model : RealModel)
    (a : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | a < getX1 point }

                                                          
def OpenRayBelowM (real_model : RealModel)
    (b : RealCoordinate real_model) : Set (R1 real_model) :=
  { point | getX1 point < b }

                                                                     
def RealLineModel (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature :=
  EuclideanTupleModel real_model 1

end LRA.EuclideanSpace
