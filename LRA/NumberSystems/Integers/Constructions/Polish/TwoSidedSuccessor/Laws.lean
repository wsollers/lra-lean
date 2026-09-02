
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Operations

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
`add_zero` TODO

Predicate logic:

  (∀ x ∈ Z), x + Z.zero = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = x

Logical form (Lean):

```lean
theorem add_zero (x : Z) : x + Z.zero = x
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
theorem add_zero (x : Z) : x + Z.zero = x := by
  sorry
/--
`succ_pred_comm` TODO

Predicate logic:

  (∀ w ∈ Z), succ (pred w) = pred (succ w)

Predicate logic (unfolded):

  ∀ (w : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred.match_1 (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) p (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) w) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ.match_1 (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) n (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) w)

Logical form (Lean):

```lean
theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w)
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
theorem succ_pred_comm (w : Z) : succ (pred w) = pred (succ w) := by
  sorry
/--
`zero_add` TODO

Predicate logic:

  (∀ x ∈ Z), Z.zero + x = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = x

Logical form (Lean):

```lean
theorem zero_add (x : Z) : Z.zero + x = x
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
theorem zero_add (x : Z) : Z.zero + x = x := by
  sorry
/--
`succ_add` TODO

Predicate logic:

  (∀ x y ∈ Z), succ x + y = succ (x + y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (instHAdd.1 x y)

Logical form (Lean):

```lean
theorem succ_add (x y : Z) : succ x + y = succ (x + y)
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
theorem succ_add (x y : Z) : succ x + y = succ (x + y) := by
  sorry
/--
`pred_add` TODO

Predicate logic:

  (∀ x y ∈ Z), pred x + y = pred (x + y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (instHAdd.1 x y)

Logical form (Lean):

```lean
theorem pred_add (x y : Z) : pred x + y = pred (x + y)
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
theorem pred_add (x y : Z) : pred x + y = pred (x + y) := by
  sorry
/--
`add_comm` TODO

Predicate logic:

  (∀ x y ∈ Z), x + y = y + x

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x y = instHAdd.1 y x

Logical form (Lean):

```lean
theorem add_comm (x y : Z) : x + y = y + x
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
theorem add_comm (x y : Z) : x + y = y + x := by
  sorry
/--
`add_assoc` TODO

Predicate logic:

  (∀ x y z ∈ Z), (x + y) + z = x + (y + z)

Predicate logic (unfolded):

  ∀ (x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 (instHAdd.1 x y) z = instHAdd.1 x (instHAdd.1 y z)

Logical form (Lean):

```lean
theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z)
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
theorem add_assoc (x y z : Z) : (x + y) + z = x + (y + z) := by
  sorry
/--
`neg_zero` TODO

Predicate logic:

  -Z.zero ∈ Z = Z.zero

Predicate logic (unfolded):

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem neg_zero : (-Z.zero : Z) = Z.zero
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
theorem neg_zero : (-Z.zero : Z) = Z.zero := by
  sorry
/--
`neg_succ` TODO

Predicate logic:

  (∀ x ∈ Z), -(succ x) = pred (-x)

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x)

Logical form (Lean):

```lean
theorem neg_succ (x : Z) : -(succ x) = pred (-x)
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
theorem neg_succ (x : Z) : -(succ x) = pred (-x) := by
  sorry
/--
`neg_pred` TODO

Predicate logic:

  (∀ x ∈ Z), -(pred x) = succ (-x)

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x)

Logical form (Lean):

```lean
theorem neg_pred (x : Z) : -(pred x) = succ (-x)
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
theorem neg_pred (x : Z) : -(pred x) = succ (-x) := by
  sorry
/--
`neg_neg` TODO

Predicate logic:

  (∀ x ∈ Z), -(-x) = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) = x

Logical form (Lean):

```lean
theorem neg_neg (x : Z) : -(-x) = x
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
theorem neg_neg (x : Z) : -(-x) = x := by
  sorry
/--
`add_neg_self` TODO

Predicate logic:

  (∀ x ∈ Z), x + (-x) = Z.zero

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem add_neg_self (x : Z) : x + (-x) = Z.zero
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
theorem add_neg_self (x : Z) : x + (-x) = Z.zero := by
  sorry
/--
`neg_add_self` TODO

Predicate logic:

  (∀ x ∈ Z), (-x) + x = Z.zero

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem neg_add_self (x : Z) : (-x) + x = Z.zero
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
theorem neg_add_self (x : Z) : (-x) + x = Z.zero := by
  sorry
/--
`neg_add` TODO

Predicate logic:

  (∀ x y ∈ Z), -(x + y) = (-x) + (-y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (instHAdd.1 x y) = instHAdd.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 y)

Logical form (Lean):

```lean
theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y)
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
theorem neg_add (x y : Z) : -(x + y) = (-x) + (-y) := by
  sorry
/--
`mul_succ` TODO

Predicate logic:

  (∀ x y ∈ Z), x * succ y = x * y + x

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) y) = instHAdd.1 (instHMul.1 x y) x

Logical form (Lean):

```lean
theorem mul_succ (x y : Z) : x * succ y = x * y + x
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
theorem mul_succ (x y : Z) : x * succ y = x * y + x := by
  sorry
/--
`mul_pred` TODO

Predicate logic:

  (∀ x y ∈ Z), x * pred y = x * y + (-x)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) y) = instHAdd.1 (instHMul.1 x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x)

