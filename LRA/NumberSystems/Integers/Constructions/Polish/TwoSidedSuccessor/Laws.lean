-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Laws.lean
-- Ring and order laws for the two-sided successor integers.

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Operations

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/-!
Volume II label: integers-polish-landau-workup
Lean module: LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Laws
Verification status: checked algebraic core

Moved from `LandauWorkup`, which extended the two-sided successor
construction with the additive algebra, negation algebra, first
multiplicative clauses, and order structure needed for a Landau-style
integer workup. `succ_injective`/`pred_injective`/`twoSidedInduction`/
`recursion_unique` and the distinguished element `one` moved to
`WellFoundedness.lean`/`Carrier.lean` respectively, per §1.6.1's pipeline
split.
-/

/--
**[Theorem — add_zero]**

Logical form:

```lean
theorem add_zero (x : Z) : x + Z.zero = x
```
-/
theorem add_zero (x : Z) : x + Z.zero = x := rfl

/--
**[Theorem — succ_pred_comm]**

Logical form:

```lean
theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w)
```
-/
theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w) := by
  rw [succ_pred, pred_succ]

/--
**[Theorem — zero_add]**

Logical form:

```lean
theorem zero_add (x : Z) : Z.zero + x = x
```
-/
theorem zero_add (x : Z) : Z.zero + x = x := by
  apply twoSidedInduction (fun x => Z.zero + x = x)
  · rfl
  · intro x ih
    rw [add_succ, ih]
  · intro x ih
    rw [add_pred, ih]

/--
**[Theorem — succ_add]**

Logical form:

```lean
theorem succ_add (x y : Z) : succ x + y = succ (x + y)
```
-/
theorem succ_add (x y : Z) : succ x + y = succ (x + y) := by
  revert y
  apply twoSidedInduction
  · rfl
  · intro y ih
    rw [add_succ, ih, add_succ]
  · intro y ih
    rw [add_pred, ih, add_pred, succ_pred_comm]

/--
**[Theorem — pred_add]**

Logical form:

```lean
theorem pred_add (x y : Z) : pred x + y = pred (x + y)
```
-/
theorem pred_add (x y : Z) : pred x + y = pred (x + y) := by
  revert y
  apply twoSidedInduction
  · rfl
  · intro y ih
    rw [add_succ, ih, add_succ, succ_pred_comm]
  · intro y ih
    rw [add_pred, ih, add_pred]

/--
**[Theorem — add_comm]**

Logical form:

```lean
theorem add_comm (x y : Z) : x + y = y + x
```
-/
theorem add_comm (x y : Z) : x + y = y + x := by
  revert y
  apply twoSidedInduction
  · rw [add_zero, zero_add]
  · intro y ih
    rw [add_succ, ih, succ_add]
  · intro y ih
    rw [add_pred, ih, pred_add]

/--
**[Theorem — add_assoc]**

Logical form:

```lean
theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z)
```
-/
theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z) := by
  revert z
  apply twoSidedInduction
  · rfl
  · intro z ih
    rw [add_succ, add_succ, ih, add_succ]
  · intro z ih
    rw [add_pred, add_pred, ih, add_pred]

/--
**[Theorem — neg_zero]**

Logical form:

```lean
theorem neg_zero : (-Z.zero : Z) = Z.zero
```
-/
theorem neg_zero : (-Z.zero : Z) = Z.zero := rfl

/--
**[Theorem — neg_succ]**

Logical form:

```lean
theorem neg_succ (x : Z) : -(succ x) = pred (-x)
```
-/
theorem neg_succ (x : Z) : -(succ x) = pred (-x) := by
  cases x with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero => rfl
      | pred n' => rfl

/--
**[Theorem — neg_pred]**

Logical form:

```lean
theorem neg_pred (x : Z) : -(pred x) = succ (-x)
```
-/
theorem neg_pred (x : Z) : -(pred x) = succ (-x) := by
  cases x with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero => rfl
      | succ p' => rfl
  | neg n => rfl

/--
**[Theorem — neg_neg]**

Logical form:

