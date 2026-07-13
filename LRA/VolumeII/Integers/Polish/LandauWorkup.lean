-- LRA/VolumeII/Integers/Polish/LandauWorkup.lean
-- Landau-style workup of the Polish two-sided successor construction.

import LRA.VolumeII.Integers.Polish.TwoSidedSuccessor

namespace LRA
namespace VolumeII
namespace Integers
namespace Polish
namespace TwoSidedSuccessor

/-!
Volume II label: integers-polish-landau-workup
Lean module: LRA.VolumeII.Integers.Polish.LandauWorkup
Verification status: checked algebraic core

This module extends the two-sided successor construction with the induction,
recursion uniqueness, additive algebra, negation algebra, and first
multiplicative clauses needed for a Landau-style integer workup.
-/

theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y := by
  have inverseEquality := congrArg pred successorEquality
  rw [pred_succ, pred_succ] at inverseEquality
  exact inverseEquality

theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y := by
  have inverseEquality := congrArg succ predecessorEquality
  rw [succ_pred, succ_pred] at inverseEquality
  exact inverseEquality

/-- Two-sided induction, proved from the structural definition of `Z`. -/
theorem twoSidedInduction
    (A : Z → Prop)
    (zeroCase : A Z.zero)
    (succStep : ∀ x, A x → A (succ x))
    (predStep : ∀ x, A x → A (pred x)) :
    ∀ x, A x := by
  intro x
  cases x with
  | zero => exact zeroCase
  | pos p =>
      induction p with
      | succZero => exact succStep Z.zero zeroCase
      | succ p' ih => exact succStep (Z.pos p') ih
  | neg n =>
      induction n with
      | predZero => exact predStep Z.zero zeroCase
      | pred n' ih => exact predStep (Z.neg n') ih

/-- Recursion into a two-sided successor target is unique. -/
theorem recursion_unique {α : Type}
    (a0 : α)
    (stepSucc stepPred : α → α)
    (firstFunction secondFunction : Z → α)
    (firstFunction_zero : firstFunction Z.zero = a0)
    (firstFunction_succ : ∀ x, firstFunction (succ x) = stepSucc (firstFunction x))
    (firstFunction_pred : ∀ x, firstFunction (pred x) = stepPred (firstFunction x))
    (secondFunction_zero : secondFunction Z.zero = a0)
    (secondFunction_succ : ∀ x, secondFunction (succ x) = stepSucc (secondFunction x))
    (secondFunction_pred : ∀ x, secondFunction (pred x) = stepPred (secondFunction x)) :
    ∀ x, firstFunction x = secondFunction x := by
  apply twoSidedInduction
  · rw [firstFunction_zero, secondFunction_zero]
  · intro x inductionHypothesis
    rw [firstFunction_succ, secondFunction_succ, inductionHypothesis]
  · intro x inductionHypothesis
    rw [firstFunction_pred, secondFunction_pred, inductionHypothesis]

theorem add_zero (x : Z) : x + Z.zero = x := rfl

theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w) := by
  rw [succ_pred, pred_succ]

theorem zero_add (x : Z) : Z.zero + x = x := by
  apply twoSidedInduction (fun x => Z.zero + x = x)
  · rfl
  · intro x ih
    rw [add_succ, ih]
  · intro x ih
    rw [add_pred, ih]

theorem succ_add (x y : Z) : succ x + y = succ (x + y) := by
  revert y
  apply twoSidedInduction
  · rfl
  · intro y ih
    rw [add_succ, ih, add_succ]
  · intro y ih
    rw [add_pred, ih, add_pred, succ_pred_comm]

theorem pred_add (x y : Z) : pred x + y = pred (x + y) := by
  revert y
  apply twoSidedInduction
  · rfl
  · intro y ih
    rw [add_succ, ih, add_succ, succ_pred_comm]
  · intro y ih
    rw [add_pred, ih, add_pred]

theorem add_comm (x y : Z) : x + y = y + x := by
  revert y
  apply twoSidedInduction
  · rw [add_zero, zero_add]
  · intro y ih
    rw [add_succ, ih, succ_add]
  · intro y ih
    rw [add_pred, ih, pred_add]

theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z) := by
  revert z
  apply twoSidedInduction
  · rfl
  · intro z ih
    rw [add_succ, add_succ, ih, add_succ]
  · intro z ih
    rw [add_pred, add_pred, ih, add_pred]

theorem neg_zero : (-Z.zero : Z) = Z.zero := rfl

theorem neg_succ (x : Z) : -(succ x) = pred (-x) := by
  cases x with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero => rfl
      | pred n' => rfl

theorem neg_pred (x : Z) : -(pred x) = succ (-x) := by
  cases x with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero => rfl
      | succ p' => rfl
  | neg n => rfl

theorem neg_neg (x : Z) : -(-x) = x := by
  apply twoSidedInduction (fun x => -(-x) = x)
  · rfl
  · intro x ih
    rw [neg_succ, neg_pred, ih]
  · intro x ih
    rw [neg_pred, neg_succ, ih]

theorem add_neg_self (x : Z) : x + (-x) = Z.zero := by
  apply twoSidedInduction (fun x => x + (-x) = Z.zero)
  · rfl
  · intro x ih
    rw [neg_succ, add_pred, succ_add, ih, pred_succ]
  · intro x ih
    rw [neg_pred, add_succ, pred_add, ih, succ_pred]

theorem neg_add_self (x : Z) : (-x) + x = Z.zero := by
  rw [add_comm, add_neg_self]

theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y) := by
  revert y
  apply twoSidedInduction
  · rw [add_zero, neg_zero, add_zero]
  · intro y ih
    rw [add_succ, neg_succ, ih, neg_succ, add_pred]
  · intro y ih
    rw [add_pred, neg_pred, ih, neg_pred, add_succ]

theorem mul_succ (x y : Z) : x * succ y = x * y + x := by
  cases y with
  | zero =>
      show x * Z.pos P.succZero = x * Z.zero + x
      rw [mul_pos_succZero, mul_zero, zero_add]
  | pos p => exact mul_pos_succ x p
  | neg n =>
      cases n with
      | predZero =>
          show x * Z.zero = x * Z.neg N.predZero + x
          rw [mul_zero, mul_neg_predZero, neg_add_self]
      | pred n' =>
          show x * Z.neg n' = x * Z.neg (N.pred n') + x
          rw [mul_neg_pred, add_assoc, neg_add_self, add_zero]

theorem mul_pred (x y : Z) : x * pred y = x * y + (-x) := by
  cases y with
  | zero =>
      show x * Z.neg N.predZero = x * Z.zero + (-x)
      rw [mul_neg_predZero, mul_zero, zero_add]
  | pos p =>
      cases p with
      | succZero =>
          show x * Z.zero = x * Z.pos P.succZero + (-x)
          rw [mul_zero, mul_pos_succZero, add_neg_self]
      | succ p' =>
          show x * Z.pos p' = x * Z.pos (P.succ p') + (-x)
          rw [mul_pos_succ, add_assoc, add_neg_self, add_zero]
  | neg n => exact mul_neg_pred x n

theorem zero_mul (x : Z) : Z.zero * x = Z.zero := by
  apply twoSidedInduction (fun x => Z.zero * x = Z.zero)
  · rfl
  · intro x ih
    rw [mul_succ, ih, add_zero]
  · intro x ih
    rw [mul_pred, ih, neg_zero, add_zero]

def one : Z := Z.pos P.succZero

theorem add_one (x : Z) : x + one = succ x := by
  show x + succ Z.zero = succ x
  rw [add_succ, add_zero]

theorem neg_one_eq : (-one : Z) = pred Z.zero := by
  show -(succ Z.zero) = pred Z.zero
  rw [neg_succ, neg_zero]

theorem add_neg_one (x : Z) : x + (-one) = pred x := by
  rw [neg_one_eq, add_pred, add_zero]

