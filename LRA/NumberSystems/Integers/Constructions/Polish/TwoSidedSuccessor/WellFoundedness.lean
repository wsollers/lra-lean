-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/WellFoundedness.lean
-- The induction and recursion principles the two-sided successor carrier
-- supports.

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Carrier

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
**[Theorem — pred_succ]**

Logical form:

```lean
theorem pred_succ (x : Z) : pred (succ x) = x
```
-/
theorem pred_succ (x : Z) : pred (succ x) = x := by
  cases x with
  | zero => rfl
  | pos p => rfl
  | neg n =>
      cases n with
      | predZero => rfl
      | pred n' => rfl

/--
**[Theorem — succ_pred]**

Logical form:

```lean
theorem succ_pred (x : Z) : succ (pred x) = x
```
-/
theorem succ_pred (x : Z) : succ (pred x) = x := by
  cases x with
  | zero => rfl
  | pos p =>
      cases p with
      | succZero => rfl
      | succ p' => rfl
  | neg n => rfl

/--
**[Def — recP]**

Logical form:

```lean
def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)
```
-/
def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)

/--
**[Def — recN]**

Logical form:

```lean
def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)
```
-/
def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)

/--
**[Def — recZ]**

Logical form:

```lean
def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n
```
-/
def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n

/--
**[Theorem — recZ_zero]**

Logical form:

```lean
theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0
```
-/
theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0 := rfl

/--
**[Theorem — recZ_succ]**

Logical form:

```lean
theorem recZ_succ {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (succ x) =
      stepSucc (recZ a0 stepSucc stepPred x)
```
-/
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

/--
**[Theorem — recZ_pred]**

Logical form:

```lean
theorem recZ_pred {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (pred x) =
      stepPred (recZ a0 stepSucc stepPred x)
```
-/
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

/--
**[Theorem — recursion_exists]**

Logical form:

```lean
theorem recursion_exists {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∃ h : Z → α,
      h zero = a0 ∧
      (∀ x, h (succ x) = stepSucc (h x)) ∧
      (∀ x, h (pred x) = stepPred (h x))
```
-/
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

/--
**[Theorem — succ_injective]**

Moved from `LandauWorkup`.

Logical form:

```lean
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y
```
-/
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y := by
  have inverseEquality := congrArg pred successorEquality
  rw [pred_succ, pred_succ] at inverseEquality
  exact inverseEquality

/--
**[Theorem — pred_injective]**

Moved from `LandauWorkup`.

Logical form:

```lean
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y
```
-/
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y := by
  have inverseEquality := congrArg succ predecessorEquality
  rw [succ_pred, succ_pred] at inverseEquality
  exact inverseEquality

/-- Two-sided induction, proved from the structural definition of `Z`.
Moved from `LandauWorkup`.

Mathematical statement (Lean): `theorem twoSidedInduction (A : Z → Prop) (zeroCase : A Z.zero) (succStep : ∀ x, A x → A (succ x)) (predStep : ∀ x, A x → A (pred x)) : ∀ x, A x`.


Logical form:

```lean
theorem twoSidedInduction
    (A : Z → Prop)
    (zeroCase : A Z.zero)
    (succStep : ∀ x, A x → A (succ x))
    (predStep : ∀ x, A x → A (pred x)) :
    ∀ x, A x
```
-/
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

/-- Recursion into a two-sided successor target is unique. Moved from
`LandauWorkup`.

Logical form:

```lean
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
    ∀ x, firstFunction x = secondFunction x
```
-/
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

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
