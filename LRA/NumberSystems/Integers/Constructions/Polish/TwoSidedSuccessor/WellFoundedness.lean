
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Carrier

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
`pred_succ` TODO

Predicate logic:

  (∀ x ∈ Z), pred (succ x) = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ.match_1 (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) n (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) x) = x

Logical form (Lean):

```lean
theorem pred_succ (x : Z) : pred (succ x) = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem pred_succ (x : Z) : pred (succ x) = x := by
  sorry

/--
`succ_pred` TODO

Predicate logic:

  (∀ x ∈ Z), succ (pred x) = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred.match_1 (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) p (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = x

Logical form (Lean):

```lean
theorem succ_pred (x : Z) : succ (pred x) = x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem succ_pred (x : Z) : succ (pred x) = x := by
  sorry

/--
`recP` TODO

Predicate logic:

  def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)

Predicate logic (unfolded):

  def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def recP {α : Type} (a0 : α) (step : α → α) : P → α
  | P.succZero => step a0
  | P.succ p => step (recP a0 step p)

/--
`recN` TODO

Predicate logic:

  def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)

Predicate logic (unfolded):

  def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def recN {α : Type} (a0 : α) (step : α → α) : N → α
  | N.predZero => step a0
  | N.pred n => step (recN a0 step n)

/--
`recZ` TODO

Predicate logic:

  def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n

Predicate logic (unfolded):

  def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def recZ {α : Type} (a0 : α) (stepSucc stepPred : α → α) : Z → α
  | zero => a0
  | pos p => recP a0 stepSucc p
  | neg n => recN a0 stepPred n

/--
`recZ_zero` TODO

Predicate logic:

  recZ a0 stepSucc stepPred zero = a0

Predicate logic (unfolded):

  ∀ {α : Type} (a0 : α) (stepSucc stepPred : α → α), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => a0) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recP a0 stepSucc p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recN a0 stepPred n) a) a) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = a0

Logical form (Lean):

```lean
theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem recZ_zero {α : Type} (a0 : α) (stepSucc stepPred : α → α) :
    recZ a0 stepSucc stepPred zero = a0 := by
  sorry

/--
`recZ_succ` TODO

Predicate logic:

  (∀ a, stepSucc (stepPred a) = a) → ∀ x : Z, recZ a0 stepSucc stepPred (succ x) = stepSucc (recZ a0 stepSucc stepPred x)

Predicate logic (unfolded):

  ∀ {α : Type} (a0 : α) (stepSucc stepPred : α → α), (∀ (a : α), stepSucc (stepPred a) = a) → ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => a0) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recP a0 stepSucc p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recN a0 stepPred n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ.match_1 (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) n (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) x) = stepSucc (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => a0) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recP a0 stepSucc p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recN a0 stepPred n) a) a) x)

Logical form (Lean):

```lean
theorem recZ_succ {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (succ x) =
      stepSucc (recZ a0 stepSucc stepPred x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem recZ_succ {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (succ x) =
      stepSucc (recZ a0 stepSucc stepPred x) := by
  sorry

/--
`recZ_pred` TODO

Predicate logic:

  (∀ a, stepPred (stepSucc a) = a) → ∀ x : Z, recZ a0 stepSucc stepPred (pred x) = stepPred (recZ a0 stepSucc stepPred x)

Predicate logic (unfolded):

  ∀ {α : Type} (a0 : α) (stepSucc stepPred : α → α), (∀ (a : α), stepPred (stepSucc a) = a) → ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => a0) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recP a0 stepSucc p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recN a0 stepPred n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred.match_1 (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) p (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = stepPred (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => a0) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recP a0 stepSucc p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.recN a0 stepPred n) a) a) x)

Logical form (Lean):