theorem one_mul (x : Z) : one * x = x := by
  apply twoSidedInduction (fun x => one * x = x)
  · rfl
  · intro x ih
    rw [mul_succ, ih, add_one]
  · intro x ih
    rw [mul_pred, ih, add_neg_one]

theorem succ_mul (x y : Z) : succ x * y = x * y + y := by
  revert y
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, add_zero]
  · intro y ih
    rw [mul_succ, ih, mul_succ, add_succ, add_succ, add_assoc, add_assoc, add_comm x y]
  · intro y ih
    rw [
      mul_pred, ih, mul_pred, neg_succ, add_pred, add_assoc,
      add_comm y (-x), ← add_assoc, ← add_pred
    ]

theorem pred_mul (x y : Z) : pred x * y = x * y + (-y) := by
  revert y
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, neg_zero, add_zero]
  · intro y ih
    rw [
      mul_succ, ih, mul_succ, neg_succ, add_pred, add_assoc,
      add_comm (-y) x, ← add_assoc, ← add_pred
    ]
  · intro y ih
    rw [
      mul_pred, ih, mul_pred, neg_pred, neg_pred, add_succ, add_succ,
      add_assoc, add_comm (-y) (-x), ← add_assoc
    ]

theorem mul_comm (x y : Z) : x * y = y * x := by
  apply twoSidedInduction (fun y => x * y = y * x)
  · rw [mul_zero, zero_mul]
  · intro y ih
    rw [mul_succ, ih, succ_mul]
  · intro y ih
    rw [mul_pred, ih, pred_mul]

/-- Rearrangement helper: `(a+b)+(c+d) = (a+c)+(b+d)`. -/
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d) := by
  rw [add_assoc, ← add_assoc b c d, add_comm b c, add_assoc, ← add_assoc]

theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c := by
  revert c
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, mul_zero, add_zero]
  · intro c ih
    rw [mul_succ, ih, mul_succ, mul_succ, add_add_comm]
  · intro c ih
    rw [mul_pred, ih, mul_pred, mul_pred, neg_add, add_add_comm]

theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c := by
  rw [mul_comm a (b + c), distrib_right, mul_comm b a, mul_comm c a]

theorem mul_neg (x y : Z) : x * (-y) = -(x * y) := by
  apply twoSidedInduction (fun y => x * (-y) = -(x * y))
  · rw [neg_zero, mul_zero]
    exact neg_zero.symm
  · intro y ih
    rw [neg_succ, mul_pred, ih, mul_succ, neg_add]
  · intro y ih
    rw [neg_pred, mul_succ, ih, mul_pred, neg_add, neg_neg]

theorem neg_mul (x y : Z) : (-x) * y = -(x * y) := by
  rw [mul_comm, mul_neg, mul_comm]

theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z) := by
  revert z
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, mul_zero]
  · intro z ih
    rw [mul_succ, ih, mul_succ, distrib_left]
  · intro z ih
    rw [mul_pred, ih, mul_pred, distrib_left, ← mul_neg]

/-- `Pos z` means `z` lies on the positive ray. -/
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p

/-- `IsNeg z` means `z` lies on the negative ray. -/
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n

theorem not_pos_zero : ¬ Pos Z.zero := by
  rintro ⟨p, hp⟩
  injection hp

theorem not_isNeg_zero : ¬ IsNeg Z.zero := by
  rintro ⟨n, hn⟩
  injection hn

theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z) := by
  rintro ⟨⟨p, hp⟩, ⟨n, hn⟩⟩
  rw [hp] at hn
  injection hn

theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z := by
  cases z with
  | zero => exact Or.inl rfl
  | pos p => exact Or.inr (Or.inl ⟨p, rfl⟩)
  | neg n => exact Or.inr (Or.inr ⟨n, rfl⟩)