```lean
theorem neg_neg (x : Z) : -(-x) = x
```
-/
theorem neg_neg (x : Z) : -(-x) = x := by
  apply twoSidedInduction (fun x => -(-x) = x)
  · rfl
  · intro x ih
    rw [neg_succ, neg_pred, ih]
  · intro x ih
    rw [neg_pred, neg_succ, ih]

/--
**[Theorem — add_neg_self]**

Logical form:

```lean
theorem add_neg_self (x : Z) : x + (-x) = Z.zero
```
-/
theorem add_neg_self (x : Z) : x + (-x) = Z.zero := by
  apply twoSidedInduction (fun x => x + (-x) = Z.zero)
  · rfl
  · intro x ih
    rw [neg_succ, add_pred, succ_add, ih, pred_succ]
  · intro x ih
    rw [neg_pred, add_succ, pred_add, ih, succ_pred]

/--
**[Theorem — neg_add_self]**

Logical form:

```lean
theorem neg_add_self (x : Z) : (-x) + x = Z.zero
```
-/
theorem neg_add_self (x : Z) : (-x) + x = Z.zero := by
  rw [add_comm, add_neg_self]

/--
**[Theorem — neg_add]**

Logical form:

```lean
theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y)
```
-/
theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y) := by
  revert y
  apply twoSidedInduction
  · rw [add_zero, neg_zero, add_zero]
  · intro y ih
    rw [add_succ, neg_succ, ih, neg_succ, add_pred]
  · intro y ih
    rw [add_pred, neg_pred, ih, neg_pred, add_succ]

/--
**[Theorem — mul_succ]**

Logical form:

```lean
theorem mul_succ (x y : Z) : x * succ y = x * y + x
```
-/
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

/--
**[Theorem — mul_pred]**

Logical form:

```lean
theorem mul_pred (x y : Z) : x * pred y = x * y + (-x)
```
-/
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

/--
**[Theorem — zero_mul]**

Logical form:

```lean
theorem zero_mul (x : Z) : Z.zero * x = Z.zero
```
-/
theorem zero_mul (x : Z) : Z.zero * x = Z.zero := by
  apply twoSidedInduction (fun x => Z.zero * x = Z.zero)
  · rfl
  · intro x ih
    rw [mul_succ, ih, add_zero]
  · intro x ih
    rw [mul_pred, ih, neg_zero, add_zero]

/--
**[Theorem — add_one]**

Logical form:

```lean
theorem add_one (x : Z) : x + one = succ x
```
-/
theorem add_one (x : Z) : x + one = succ x := by
  show x + succ Z.zero = succ x
  rw [add_succ, add_zero]

/--
**[Theorem — neg_one_eq]**

Logical form:

```lean
theorem neg_one_eq : (-one : Z) = pred Z.zero
```
-/
theorem neg_one_eq : (-one : Z) = pred Z.zero := by
  show -(succ Z.zero) = pred Z.zero
  rw [neg_succ, neg_zero]

/--
**[Theorem — add_neg_one]**

Logical form:

```lean
theorem add_neg_one (x : Z) : x + (-one) = pred x
```
-/
theorem add_neg_one (x : Z) : x + (-one) = pred x := by
  rw [neg_one_eq, add_pred, add_zero]

/--
**[Theorem — one_mul]**

Logical form:

```lean
theorem one_mul (x : Z) : one * x = x
```
-/
theorem one_mul (x : Z) : one * x = x := by
  apply twoSidedInduction (fun x => one * x = x)
  · rfl
  · intro x ih
    rw [mul_succ, ih, add_one]
  · intro x ih
    rw [mul_pred, ih, add_neg_one]

/--
**[Theorem — succ_mul]**

Logical form:

```lean
theorem succ_mul (x y : Z) : succ x * y = x * y + y
```
-/
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

/--
**[Theorem — pred_mul]**

Logical form:

```lean
theorem pred_mul (x y : Z) : pred x * y = x * y + (-y)
```
-/
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

/--
**[Theorem — mul_comm]**

Logical form:

```lean
theorem mul_comm (x y : Z) : x * y = y * x
```
-/
theorem mul_comm (x y : Z) : x * y = y * x := by
  apply twoSidedInduction (fun y => x * y = y * x)
  · rw [mul_zero, zero_mul]
  · intro y ih
    rw [mul_succ, ih, succ_mul]
  · intro y ih
    rw [mul_pred, ih, pred_mul]

/-- Rearrangement helper: `(a+b)+(c+d) = (a+c)+(b+d)`.

Logical form:

```lean
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d)
```
-/
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d) := by
  rw [add_assoc, ← add_assoc b c d, add_comm b c, add_assoc, ← add_assoc]

/--
**[Theorem — distrib_right]**

Logical form:

```lean
theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c
```
-/
theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c := by
  revert c
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, mul_zero, add_zero]
  · intro c ih
    rw [mul_succ, ih, mul_succ, mul_succ, add_add_comm]
  · intro c ih
    rw [mul_pred, ih, mul_pred, mul_pred, neg_add, add_add_comm]

/--
**[Theorem — distrib_left]**

Logical form:

```lean
theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c
```
-/
theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c := by
  rw [mul_comm a (b + c), distrib_right, mul_comm b a, mul_comm c a]

/--
**[Theorem — mul_neg]**

Logical form:

```lean
theorem mul_neg (x y : Z) : x * (-y) = -(x * y)
```
-/
theorem mul_neg (x y : Z) : x * (-y) = -(x * y) := by
  apply twoSidedInduction (fun y => x * (-y) = -(x * y))
  · rw [neg_zero, mul_zero]
    exact neg_zero.symm
  · intro y ih
    rw [neg_succ, mul_pred, ih, mul_succ, neg_add]
  · intro y ih
    rw [neg_pred, mul_succ, ih, mul_pred, neg_add, neg_neg]

/--
**[Theorem — neg_mul]**

Logical form:

```lean
theorem neg_mul (x y : Z) : (-x) * y = -(x * y)
```
-/
theorem neg_mul (x y : Z) : (-x) * y = -(x * y) := by
  rw [mul_comm, mul_neg, mul_comm]

/--
**[Theorem — mul_assoc]**

Logical form:

```lean
theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z)
```
-/
theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z) := by
  revert z
  apply twoSidedInduction
  · rw [mul_zero, mul_zero, mul_zero]
  · intro z ih
    rw [mul_succ, ih, mul_succ, distrib_left]
  · intro z ih
    rw [mul_pred, ih, mul_pred, distrib_left, ← mul_neg]

/-- `Pos z` means `z` lies on the positive ray.

Logical form:

```lean
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p
```
-/
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p

/-- `IsNeg z` means `z` lies on the negative ray.

Logical form:

```lean
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n
```
-/
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n

/--
**[Theorem — not_pos_zero]**

Logical form:

```lean
theorem not_pos_zero : ¬ Pos Z.zero
```
-/
theorem not_pos_zero : ¬ Pos Z.zero := by
  rintro ⟨p, hp⟩
  injection hp

/--
**[Theorem — not_isNeg_zero]**

Logical form:

```lean
theorem not_isNeg_zero : ¬ IsNeg Z.zero
```
-/
theorem not_isNeg_zero : ¬ IsNeg Z.zero := by
  rintro ⟨n, hn⟩
  injection hn

/--
**[Theorem — not_pos_and_isNeg]**

Logical form:

```lean
theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z)
```
-/
theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z) := by
  rintro ⟨⟨p, hp⟩, ⟨n, hn⟩⟩
  rw [hp] at hn
  injection hn

/--
**[Theorem — trichotomy]**

Logical form:

```lean
theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z
```
-/
theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z := by
  cases z with
  | zero => exact Or.inl rfl
  | pos p => exact Or.inr (Or.inl ⟨p, rfl⟩)
  | neg n => exact Or.inr (Or.inr ⟨n, rfl⟩)

/--
**[Theorem — pos_add]**

Logical form:

```lean
theorem pos_add {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x + y)
```
-/
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

/--
**[Theorem — isNeg_neg_of_pos]**

Logical form:

```lean
theorem isNeg_neg_of_pos {x : Z} (positiveInput : Pos x) : IsNeg (-x)
```
-/
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

