namespace LRA.AlgebraicStructures

universe u

/-!
Discrete integer-style successor and predecessor law certificates.
-/

/-- A carrier with a successor operation. -/
class HasSuccessor (R : Type u) where
  Succ : R → R

/-- A carrier with a predecessor operation. -/
class HasPredecessor (R : Type u) where
  Pred : R → R

/-- The successor step, resolved from the carrier type. -/
def Succ {R : Type u} [HasSuccessor R] : R → R :=
  HasSuccessor.Succ

/-- The predecessor step, resolved from the carrier type. -/
def Pred {R : Type u} [HasPredecessor R] : R → R :=
  HasPredecessor.Pred

/-- The n-fold iterate of the successor step. -/
def SuccIterate {R : Type u} [HasSuccessor R] : Nat → R → R
  | 0, a => a
  | n + 1, a => Succ (SuccIterate n a)

/-- Successor and predecessor are mutually inverse injective steps. -/
class SuccessorLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] : Prop where
  PredSucc : ∀ a : R, Pred (Succ a) = a
  SuccPred : ∀ a : R, Succ (Pred a) = a
  SuccInjective : ∀ a b : R, Succ a = Succ b → a = b
  PredInjective : ∀ a b : R, Pred a = Pred b → a = b

/-- Successor is addition of one. -/
class SuccessorAdditionLaw (R : Type u)
    [HasSuccessor R] [Add R] [OfNat R 1] : Prop where
  SuccEqAddOne : ∀ a : R, Succ a = a + 1

/-- Multiplication interacts with successor and predecessor by accumulation. -/
class SuccessorMultiplicationLaws (R : Type u)
    [HasSuccessor R] [HasPredecessor R] [Add R] [Mul R] [Neg R] : Prop where
  MulSucc : ∀ a b : R, a * Succ b = a * b + a
  MulPred : ∀ a b : R, a * Pred b = a * b + -a

/-- Two-sided discreteness from zero. -/
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

/-- Predecessor undoes successor. -/
theorem PredSucc [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Pred (Succ a) = a :=
  SuccessorLaws.PredSucc

/-- Successor undoes predecessor. -/
theorem SuccPred [HasSuccessor R] [HasPredecessor R] [SuccessorLaws R] :
    ∀ a : R, Succ (Pred a) = a :=
  SuccessorLaws.SuccPred

/-- The successor step is injective. -/
theorem SuccInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Succ a = Succ b → a = b :=
  SuccessorLaws.SuccInjective

/-- The predecessor step is injective. -/
theorem PredInjective [HasSuccessor R] [HasPredecessor R]
    [SuccessorLaws R] :
    ∀ a b : R, Pred a = Pred b → a = b :=
  SuccessorLaws.PredInjective

/-- The successor step is addition of one. -/
theorem SuccEqAddOne [HasSuccessor R] [Add R] [OfNat R 1]
    [SuccessorAdditionLaw R] :
    ∀ a : R, Succ a = a + 1 :=
  SuccessorAdditionLaw.SuccEqAddOne

/-- Multiplying into a successor accumulates one more copy. -/
theorem MulSucc [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Succ b = a * b + a :=
  SuccessorMultiplicationLaws.MulSucc

/-- Multiplying into a predecessor removes one copy. -/
theorem MulPred [HasSuccessor R] [HasPredecessor R]
    [Add R] [Mul R] [Neg R] [SuccessorMultiplicationLaws R] :
    ∀ a b : R, a * Pred b = a * b + -a :=
  SuccessorMultiplicationLaws.MulPred

/-- The forward walk from zero never returns to zero. -/
theorem SuccAperiodic [HasSuccessor R] [HasPredecessor R] [OfNat R 0]
    [DiscretenessLaw R] :
    ∀ n : Nat, 0 < n → SuccIterate n (0 : R) ≠ 0 :=
  DiscretenessLaw.SuccAperiodic

/-- Two-sided induction from zero reaches every element. -/
theorem TwoSidedInduction [HasSuccessor R] [HasPredecessor R]
    [OfNat R 0] [DiscretenessLaw R] :
    ∀ (motive : R → Prop),
      motive 0 →
      (∀ a, motive a → motive (Succ a)) →
      (∀ a, motive a → motive (Pred a)) →
      ∀ a, motive a :=
  DiscretenessLaw.TwoSidedInduction

end Wrappers

end LRA.AlgebraicStructures
