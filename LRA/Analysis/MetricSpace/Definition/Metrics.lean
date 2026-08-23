import Mathlib.Analysis.Complex.Basic
import LRA.Analysis.MetricSpace.Definition.Metric

   
                                                                       
  

namespace LRA.Analysis.MetricSpace
namespace Metrics

universe u

                                                                             
                                              

             

       
                  
   
  
def VacuousMetric (X : Type u) [IsEmpty X] : MetricDefinition X where
  distance := fun _ _ => 0
  positive := by
    intro x
    exact isEmptyElim x
  symmetric := by
    intro x
    exact isEmptyElim x
  triangle := by
    intro x
    exact isEmptyElim x

                                                                             
                                                

             

       
                            
   
  
def EmptyMetric (X : Type u) : MetricDefinition (∅ : Set X) where
  distance := fun _ _ => 0
  positive := by
    intro x
    exact x.property.elim
  symmetric := by
    intro x
    exact x.property.elim
  triangle := by
    intro x
    exact x.property.elim

theorem EuclideanRMetricPositive :
    ∀ a b : ℝ, 0 ≤ |a - b| ∧ (|a - b| = 0 ↔ a = b) := by
  sorry


theorem EuclideanRMetricSymmetric :
    ∀ a b : ℝ, |a - b| = |b - a| := by
  sorry


theorem EuclideanRMetricTriangle :
    ∀ a b c : ℝ, |a - c| ≤ |a - b| + |b - c| := by
  sorry

                                                                            
                    

             

       
                                                  
   
  
def EuclideanRMetric : MetricDefinition ℝ where
  distance := fun a b => |a - b|
  positive := EuclideanRMetricPositive
  symmetric := EuclideanRMetricSymmetric
  triangle := EuclideanRMetricTriangle

                                                                          
                                                                         
                        

             

       
                                  
   
  
def SingletonMetric {X : Type u} (point : X) : MetricDefinition ({point} : Set X) where
  distance := fun _ _ => 0
  positive := by
    intro x y
    constructor
    · norm_num
    · constructor
      · intro _
        exact Subtype.ext (Eq.trans x.property (Eq.symm y.property))
      · intro _
        rfl
  symmetric := by
    intro x y
    rfl
  triangle := by
    intro x y z
    norm_num

theorem ComplexModulusMetricPositive :
    ∀ a b : ℂ, 0 ≤ ‖a - b‖ ∧ (‖a - b‖ = 0 ↔ a = b) := by
  sorry


theorem ComplexModulusMetricSymmetric :
    ∀ a b : ℂ, ‖a - b‖ = ‖b - a‖ := by
  sorry


theorem ComplexModulusMetricTriangle :
    ∀ a b c : ℂ, ‖a - c‖ ≤ ‖a - b‖ + ‖b - c‖ := by
  sorry

                                                                            
                        

             

       
                                                      
   
  
noncomputable def ComplexModulusMetric : MetricDefinition ℂ where
  distance := fun a b => ‖a - b‖
  positive := ComplexModulusMetricPositive
  symmetric := ComplexModulusMetricSymmetric
  triangle := ComplexModulusMetricTriangle

                                                                  
                                                                     

             

       
                                         
                                                                                 
   
  
def RealCircleChordMetric (center : ℝ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {x : ℝ // |x - center| = radius} where
  distance := fun a b => |a.1 - b.1|
  positive := by
    intro a b
    constructor
    · exact abs_nonneg (a.1 - b.1)
    · constructor
      · intro hAbsEqZero
        have absEqZero : a.1 - b.1 = 0 := by
          exact abs_eq_zero.mp hAbsEqZero
        have underlyingEq : (a : ℝ) = (b : ℝ) := by
          exact sub_eq_zero.mp absEqZero
        exact Subtype.ext underlyingEq
      · intro hEqual
        have underlyingEq : (a : ℝ) = (b : ℝ) := by
          exact Subtype.ext_iff.mp hEqual
        have absEqZero : a.1 - b.1 = 0 := by
          exact sub_eq_zero.mpr underlyingEq
        exact abs_eq_zero.mpr absEqZero
  symmetric := by
    intro a b
    exact abs_sub_comm a.1 b.1
  triangle := by
    intro a b c
    exact abs_sub_le a.1 b.1 c.1

theorem ComplexCircleChordMetricPositive
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      0 ≤ ‖a.1 - b.1‖ ∧ (‖a.1 - b.1‖ = 0 ↔ a = b) := by
  sorry


theorem ComplexCircleChordMetricSymmetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - b.1‖ = ‖b.1 - a.1‖ := by
  sorry


theorem ComplexCircleChordMetricTriangle
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    ∀ a b c : {z : ℂ // ‖z - center‖ = radius},
      ‖a.1 - c.1‖ ≤ ‖a.1 - b.1‖ + ‖b.1 - c.1‖ := by
  sorry

                                                                      
                                                           

             

       
                                         
                                                                                    
   
  
noncomputable def ComplexCircleChordMetric
    (center : ℂ) (radius : ℝ) (radiusPositive : 0 < radius) :
    MetricDefinition {z : ℂ // ‖z - center‖ = radius} where
  distance := fun a b => ‖a.1 - b.1‖
  positive := ComplexCircleChordMetricPositive center radius radiusPositive
  symmetric := ComplexCircleChordMetricSymmetric center radius radiusPositive
  triangle := ComplexCircleChordMetricTriangle center radius radiusPositive

end Metrics
end LRA.Analysis.MetricSpace
