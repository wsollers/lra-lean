
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.Operations

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
`add_zero` TODO

Predicate logic:

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = x

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

  ∀ (w : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred w) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ w)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    w : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred.match_1 (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) p (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) w) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ.match_1 (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) n (fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) w)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = x

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ (instHAdd.hAdd x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred (instHAdd.hAdd x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd x y = instHAdd.hAdd y x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd y x

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

  ∀ (x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd (instHAdd.hAdd x y) z = instHAdd.hAdd x (instHAdd.hAdd y z)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y z : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y) z = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd y z)

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

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = x

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (instHAdd.hAdd x y) = instHAdd.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y) = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ y) = instHAdd.hAdd (instHMul.hMul x y) x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) y) = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y) x

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred y) = instHAdd.hAdd (instHMul.hMul x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) y) = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x

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

  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one x = x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.one x = x

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ x) y = instHAdd.hAdd (instHMul.hMul x y) y

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x) y = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y) y

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred x) y = instHAdd.hAdd (instHMul.hMul x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) y = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul x y = instHMul.hMul y x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y = { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul y x

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

  ∀ (a b c d : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.hAdd (instHAdd.hAdd a b) (instHAdd.hAdd c d) = instHAdd.hAdd (instHAdd.hAdd a c) (instHAdd.hAdd b d)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    a b c d : Z
  Prove
    { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd a b) ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd c d) = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd a c) ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd b d)

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

  ∀ (a b c : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul (instHAdd.hAdd a b) c = instHAdd.hAdd (instHMul.hMul a c) (instHMul.hMul b c)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    a b c : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd a b) c = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul a c) ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul b c)

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

  ∀ (a b c : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul a (instHAdd.hAdd b c) = instHAdd.hAdd (instHMul.hMul a b) (instHMul.hMul a c)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    a b c : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul a ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd b c) = { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul a b) ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul a c)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (instHMul.hMul x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg y) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg (instHMul.hMul x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y)

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

  ∀ (x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.hMul (instHMul.hMul x y) z = instHMul.hMul x (instHMul.hMul y z)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y z : Z
  Prove
    { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y) z = { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul y z)

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

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

  ¬ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
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

  ¬ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
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

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), ¬ (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos z ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg z)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    z : Z
  Prove
    (Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n) → False

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

  ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) (Or (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos z) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg z))

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    z : Z
  Prove
    Or (z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) (Or (Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) (Exists fun n => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n))

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

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos x ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos y) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (instHAdd.hAdd x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
    leftPositive : Pos x
    rightPositive : Pos y
  Prove
    (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun p => y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun p => { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  ∀ {x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos x → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
    positiveInput : Pos x
  Prove
    (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n

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

  ∀ {x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg x → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    (Exists fun n => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n) → Exists fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) ↔ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) ↔ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.IsNeg x

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun p => { hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ↔ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (instHAdd.hAdd y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x))

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ↔ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (instHAdd.hAdd y (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.neg x))

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero x → Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), ¬ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x x → False

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

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x z

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y z : Z
  Prove
    (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x z

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), Or (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y) (Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y x))

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    Or (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y) (Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y x))

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.succ x)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) x)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.pred x) x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) x) x

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

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y → ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt (instHAdd.hAdd x z) (instHAdd.hAdd y z)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
    z : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y → ∀ (z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd x z) ({ hAdd := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instAddZ.add a b }.hAdd y z)

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

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ↔ Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ↔ Or (x = y)(LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y)

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

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x x

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x : Z
  Prove
    LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x x

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

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x z

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y z : Z
  Prove
    (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt y z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x z

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

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le y x) → x = y

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
  Prove
    (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLEZ.le y x) → x = y

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

  ∀ {x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos x ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos y) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos (instHMul.hMul x y)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y : Z
    leftPositive : Pos x
    rightPositive : Pos y
  Prove
    (Exists fun p => x = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p ∧ Exists fun p => y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → Exists fun p => { hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x y = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p

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

  ∀ {x y z : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z}, (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ∧ LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Pos z) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt (instHMul.hMul x z) (instHMul.hMul y z)

Predicate logic (unfolded):

  Ambient
    (Z)
  Objects
    x y z : Z
    multiplierPositive : Pos z
  Prove
    (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt x y ∧ Exists fun p => z = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p) → LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instLTZ.lt ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul x z) ({ hMul := fun a b => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instMulZ.mul a b }.hMul y z)

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
