                                                                                   
                                                                          

import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Behavior
import LRA.NumberSystems.IntegerStructure
import LRA.Set.PredicateSet

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open LRA.AlgebraicStructures
open LRA.Order

   
                                          
                                                                          
                                                                       
                                                        

                                                                        
                                                         
                                                                    
                                                                     
                                                               
                                                                 
                                                             

                                                           
                                                                      
                                                                    
                                                                       
                                                 
  

                  

instance : OfNat Z 0 := ⟨Z.zero⟩

instance : OfNat Z 1 := ⟨one⟩

instance : Sub Z := ⟨fun firstInteger secondInteger => firstInteger + -secondInteger⟩

instance : HasSuccessor Z := ⟨succ⟩

instance : HasPredecessor Z := ⟨pred⟩

                               

instance : AdditiveSemigroupLaws Z := ⟨add_assoc⟩

instance : AdditiveCommutativeLaws Z := ⟨add_comm⟩

theorem z_sub_eq_add_neg (firstInteger secondInteger : Z) :
    firstInteger - secondInteger = firstInteger + -secondInteger := by

  sorry

instance : AdditiveIdentityLaws Z := ⟨zero_add, add_zero⟩

instance : AdditiveInverseLaws Z := ⟨neg_add_self, add_neg_self⟩

instance : SubtractionCompatibilityLaw Z := ⟨z_sub_eq_add_neg⟩

                                     

instance : MultiplicativeSemigroupLaws Z := ⟨mul_assoc⟩

instance : MultiplicativeCommutativeLaws Z := ⟨mul_comm⟩

instance : MultiplicativeIdentityLaws Z := ⟨one_mul, mul_pos_succZero⟩

theorem z_mul_zero (integer : Z) : integer * Z.zero = Z.zero := by
  sorry

instance : ZeroAbsorbingLaws Z := ⟨zero_mul, z_mul_zero⟩

instance : DistributiveLaws Z := ⟨distrib_left, distrib_right⟩

theorem z_one_ne_zero : (one : Z) ≠ Z.zero := by
  sorry

instance : NontrivialityLaw Z := ⟨z_one_ne_zero⟩

theorem z_eq_zero_of_mul_eq_zero (firstInteger secondInteger : Z) :
    firstInteger * secondInteger = Z.zero ->
      firstInteger = Z.zero ∨ secondInteger = Z.zero := by
  sorry

instance : NoZeroDivisorsLaw Z := ⟨z_eq_zero_of_mul_eq_zero⟩

                            

theorem z_le_trans (firstInteger secondInteger thirdInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ thirdInteger -> firstInteger ≤ thirdInteger := by
  sorry

theorem z_le_antisymm (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ->
      secondInteger ≤ firstInteger -> firstInteger = secondInteger := by

  sorry

instance : PartialOrderLaws Z := ⟨le_refl, z_le_antisymm, z_le_trans⟩

theorem z_le_total (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger ∨ secondInteger ≤ firstInteger := by
  sorry

instance : TotalOrderLaw Z := ⟨z_le_total⟩

theorem z_lt_iff_le_not_le (firstInteger secondInteger : Z) :
    firstInteger < secondInteger ↔
      firstInteger ≤ secondInteger ∧ ¬ secondInteger ≤ firstInteger := by
  sorry

instance : StrictOrderCompatibilityLaw Z := ⟨z_lt_iff_le_not_le⟩

theorem z_add_le_add_left (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      translation + firstInteger ≤ translation + secondInteger := by
  sorry

theorem z_add_le_add_right (firstInteger secondInteger : Z) :
    firstInteger ≤ secondInteger -> ∀ translation : Z,
      firstInteger + translation ≤ secondInteger + translation := by
  sorry

instance : AdditionRespectsOrderLaws Z := ⟨z_add_le_add_left, z_add_le_add_right⟩

theorem z_mul_nonneg (firstInteger secondInteger : Z) :
    Z.zero ≤ firstInteger -> Z.zero ≤ secondInteger -> Z.zero ≤ firstInteger * secondInteger := by
  sorry

instance : MultiplicationRespectsOrderLaws Z := ⟨z_mul_nonneg⟩

theorem z_no_strict_between_add_one (integer : Z) :
    ¬ ∃ middle : Z, integer < middle ∧ middle < integer + 1 := by
  sorry

instance : OrderDiscretenessLaw Z := ⟨z_no_strict_between_add_one⟩

                                   

theorem z_succ_injective (firstInteger secondInteger : Z) :
    Succ firstInteger = Succ secondInteger -> firstInteger = secondInteger := by

                                   

  sorry

theorem z_pred_injective (firstInteger secondInteger : Z) :
    Pred firstInteger = Pred secondInteger -> firstInteger = secondInteger := by

  sorry

instance : SuccessorLaws Z := ⟨pred_succ, succ_pred, z_succ_injective, z_pred_injective⟩

theorem z_succ_eq_add_one (integer : Z) : succ integer = integer + one := by
  sorry

instance : SuccessorAdditionLaw Z := by

  sorry

instance : SuccessorMultiplicationLaws Z := ⟨mul_succ, mul_pred⟩

theorem z_succ_aperiodic (iterationCount : Nat) :
    0 < iterationCount -> SuccIterate iterationCount (0 : Z) ≠ 0 := by
  sorry

theorem z_two_sided_induction (motive : Z → Prop) :
    motive 0 ->
      (∀ integer, motive integer -> motive (Succ integer)) ->
      (∀ integer, motive integer -> motive (Pred integer)) ->
      ∀ integer, motive integer := by
  sorry

instance : DiscretenessLaw Z := ⟨z_succ_aperiodic, z_two_sided_induction⟩

                                                                    

example : CommutativeRingLaws Z := inferInstance
example : RingLaws Z := inferInstance
example : IntegralDomainLaws Z := inferInstance
example : LinearOrderLaws Z := inferInstance
example : OrderedRingLaws Z := inferInstance

example (a b : Z) : a * Succ b = a * b + a := MulSucc a b
example (a b c : Z) : a * (b + c) = a * b + a * c := LeftDistributive a b c
example (a : Z) : a - a = a + -a := SubEqAddNeg a a

theorem polish_integer_structure_induction
    (subset : LRA.Set.PredicateSet Z) :
    Z.zero ∈ subset ->
      (∀ element : Z, element ∈ subset -> succ element ∈ subset) ->
      (∀ element : Z, element ∈ subset -> pred element ∈ subset) ->
      ∀ element : Z, element ∈ subset := by

  sorry

theorem polish_integer_structure_aperiodic :
    ∀ iterations : Nat, 0 < iterations ->
      LRA.NumberSystems.IntegerStructure.iterate succ iterations Z.zero ≠ Z.zero := by
  sorry

                                                                              

                                                                    
                                                                           
                                                                           
                                                                         
                                                                          
                                                                           
                                                                          
  

                                                                            
                                                                           
noncomputable def PolishRealizesIntegerStructure :
    LRA.NumberSystems.IntegerStructure.IntegerStructure Z (LRA.Set.PredicateSet Z) where
  zero := Z.zero
  one := one
  negativeOne := -one
  successor := succ
  predecessor := pred
  predecessor_successor := pred_succ
  successor_predecessor := succ_pred
  successor_zero := succ_zero_eq_one
  predecessor_zero := pred_zero_eq_neg_one
  aperiodic := polish_integer_structure_aperiodic
  induction := polish_integer_structure_induction

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
