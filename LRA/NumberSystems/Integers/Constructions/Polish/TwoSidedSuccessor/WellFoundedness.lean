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
  sorry

/--
**[Theorem — succ_pred]**

Logical form:

```lean
theorem succ_pred (x : Z) : succ (pred x) = x
```
-/
theorem succ_pred (x : Z) : succ (pred x) = x := by
  sorry

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
    recZ a0 stepSucc stepPred zero = a0 := by
  sorry

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
  sorry

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
  sorry

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
  sorry

/--
**[Theorem — succ_injective]**

Moved from `LandauWorkup`.

Logical form:

```lean
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y
```
-/
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y := by
  sorry

/--
**[Theorem — pred_injective]**

Moved from `LandauWorkup`.

Logical form:

```lean
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y
```
-/
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y := by
  sorry

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
  sorry

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
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
