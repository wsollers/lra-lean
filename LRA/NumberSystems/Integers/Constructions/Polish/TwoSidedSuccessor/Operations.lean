-- LRA/NumberSystems/Integers/Constructions/Polish/TwoSidedSuccessor/Operations.lean
-- Addition, negation, and multiplication, defined directly on `Z`.

import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.WellFoundedness

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
**[Def — add]**

Logical form:

```lean
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
```
-/
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

/--
**[Theorem — add_succ]**

Logical form:

```lean
theorem add_succ (x y : Z) : x + succ y = succ (x + y)
```
-/
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

/--
**[Theorem — add_pred]**

Logical form:

```lean
theorem add_pred (x y : Z) : x + pred y = pred (x + y)
```
-/
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

/--
**[Def — negZ]**

Logical form:

```lean
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
```
-/
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

/--
**[Def — mul]**

Logical form:

```lean
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
```
-/
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

/--
**[Theorem — mul_zero]**

Logical form:

```lean
theorem mul_zero (x : Z) : x * zero = zero
```
-/
theorem mul_zero (x : Z) : x * zero = zero := rfl

/--
**[Theorem — mul_pos_succZero]**

Logical form:

```lean
theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x
```
-/
theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x := rfl

/--
**[Theorem — mul_pos_succ]**

Logical form:

```lean
theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x
```
-/
theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x := rfl

/--
**[Theorem — mul_neg_predZero]**

Logical form:

```lean
theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x
```
-/
theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x := rfl

/--
**[Theorem — mul_neg_pred]**

Logical form:

```lean
theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x
```
-/
theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x := rfl

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