theorem pos_add {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x + y) := by
  obtain ⟨leftPositiveRay, rfl⟩ := leftPositive
  induction leftPositiveRay with
  | succZero =>
      obtain ⟨rightPositiveRay, rfl⟩ := rightPositive
      refine ⟨P.succ rightPositiveRay, ?_⟩
      show Z.pos P.succZero + Z.pos rightPositiveRay = Z.pos (P.succ rightPositiveRay)
      rw [show Z.pos P.succZero = succ Z.zero from rfl, succ_add, zero_add]
      rfl
  | succ previousPositiveRay inductionHypothesis =>
      obtain ⟨sumPositiveRay, sumPositiveRayEquality⟩ := inductionHypothesis
      refine ⟨P.succ sumPositiveRay, ?_⟩
      show Z.pos (P.succ previousPositiveRay) + y = Z.pos (P.succ sumPositiveRay)
      rw [
        show Z.pos (P.succ previousPositiveRay) = succ (Z.pos previousPositiveRay) from rfl,
        succ_add,
        sumPositiveRayEquality
      ]
      rfl

theorem isNeg_neg_of_pos {x : Z} (positiveInput : Pos x) : IsNeg (-x) := by
  obtain ⟨positiveRay, rfl⟩ := positiveInput
  induction positiveRay with
  | succZero =>
      exact ⟨N.predZero, by
        rw [show Z.pos P.succZero = succ Z.zero from rfl, neg_succ, neg_zero]
        rfl⟩
  | succ previousPositiveRay inductionHypothesis =>
      obtain ⟨negativeRay, negativeRayEquality⟩ := inductionHypothesis
      exact ⟨N.pred negativeRay, by
        rw [
          show Z.pos (P.succ previousPositiveRay) = succ (Z.pos previousPositiveRay) from rfl,
          neg_succ,
          negativeRayEquality
        ]
        rfl⟩

theorem pos_neg_of_isNeg {x : Z} (negativeInput : IsNeg x) : Pos (-x) := by
  obtain ⟨negativeRay, rfl⟩ := negativeInput
  induction negativeRay with
  | predZero =>
      exact ⟨P.succZero, by
        rw [show Z.neg N.predZero = pred Z.zero from rfl, neg_pred, neg_zero]
        rfl⟩
  | pred previousNegativeRay inductionHypothesis =>
      obtain ⟨positiveRay, positiveRayEquality⟩ := inductionHypothesis
      exact ⟨P.succ positiveRay, by
        rw [
          show Z.neg (N.pred previousNegativeRay) = pred (Z.neg previousNegativeRay) from rfl,
          neg_pred,
          positiveRayEquality
        ]
        rfl⟩

theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x := by
  constructor
  · intro negatedInputIsPositive
    rcases trichotomy x with inputIsZero | inputIsPositive | inputIsNegative
    · exfalso
      rw [inputIsZero, neg_zero] at negatedInputIsPositive
      exact not_pos_zero negatedInputIsPositive
    · exfalso
      have negatedInputIsNegative := isNeg_neg_of_pos inputIsPositive
      obtain ⟨positiveRay, positiveRayEquality⟩ := negatedInputIsPositive
      obtain ⟨negativeRay, negativeRayEquality⟩ := negatedInputIsNegative
      rw [positiveRayEquality] at negativeRayEquality
      injection negativeRayEquality
    · exact inputIsNegative
  · exact pos_neg_of_isNeg

def lt (x y : Z) : Prop := Pos (y + (-x))

instance : LT Z where
  lt := lt

def le (x y : Z) : Prop := x = y ∨ x < y

instance : LE Z where
  le := le

theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x)) := Iff.rfl

theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x := by
  intro h
  rw [lt_def, neg_zero, add_zero] at h
  exact h

theorem lt_irrefl (x : Z) : ¬ x < x := by
  rw [lt_def, add_neg_self]
  exact not_pos_zero

theorem lt_trans {x y z : Z} (firstLessSecond : x < y) (secondLessThird : y < z) : x < z := by
  have positiveSum := pos_add firstLessSecond secondLessThird
  have collapsedDifferenceEquality : (y + (-x)) + (z + (-y)) = z + (-x) := by
    calc
      (y + -x) + (z + -y)
          = (z + -y) + (y + -x) := add_comm _ _
      _ = z + (-y + (y + -x)) := add_assoc z (-y) (y + -x)
      _ = z + ((-y + y) + -x) := by rw [add_assoc]
      _ = z + (Z.zero + -x) := by rw [neg_add_self]
      _ = z + -x := by rw [zero_add]
  rw [lt_def]
  rw [collapsedDifferenceEquality] at positiveSum
  exact positiveSum

theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x := by
  rcases trichotomy (y + (-x)) with differenceIsZero | differenceIsPositive | differenceIsNegative
  · right
    left
    have differencePlusRightEndpoint := congrArg (fun w => w + x) differenceIsZero
    have endpointsEqualInReverseOrder : y = x := by
      calc
        y = y + Z.zero := (add_zero y).symm
        _ = y + (-x + x) := by rw [neg_add_self]
        _ = (y + -x) + x := (add_assoc y (-x) x).symm
        _ = Z.zero + x := differencePlusRightEndpoint
        _ = x := zero_add x
    exact endpointsEqualInReverseOrder.symm
  · left
    exact differenceIsPositive
  · right
    right
    have negativeDifferenceBecomesPositive := pos_neg_of_isNeg differenceIsNegative
    have negatedDifferenceEquality : -(y + -x) = x + -y := by
      rw [neg_add, neg_neg, add_comm]
    rw [lt_def, ← negatedDifferenceEquality]
    exact negativeDifferenceBecomesPositive

theorem lt_succ_self (x : Z) : x < succ x := by
  rw [lt_def, succ_add, add_neg_self]
  exact ⟨P.succZero, rfl⟩

theorem pred_lt_self (x : Z) : pred x < x := by
  rw [lt_def, neg_pred, add_succ, add_neg_self]
  exact ⟨P.succZero, rfl⟩

theorem add_lt_add_right {x y : Z} (firstLessSecond : x < y) (z : Z) : x + z < y + z := by
  have translatedDifferenceEquality : (y + z) + -(x + z) = y + -x := by
    rw [neg_add]
    calc
      (y + z) + (-x + -z)
          = y + (z + (-x + -z)) := add_assoc y z (-x + -z)
      _ = y + (z + (-z + -x)) := by rw [add_comm (-x) (-z)]
      _ = y + ((z + -z) + -x) := by rw [add_assoc]
      _ = y + (Z.zero + -x) := by rw [add_neg_self]
      _ = y + -x := by rw [zero_add]
  rw [lt_def, translatedDifferenceEquality]
  exact firstLessSecond

theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y := Iff.rfl

theorem le_refl (x : Z) : x ≤ x := Or.inl rfl

theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z := by
  rcases firstLeSecond with rfl | firstLessSecond
  · exact secondLessThird
  · exact lt_trans firstLessSecond secondLessThird

theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y := by
  rcases firstLeSecond with rfl | firstLessSecond
  · rfl
  · rcases secondLeFirst with rfl | secondLessFirst
    · rfl
    · exact absurd (lt_trans firstLessSecond secondLessFirst) (lt_irrefl x)

theorem pos_mul {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x * y) := by
  obtain ⟨leftPositiveRay, rfl⟩ := leftPositive
  induction leftPositiveRay with
  | succZero =>
      show Pos (Z.pos P.succZero * y)
      rw [show Z.pos P.succZero = one from rfl, one_mul]
      exact rightPositive
  | succ previousPositiveRay inductionHypothesis =>
      show Pos (Z.pos (P.succ previousPositiveRay) * y)
      rw [show Z.pos (P.succ previousPositiveRay) = succ (Z.pos previousPositiveRay) from rfl, succ_mul]
      exact pos_add inductionHypothesis rightPositive

theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z := by
  have productDifferencePositive := pos_mul firstLessSecond multiplierPositive
  have productDifferenceEquality : (y + -x) * z = y * z + -(x * z) := by
    rw [distrib_right, neg_mul]
  rw [lt_def, ← productDifferenceEquality]
  exact productDifferencePositive

end TwoSidedSuccessor
end Polish
end Integers
end VolumeII
end LRA