Logical form (Lean):

```lean
theorem mul_pred (x y : Z) : x * pred y = x * y + (-x)
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
theorem mul_pred (x y : Z) : x * pred y = x * y + (-x) := by
  sorry
/--
`zero_mul` TODO

Predicate logic:

  (∀ x ∈ Z), Z.zero * x = Z.zero

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem zero_mul (x : Z) : Z.zero * x = Z.zero
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
theorem zero_mul (x : Z) : Z.zero * x = Z.zero := by
  sorry
/--
`add_one` TODO

Predicate logic:

  (∀ x ∈ Z), x + one = succ x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x

Logical form (Lean):

```lean
theorem add_one (x : Z) : x + one = succ x
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
theorem add_one (x : Z) : x + one = succ x := by
  sorry
/--
`neg_one_eq` TODO

Predicate logic:

  -one ∈ Z = pred Z.zero

Predicate logic (unfolded):

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem neg_one_eq : (-one : Z) = pred Z.zero
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
theorem neg_one_eq : (-one : Z) = pred Z.zero := by
  sorry
/--
`add_neg_one` TODO

Predicate logic:

  (∀ x ∈ Z), x + (-one) = pred x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x

Logical form (Lean):

```lean
theorem add_neg_one (x : Z) : x + (-one) = pred x
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
theorem add_neg_one (x : Z) : x + (-one) = pred x := by
  sorry
/--
`one_mul` TODO

Predicate logic:

  (∀ x ∈ Z), one * x = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one x = x

Logical form (Lean):

```lean
theorem one_mul (x : Z) : one * x = x
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
theorem one_mul (x : Z) : one * x = x := by
  sorry
/--
`succ_mul` TODO

Predicate logic:

  (∀ x y ∈ Z), succ x * y = x * y + y

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) y = instHAdd.1 (instHMul.1 x y) y

Logical form (Lean):

```lean
theorem succ_mul (x y : Z) : succ x * y = x * y + y
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
theorem succ_mul (x y : Z) : succ x * y = x * y + y := by
  sorry
/--
`pred_mul` TODO

Predicate logic:

  (∀ x y ∈ Z), pred x * y = x * y + (-y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) y = instHAdd.1 (instHMul.1 x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 y)

Logical form (Lean):

```lean
theorem pred_mul (x y : Z) : pred x * y = x * y + (-y)
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
theorem pred_mul (x y : Z) : pred x * y = x * y + (-y) := by
  sorry
