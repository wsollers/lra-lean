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

theorem pos_add {x y : Z} (hx : Pos x) (hy : Pos y) : Pos (x + y) := by
  obtain ⟨p, rfl⟩ := hx
  induction p with
  | succZero =>
      obtain ⟨q, rfl⟩ := hy
      refine ⟨P.succ q, ?_⟩
      show Z.pos P.succZero + Z.pos q = Z.pos (P.succ q)
      rw [show Z.pos P.succZero = succ Z.zero from rfl, succ_add, zero_add]
      rfl
  | succ p' ih =>
      obtain ⟨r, hr⟩ := ih
      refine ⟨P.succ r, ?_⟩
      show Z.pos (P.succ p') + y = Z.pos (P.succ r)
      rw [show Z.pos (P.succ p') = succ (Z.pos p') from rfl, succ_add, hr]
      rfl

theorem isNeg_neg_of_pos {x : Z} (h : Pos x) : IsNeg (-x) := by
  obtain ⟨p, rfl⟩ := h
  induction p with
  | succZero =>
      exact ⟨N.predZero, by
        rw [show Z.pos P.succZero = succ Z.zero from rfl, neg_succ, neg_zero]
        rfl⟩
  | succ p' ih =>
      obtain ⟨n, hn⟩ := ih
      exact ⟨N.pred n, by
        rw [show Z.pos (P.succ p') = succ (Z.pos p') from rfl, neg_succ, hn]
        rfl⟩

theorem pos_neg_of_isNeg {x : Z} (h : IsNeg x) : Pos (-x) := by
  obtain ⟨n, rfl⟩ := h
  induction n with
  | predZero =>
      exact ⟨P.succZero, by
        rw [show Z.neg N.predZero = pred Z.zero from rfl, neg_pred, neg_zero]
        rfl⟩
  | pred n' ih =>
      obtain ⟨p, hp⟩ := ih
      exact ⟨P.succ p, by
        rw [show Z.neg (N.pred n') = pred (Z.neg n') from rfl, neg_pred, hp]
        rfl⟩

theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x := by
  constructor
  · intro h
    rcases trichotomy x with hz | hp | hn
    · exfalso
      rw [hz, neg_zero] at h
      exact not_pos_zero h
    · exfalso
      have h2 := isNeg_neg_of_pos hp
      obtain ⟨p, hp2⟩ := h
      obtain ⟨n, hn2⟩ := h2
      rw [hp2] at hn2
      injection hn2
    · exact hn
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

theorem lt_trans {x y z : Z} (hxy : x < y) (hyz : y < z) : x < z := by
  have h := pos_add hxy hyz
  have heq : (y + (-x)) + (z + (-y)) = z + (-x) := by
    calc
      (y + -x) + (z + -y)
          = (z + -y) + (y + -x) := add_comm _ _
      _ = z + (-y + (y + -x)) := add_assoc z (-y) (y + -x)
      _ = z + ((-y + y) + -x) := by rw [add_assoc]
      _ = z + (Z.zero + -x) := by rw [neg_add_self]
      _ = z + -x := by rw [zero_add]
  rw [lt_def]
  rw [heq] at h
  exact h

theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x := by
  rcases trichotomy (y + (-x)) with hz | hp | hn
  · right
    left
    have hzAdd := congrArg (fun w => w + x) hz
    have hyx : y = x := by
      calc
        y = y + Z.zero := (add_zero y).symm
        _ = y + (-x + x) := by rw [neg_add_self]
        _ = (y + -x) + x := (add_assoc y (-x) x).symm
        _ = Z.zero + x := hzAdd
        _ = x := zero_add x
    exact hyx.symm
  · left
    exact hp
  · right
    right
    have h2 := pos_neg_of_isNeg hn
    have heq : -(y + -x) = x + -y := by
      rw [neg_add, neg_neg, add_comm]
    rw [lt_def, ← heq]
    exact h2

theorem lt_succ_self (x : Z) : x < succ x := by
  rw [lt_def, succ_add, add_neg_self]
  exact ⟨P.succZero, rfl⟩

theorem pred_lt_self (x : Z) : pred x < x := by
  rw [lt_def, neg_pred, add_succ, add_neg_self]
  exact ⟨P.succZero, rfl⟩

theorem add_lt_add_right {x y : Z} (h : x < y) (z : Z) : x + z < y + z := by
  have heq : (y + z) + -(x + z) = y + -x := by
    rw [neg_add]
    calc
      (y + z) + (-x + -z)
          = y + (z + (-x + -z)) := add_assoc y z (-x + -z)
      _ = y + (z + (-z + -x)) := by rw [add_comm (-x) (-z)]
      _ = y + ((z + -z) + -x) := by rw [add_assoc]
      _ = y + (Z.zero + -x) := by rw [add_neg_self]
      _ = y + -x := by rw [zero_add]
  rw [lt_def, heq]
  exact h

theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y := Iff.rfl

theorem le_refl (x : Z) : x ≤ x := Or.inl rfl

theorem lt_of_le_of_lt {x y z : Z} (hxy : x ≤ y) (hyz : y < z) : x < z := by
  rcases hxy with rfl | h
  · exact hyz
  · exact lt_trans h hyz

theorem le_antisymm {x y : Z} (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  rcases hxy with rfl | h1
  · rfl
  · rcases hyx with rfl | h2
    · rfl
    · exact absurd (lt_trans h1 h2) (lt_irrefl x)

theorem pos_mul {x y : Z} (hx : Pos x) (hy : Pos y) : Pos (x * y) := by
  obtain ⟨p, rfl⟩ := hx
  induction p with
  | succZero =>
      show Pos (Z.pos P.succZero * y)
      rw [show Z.pos P.succZero = one from rfl, one_mul]
      exact hy
  | succ p' ih =>
      show Pos (Z.pos (P.succ p') * y)
      rw [show Z.pos (P.succ p') = succ (Z.pos p') from rfl, succ_mul]
      exact pos_add ih hy

theorem mul_lt_mul_pos_right {x y z : Z} (hxy : x < y) (hz : Pos z) :
    x * z < y * z := by
  have h := pos_mul hxy hz
  have heq : (y + -x) * z = y * z + -(x * z) := by
    rw [distrib_right, neg_mul]
  rw [lt_def, ← heq]
  exact h

end TwoSidedSuccessor
end Polish
end Integers
end VolumeII
end LRA