/--
**[Theorem — pos_neg_of_isNeg]**

Logical form:

```lean
theorem pos_neg_of_isNeg {x : Z} (negativeInput : IsNeg x) : Pos (-x)
```
-/
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

/--
**[Theorem — pos_neg_iff_isNeg]**

Logical form:

```lean
theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x
```
-/
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

/--
**[Def — lt]**

Logical form:

```lean
def lt (x y : Z) : Prop := Pos (y + (-x))
```
-/
def lt (x y : Z) : Prop := Pos (y + (-x))

instance : LT Z where
  lt := lt

/--
**[Def — le]**

Logical form:

```lean
def le (x y : Z) : Prop := x = y ∨ x < y
```
-/
def le (x y : Z) : Prop := x = y ∨ x < y

instance : LE Z where
  le := le

/--
**[Theorem — lt_def]**

Logical form:

```lean
theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x))
```
-/
theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x)) := Iff.rfl

/--
**[Theorem — pos_of_zero_lt]**

Logical form:

```lean
theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x
```
-/
theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x := by
  intro h
  rw [lt_def, neg_zero, add_zero] at h
  exact h

/--
**[Theorem — lt_irrefl]**

Logical form:

```lean
theorem lt_irrefl (x : Z) : ¬ x < x
```
-/
theorem lt_irrefl (x : Z) : ¬ x < x := by
  rw [lt_def, add_neg_self]
  exact not_pos_zero

/--
**[Theorem — lt_trans]**

Logical form:

```lean
theorem lt_trans {x y z : Z} (firstLessSecond : x < y) (secondLessThird : y < z) : x < z
```
-/
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

/--
**[Theorem — lt_trichotomy]**

Logical form:

```lean
theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x
```
-/
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

/--
**[Theorem — lt_succ_self]**

Logical form:

```lean
theorem lt_succ_self (x : Z) : x < succ x
```
-/
theorem lt_succ_self (x : Z) : x < succ x := by
  rw [lt_def, succ_add, add_neg_self]
  exact ⟨P.succZero, rfl⟩

/--
**[Theorem — pred_lt_self]**

Logical form:

```lean
theorem pred_lt_self (x : Z) : pred x < x
```
-/
theorem pred_lt_self (x : Z) : pred x < x := by
  rw [lt_def, neg_pred, add_succ, add_neg_self]
  exact ⟨P.succZero, rfl⟩

/--
**[Theorem — add_lt_add_right]**

Logical form:

```lean
theorem add_lt_add_right {x y : Z} (firstLessSecond : x < y) (z : Z) : x + z < y + z
```
-/
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

/--
**[Theorem — le_iff]**

Logical form:

```lean
theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y
```
-/
theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y := Iff.rfl

/--
**[Theorem — le_refl]**

Logical form:

```lean
theorem le_refl (x : Z) : x ≤ x
```
-/
theorem le_refl (x : Z) : x ≤ x := Or.inl rfl

/--
**[Theorem — lt_of_le_of_lt]**

Logical form:

```lean
theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z
```
-/
theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z := by
  rcases firstLeSecond with rfl | firstLessSecond
  · exact secondLessThird
  · exact lt_trans firstLessSecond secondLessThird

/--
**[Theorem — le_antisymm]**

Logical form:

```lean
theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y
```
-/
theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y := by
  rcases firstLeSecond with rfl | firstLessSecond
  · rfl
  · rcases secondLeFirst with rfl | secondLessFirst
    · rfl
    · exact absurd (lt_trans firstLessSecond secondLessFirst) (lt_irrefl x)

/--
**[Theorem — pos_mul]**

Logical form:

```lean
theorem pos_mul {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x * y)
```
-/
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

/--
**[Theorem — mul_lt_mul_pos_right]**

Logical form:

```lean
theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z
```
-/
theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z := by
  have productDifferencePositive := pos_mul firstLessSecond multiplierPositive
  have productDifferenceEquality : (y + -x) * z = y * z + -(x * z) := by
    rw [distrib_right, neg_mul]
  rw [lt_def, ← productDifferenceEquality]
  exact productDifferencePositive

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
