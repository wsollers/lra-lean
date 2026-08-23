import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.MetricSpace.Definition.MetricSpace
import LRA.EuclideanSpace.Model.EuclideanN

namespace LRA.Analysis.MetricSpace

open LRA.NumberSystems.Models
open LRA.EuclideanSpace

universe u

   
                                                    

                                                                              
                                                                       
          
  

                                                                        
                                                                       
abbrev MathlibRn (n : ℕ) := Rn mathlibRealModel n

                                                                           
abbrev coordinates {n : ℕ} (point : MathlibRn n) : Fin n → ℝ :=
  point.coord

                                                                         
theorem mathlibRn_ext {n : ℕ} {x y : MathlibRn n}
    (h : ∀ i : Fin n, coordinates x i = coordinates y i) : x = y := by
  cases x with
  | mk xcoord =>
    cases y with
    | mk ycoord =>
      have hfun : xcoord = ycoord := funext h
      cases hfun
      rfl

                                                                         
                                                
noncomputable def EuclideanRnMetric (n : ℕ) :
    MetricDefinition (MathlibRn n) where
  distance x y := dist (coordinates x) (coordinates y)
  positive x y := by
    constructor
    · exact dist_nonneg
    · constructor
      · intro hxy
        apply mathlibRn_ext
        exact fun i => by
          exact congrFun (dist_eq_zero.mp hxy) i
      · intro hxy
        cases hxy
        exact dist_self (coordinates x)
  symmetric x y := dist_comm (coordinates x) (coordinates y)
  triangle x y z := dist_triangle (coordinates x) (coordinates y) (coordinates z)

                                                                          
                                          
noncomputable def EuclideanRnMetricSpaceDefinition (n : ℕ) :
    MetricSpaceDefinition where
  Carrier := MathlibRn n
  metric := EuclideanRnMetric n

                                                                          
                                                                
                                          
structure EuclideanRnMetricSpaceModel (real_model : RealModel) (n : ℕ)
    where
  metricSpace : MetricSpaceDefinition
  euclideanStructure : TarskiStructure
  carrier_eq : metricSpace.Carrier = euclideanStructure.Domain

                                                                               
                                                        
def euclideanRnMetricSpaceModelOf
    (real_model : RealModel) (n : ℕ)
    (metric : MetricDefinition (Rn real_model n)) :
    EuclideanRnMetricSpaceModel real_model n where
  metricSpace := {
    Carrier := Rn real_model n
    metric := metric
  }
  euclideanStructure := EuclideanTupleModel real_model n
  carrier_eq := rfl

                                                                       
                                              
noncomputable def canonicalEuclideanRnMetricSpaceModel (n : ℕ) :
    EuclideanRnMetricSpaceModel mathlibRealModel n where
  metricSpace := EuclideanRnMetricSpaceDefinition n
  euclideanStructure := EuclideanTupleModel mathlibRealModel n
  carrier_eq := rfl

end LRA.Analysis.MetricSpace
