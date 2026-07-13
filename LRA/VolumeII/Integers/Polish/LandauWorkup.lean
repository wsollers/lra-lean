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

theorem succ_injective {x y : Z} (h : succ x = succ y) : x = y := by
  have inverseEquality := congrArg pred h
  rw [pred_succ, pred_succ] at inverseEquality
  exact inverseEquality

theorem pred_injective {x y : Z} (h : pred x = pred y) : x = y := by
  have inverseEquality := congrArg succ h
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
    (h₁ h₂ : Z → α)
    (h1z : h₁ Z.zero = a0)
    (h1s : ∀ x, h₁ (succ x) = stepSucc (h₁ x))
    (h1p : ∀ x, h₁ (pred x) = stepPred (h₁ x))
    (h2z : h₂ Z.zero = a0)
    (h2s : ∀ x, h₂ (succ x) = stepSucc (h₂ x))
    (h2p : ∀ x, h₂ (pred x) = stepPred (h₂ x)) :
    ∀ x, h₁ x = h₂ x := by
  apply twoSidedInduction
  · rw [h1z, h2z]
  · intro x ih
    rw [h1s, h2s, ih]
  · intro x ih
    rw [h1p, h2p, ih]

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

end TwoSidedSuccessor
end Polish
end Integers
end VolumeII
end LRA