```lean
theorem recZ_pred {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (pred x) =
      stepPred (recZ a0 stepSucc stepPred x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem recZ_pred {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a) :
    ∀ x : Z, recZ a0 stepSucc stepPred (pred x) =
      stepPred (recZ a0 stepSucc stepPred x) := by
  sorry

/--
`recursion_exists` TODO

Predicate logic:

  (∀ a, stepPred (stepSucc a) = a ∧ ∀ a, stepSucc (stepPred a) = a) → ∃ h ∈ Z → α, h zero = a0 ∧ (∀ x, h (succ x) = stepSucc (h x)) ∧ (∀ x, h (pred x) = stepPred (h x))

Predicate logic (unfolded):

  ∀ {α : Type} (a0 : α) (stepSucc stepPred : α → α), (∀ (a : α), stepPred (stepSucc a) = a ∧ ∀ (a : α), stepSucc (stepPred a) = a) → Exists fun h => (h LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = a0 ∧ (∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), h (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) = stepSucc (h x) ∧ ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), h (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = stepPred (h x)))

Logical form (Lean):

```lean
theorem recursion_exists {α : Type} (a0 : α) (stepSucc stepPred : α → α)
    (leftInverse : ∀ a, stepPred (stepSucc a) = a)
    (rightInverse : ∀ a, stepSucc (stepPred a) = a) :
    ∃ h : Z → α,
      h zero = a0 ∧
      (∀ x, h (succ x) = stepSucc (h x)) ∧
      (∀ x, h (pred x) = stepPred (h x))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

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
`succ_injective` TODO

Predicate logic:

  (succ x = succ y) → x = y

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) y → x = y

Logical form (Lean):

```lean
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem succ_injective {x y : Z} (successorEquality : succ x = succ y) : x = y := by
  sorry

/--
`pred_injective` TODO

Predicate logic:

  (pred x = pred y) → x = y

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) y → x = y

Logical form (Lean):

```lean
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem pred_injective {x y : Z} (predecessorEquality : pred x = pred y) : x = y := by
  sorry

/--
`twoSidedInduction` TODO

Predicate logic:

  (Z → Prop ∧ ∀ x, A x → A (succ x) ∧ ∀ x, A x → A (pred x)) → ∀ x, A x

Predicate logic (unfolded):

  ∀ (A : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z → Prop), (A LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero ∧ (∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), A x → A (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) ∧ ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), A x → A (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x))) → ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), A x

Logical form (Lean):

```lean
theorem twoSidedInduction
    (A : Z → Prop)
    (zeroCase : A Z.zero)
    (succStep : ∀ x, A x → A (succ x))
    (predStep : ∀ x, A x → A (pred x)) :
    ∀ x, A x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem twoSidedInduction
    (A : Z → Prop)
    (zeroCase : A Z.zero)
    (succStep : ∀ x, A x → A (succ x))
    (predStep : ∀ x, A x → A (pred x)) :
    ∀ x, A x := by
  sorry

/--
`recursion_unique` TODO

Predicate logic:

  (firstFunction Z.zero = a0 ∧ ∀ x, firstFunction (succ x) = stepSucc (firstFunction x) ∧ ∀ x, firstFunction (pred x) = stepPred (firstFunction x) ∧ secondFunction Z.zero = a0 ∧ ∀ x, secondFunction (succ x) = stepSucc (secondFunction x) ∧ ∀ x, secondFunction (pred x) = stepPred (secondFunction x)) → ∀ x, firstFunction x = secondFunction x

Predicate logic (unfolded):

  ∀ {α : Type} (a0 : α) (stepSucc stepPred : α → α) (firstFunction secondFunction : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z → α), (firstFunction LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = a0 ∧ (∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), firstFunction (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) = stepSucc (firstFunction x) ∧ (∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), firstFunction (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = stepPred (firstFunction x) ∧ (secondFunction LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = a0 ∧ (∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), secondFunction (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) = stepSucc (secondFunction x) ∧ ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), secondFunction (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = stepPred (secondFunction x)))))) → ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), firstFunction x = secondFunction x

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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
