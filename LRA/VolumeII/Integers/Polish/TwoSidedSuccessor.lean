-- LRA/VolumeII/Integers/Polish/TwoSidedSuccessor.lean
-- Experimental Polish-style two-sided successor construction of the integers.

namespace LRA
namespace VolumeII
namespace Integers
namespace Polish
namespace TwoSidedSuccessor

/-!
Volume II label: experimental-integers-polish-two-sided-successor
Lean module: LRA.VolumeII.Integers.Polish.TwoSidedSuccessor
Verification status: experimental checked core, pending source integration

This module tests a direct construction of the integers as the disjoint union of
zero, a successor-generated positive ray, and a predecessor-generated negative
ray. It is intentionally isolated from the canonical integer construction.

Source variant: Polish integer axiomatization tradition, following the
Peano-like successor/predecessor systems discussed by Iwanuś and
Wybraniec-Skardowska.
-/

inductive P : Type where
  | succZero : P
  | succ : P → P

inductive N : Type where
  | predZero : N
  | pred : N → N

inductive Z : Type where
  | zero : Z
  | pos : P → Z
  | neg : N → Z

open Z

def succ : Z → Z
  | zero => pos P.succZero
  | pos p => pos (P.succ p)
  | neg n =>
      match n with
      | N.predZero => zero
      | N.pred n' => neg n'

def pred : Z → Z
  | zero => neg N.predZero
  | pos p =>
      match p with
      | P.succZero => zero
      | P.succ p' => pos p'
  | neg n => neg (N.pred n)

theorem pred_succ (x : Z) : pred (succ x) = x := by
  cases x with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero => rfl
      | pred n' => rfl

theorem succ_pred (x : Z) : succ (pred x) = x := by
  cases x with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero => rfl
      | succ p' => rfl
  | neg n => rfl

def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)

def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)

def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n

theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0 := rfl

theorem recZ_succ {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (succ x) =
      stepSucc (recZ a0 stepSucc stepPred x) := by
  intro x
  cases x with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero =>
          change a0 = stepSucc (stepPred a0)
          rw [rightInverse]
      | pred n' =>
          change recN a0 stepPred n' = stepSucc (stepPred (recN a0 stepPred n'))
          rw [rightInverse]

theorem recZ_pred {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (pred x) =
      stepPred (recZ a0 stepSucc stepPred x) := by
  intro x
  cases x with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero =>
          change a0 = stepPred (stepSucc a0)
          rw [leftInverse]
      | succ p' =>
          change recP a0 stepSucc p' = stepPred (stepSucc (recP a0 stepSucc p'))
          rw [leftInverse]
  | neg n => rfl

theorem recursion_exists {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∃ h : Z → α,
      h zero = a0 ∧
      (∀ x, h (succ x) = stepSucc (h x)) ∧
      (∀ x, h (pred x) = stepPred (h x)) := by
  refine ⟨recZ a0 stepSucc stepPred, ?_, ?_, ?_⟩
  · rfl
  · exact recZ_succ a0 stepSucc stepPred rightInverse
  · exact recZ_pred a0 stepSucc stepPred leftInverse

def add (x : Z) : Z → Z
  | zero => x
  | pos p =>
      let rec addP : P → Z
        | P.succZero => succ x
        | P.succ p' => succ (addP p')
      addP p
  | neg n =>
      let rec addN : N → Z
        | N.predZero => pred x
        | N.pred n' => pred (addN n')
      addN n

instance : Add Z where
  add := add

theorem add_succ (x y : Z) : x + succ y = succ (x + y) := by
  cases y with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero =>
          change x = succ (pred x)
          rw [succ_pred]
      | pred n' =>
          change x + neg n' = succ (pred (x + neg n'))
          rw [succ_pred]

theorem add_pred (x y : Z) : x + pred y = pred (x + y) := by
  cases y with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero =>
          change x = pred (succ x)
          rw [pred_succ]
      | succ p' =>
          change x + pos p' = pred (succ (x + pos p'))
          rw [pred_succ]
  | neg n => rfl

def negZ : Z → Z
  | zero => zero
  | pos p =>
      let rec flipP : P → N
        | P.succZero => N.predZero
        | P.succ p' => N.pred (flipP p')
      neg (flipP p)
  | neg n =>
      let rec flipN : N → P
        | N.predZero => P.succZero
        | N.pred n' => P.succ (flipN n')
      pos (flipN n)

instance : Neg Z where
  neg := negZ

def mul (x : Z) : Z → Z
  | zero => zero
  | pos p =>
      let rec mulP : P → Z
        | P.succZero => x
        | P.succ p' => mulP p' + x
      mulP p
  | neg n =>
      let rec mulN : N → Z
        | N.predZero => -x
        | N.pred n' => mulN n' + -x
      mulN n

instance : Mul Z where
  mul := mul

theorem mul_zero (x : Z) : x * zero = zero := rfl

theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x := rfl

theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x := rfl

theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x := rfl

theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x := rfl

end TwoSidedSuccessor
end Polish
end Integers
end VolumeII
end LRA