/--
`mul_comm` TODO

Predicate logic:

  (∀ x y ∈ Z), x * y = y * x

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x y = instHMul.1 y x

Logical form (Lean):

```lean
theorem mul_comm (x y : Z) : x * y = y * x
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
theorem mul_comm (x y : Z) : x * y = y * x := by
  sorry
/--
`add_add_comm` TODO

Predicate logic:

  (∀ a b c d ∈ Z), (a + b) + (c + d) = (a + c) + (b + d)

Predicate logic (unfolded):

  ∀ (a b c d : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 (instHAdd.1 a b) (instHAdd.1 c d) = instHAdd.1 (instHAdd.1 a c) (instHAdd.1 b d)

Logical form (Lean):

```lean
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d)
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
theorem add_add_comm (a b c d : Z) : (a + b) + (c + d) = (a + c) + (b + d) := by
  sorry
/--
`distrib_right` TODO

Predicate logic:

  (∀ a b c ∈ Z), (a + b) * c = a * c + b * c

Predicate logic (unfolded):

  ∀ (a b c : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 (instHAdd.1 a b) c = instHAdd.1 (instHMul.1 a c) (instHMul.1 b c)

Logical form (Lean):

```lean
theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c
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
theorem distrib_right (a b c : Z) : (a + b) * c = a * c + b * c := by
  sorry
/--
`distrib_left` TODO

Predicate logic:

  (∀ a b c ∈ Z), a * (b + c) = a * b + a * c

Predicate logic (unfolded):

  ∀ (a b c : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 a (instHAdd.1 b c) = instHAdd.1 (instHMul.1 a b) (instHMul.1 a c)

Logical form (Lean):

```lean
theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c
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
theorem distrib_left (a b c : Z) : a * (b + c) = a * b + a * c := by
  sorry
/--
`mul_neg` TODO

Predicate logic:

  (∀ x y ∈ Z), x * (-y) = -(x * y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 y) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (instHMul.1 x y)

Logical form (Lean):

```lean
theorem mul_neg (x y : Z) : x * (-y) = -(x * y)
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
theorem mul_neg (x y : Z) : x * (-y) = -(x * y) := by
  sorry
/--
`neg_mul` TODO

Predicate logic:

  (∀ x y ∈ Z), (-x) * y = -(x * y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 (instHMul.1 x y)

Logical form (Lean):

```lean
theorem neg_mul (x y : Z) : (-x) * y = -(x * y)
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
theorem neg_mul (x y : Z) : (-x) * y = -(x * y) := by
  sorry
/--
`mul_assoc` TODO

Predicate logic:

  (∀ x y z ∈ Z), (x * y) * z = x * (y * z)

Predicate logic (unfolded):

  ∀ (x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 (instHMul.1 x y) z = instHMul.1 x (instHMul.1 y z)

Logical form (Lean):

```lean
theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z)
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
theorem mul_assoc (x y z : Z) : (x * y) * z = x * (y * z) := by
  sorry
/--
`Pos` TODO

Predicate logic:

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Predicate logic (unfolded):

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def Pos (z : Z) : Prop := ∃ p : P, z = Z.pos p

/--
`IsNeg` TODO

Predicate logic:

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

Predicate logic (unfolded):

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

Logical form (Lean):

```lean
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsNeg (z : Z) : Prop := ∃ n : N, z = Z.neg n

/--
`not_pos_zero` TODO

Predicate logic:

  ¬ Pos Z.zero

Predicate logic (unfolded):

  (Exists fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → False

Logical form (Lean):

```lean
theorem not_pos_zero : ¬ Pos Z.zero
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
theorem not_pos_zero : ¬ Pos Z.zero := by
  sorry
/--
`not_isNeg_zero` TODO

Predicate logic:

  ¬ IsNeg Z.zero

Predicate logic (unfolded):

  (Exists fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n) → False

Logical form (Lean):

```lean
theorem not_isNeg_zero : ¬ IsNeg Z.zero
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
theorem not_isNeg_zero : ¬ IsNeg Z.zero := by
  sorry
/--
`not_pos_and_isNeg` TODO

Predicate logic:

  (∀ z ∈ Z), ¬ (Pos z ∧ IsNeg z)

Predicate logic (unfolded):

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), (Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n) → False

Logical form (Lean):

```lean
theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem not_pos_and_isNeg (z : Z) : ¬ (Pos z ∧ IsNeg z) := by
  sorry
/--
`trichotomy` TODO

Predicate logic:

  (∀ z ∈ Z), z = Z.zero ∨ Pos z ∨ IsNeg z

Predicate logic (unfolded):

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) (Or (Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) (Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n))

Logical form (Lean):

```lean
theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem trichotomy (z : Z) : z = Z.zero ∨ Pos z ∨ IsNeg z := by
  sorry
/--
`pos_add` TODO

Predicate logic:

  Pos (x + y)

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun p => y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun p => instHAdd.1 x y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
theorem pos_add {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x + y)
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
theorem pos_add {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x + y) := by
  sorry
/--
`isNeg_neg_of_pos` TODO

Predicate logic:

  IsNeg (-x)

Predicate logic (unfolded):

  ∀ {x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

Logical form (Lean):

```lean
theorem isNeg_neg_of_pos {x : Z} (positiveInput : Pos x) : IsNeg (-x)
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
theorem isNeg_neg_of_pos {x : Z} (positiveInput : Pos x) : IsNeg (-x) := by
  sorry
/--
`pos_neg_of_isNeg` TODO

Predicate logic:

  (IsNeg x) → Pos (-x)

Predicate logic (unfolded):

  ∀ {x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (Exists fun n => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n) → Exists fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
theorem pos_neg_of_isNeg {x : Z} (negativeInput : IsNeg x) : Pos (-x)
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
theorem pos_neg_of_isNeg {x : Z} (negativeInput : IsNeg x) : Pos (-x) := by
  sorry
/--
`pos_neg_iff_isNeg` TODO

Predicate logic:

  (∀ x ∈ Z), Pos (-x) ↔ IsNeg x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ↔ Exists fun n => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

Logical form (Lean):

```lean
theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem pos_neg_iff_isNeg (x : Z) : Pos (-x) ↔ IsNeg x := by
  sorry
/--
`lt` TODO

Predicate logic:

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun p => instHAdd.hAdd y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Exists fun p => instHAdd.1 y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
def lt (x y : Z) : Prop := Pos (y + (-x))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def lt (x y : Z) : Prop := Pos (y + (-x))

instance : LT Z where
  lt := lt

/--
`le` TODO

Predicate logic:

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y)

Logical form (Lean):

```lean
def le (x y : Z) : Prop := x = y ∨ x < y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def le (x y : Z) : Prop := x = y ∨ x < y

instance : LE Z where
  le := le

/--
`lt_def` TODO

Predicate logic:

  (∀ x y ∈ Z), x < y ↔ Pos (y + (-x))

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y ↔ Exists fun p => instHAdd.1 y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem lt_def (x y : Z) : x < y ↔ Pos (y + (-x)) := by
  sorry
/--
`pos_of_zero_lt` TODO

Predicate logic:

  (∀ x ∈ Z), Z.zero < x → Pos x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x → Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x
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
theorem pos_of_zero_lt (x : Z) : Z.zero < x → Pos x := by
  sorry
/--
`lt_irrefl` TODO

Predicate logic:

  (∀ x ∈ Z), ¬ x < x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x x → False

Logical form (Lean):

```lean
theorem lt_irrefl (x : Z) : ¬ x < x
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
theorem lt_irrefl (x : Z) : ¬ x < x := by
  sorry
/--
`lt_trans` TODO

Predicate logic:

  (x < y ∧ y < z) → x < z

Predicate logic (unfolded):

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x z

Logical form (Lean):

```lean
theorem lt_trans {x y z : Z} (firstLessSecond : x < y) (secondLessThird : y < z) : x < z
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
theorem lt_trans {x y z : Z} (firstLessSecond : x < y) (secondLessThird : y < z) : x < z := by
  sorry
/--
`lt_trichotomy` TODO

Predicate logic:

  (∀ x y ∈ Z), x < y ∨ x = y ∨ y < x

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y) (Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 y x))

Logical form (Lean):

```lean
theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem lt_trichotomy (x y : Z) : x < y ∨ x = y ∨ y < x := by
  sorry
/--
`lt_succ_self` TODO

Predicate logic:

  (∀ x ∈ Z), x < succ x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x)

Logical form (Lean):

```lean
theorem lt_succ_self (x : Z) : x < succ x
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
theorem lt_succ_self (x : Z) : x < succ x := by
  sorry
/--
`pred_lt_self` TODO

Predicate logic:

  (∀ x ∈ Z), pred x < x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) x

Logical form (Lean):

```lean
theorem pred_lt_self (x : Z) : pred x < x
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
theorem pred_lt_self (x : Z) : pred x < x := by
  sorry
/--
`add_lt_add_right` TODO

Predicate logic:

  (∀ z ∈ Z), (x < y) → x + z < y + z

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y → ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 (instHAdd.1 x z) (instHAdd.1 y z)

Logical form (Lean):

```lean
theorem add_lt_add_right {x y : Z} (firstLessSecond : x < y) (z : Z) : x + z < y + z
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
theorem add_lt_add_right {x y : Z} (firstLessSecond : x < y) (z : Z) : x + z < y + z := by
  sorry
/--
`le_iff` TODO

Predicate logic:

  (∀ x y ∈ Z), x ≤ y ↔ x = y ∨ x < y

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 x y ↔ Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y)

Logical form (Lean):

```lean
theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem le_iff (x y : Z) : x ≤ y ↔ x = y ∨ x < y := by
  sorry
/--
`le_refl` TODO

Predicate logic:

  (∀ x ∈ Z), x ≤ x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 x x

Logical form (Lean):

```lean
theorem le_refl (x : Z) : x ≤ x
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
theorem le_refl (x : Z) : x ≤ x := by
  sorry
/--
`lt_of_le_of_lt` TODO

Predicate logic:

  (x ≤ y ∧ y < z) → x < z

Predicate logic (unfolded):

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x z

Logical form (Lean):

```lean
theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z
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
theorem lt_of_le_of_lt {x y z : Z} (firstLeSecond : x ≤ y) (secondLessThird : y < z) :
    x < z := by
  sorry
/--
`le_antisymm` TODO

Predicate logic:

  (x ≤ y ∧ y ≤ x) → x = y

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.1 y x) → x = y

Logical form (Lean):

```lean
theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y
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
theorem le_antisymm {x y : Z} (firstLeSecond : x ≤ y) (secondLeFirst : y ≤ x) : x = y := by
  sorry
/--
`pos_mul` TODO

Predicate logic:

  Pos (x * y)

Predicate logic (unfolded):

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun p => y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun p => instHMul.1 x y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

Logical form (Lean):

```lean
theorem pos_mul {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x * y)
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
theorem pos_mul {x y : Z} (leftPositive : Pos x) (rightPositive : Pos y) : Pos (x * y) := by
  sorry
/--
`mul_lt_mul_pos_right` TODO

Predicate logic:

  (x < y) → x * z < y * z

Predicate logic (unfolded):

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 x y ∧ Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.1 (instHMul.1 x z) (instHMul.1 y z)

Logical form (Lean):

```lean
theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z
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
theorem mul_lt_mul_pos_right {x y z : Z} (firstLessSecond : x < y) (multiplierPositive : Pos z) :
    x * z < y * z := by
  sorry
end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
