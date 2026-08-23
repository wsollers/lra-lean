namespace LRA.AlgebraicStructures

universe u

   
                                                                  
  

                                            
class HasSuccessor (R : Type u) where
  Succ : R → R

                                              
class HasPredecessor (R : Type u) where
  Pred : R → R

                                                          
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

                                                            
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

                                                
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

                                                                      
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

                                    
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

                                                                               
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

                                        
class DiscretenessLaw (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [OfNat R 0] : Prop where
  SuccAperiodic : ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0
  TwoSidedInduction :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a

section Wrappers

variable {R : Type u}

                                    
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a := by
  sorry

                                    
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a := by
  sorry

                                       
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b := by
  sorry

                                         
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b := by
  sorry

                                             
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1 := by
  sorry

                                                              
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a := by
  sorry

                                                       
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a := by
  sorry

                                                        
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0 := by
  sorry

                                                           
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
