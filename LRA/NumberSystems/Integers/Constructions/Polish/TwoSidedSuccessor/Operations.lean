
import LRA.NumberSystems.Integers.Constructions.Polish.TwoSidedSuccessor.WellFoundedness

namespace LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor

open Z

/--
`add` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      addN n (source fallback; no compiled unfold data available)

Logical form (Lean):

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
`add_succ` TODO

Predicate logic:

  (∀ x y ∈ Z), x + succ y = succ (x + y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) y) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun n' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n') a) a) n) a) a) (instHAdd.1 x y)

Logical form (Lean):

```lean
theorem add_succ (x y : Z) : x + succ y = succ (x + y)
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
theorem add_succ (x y : Z) : x + succ y = succ (x + y) := by
  sorry

/--
`add_pred` TODO

Predicate logic:

  (∀ x y ∈ Z), x + pred y = pred (x + y)

Predicate logic (unfolded):

  ∀ (x y : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHAdd.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) y) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) Unit.unit) (fun a => (fun a => (fun p => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.rec ((fun _ => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero) Unit.unit) (fun a a_ih => (fun a => (fun p' => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p') a) a) p) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) a) a) (instHAdd.1 x y)

Logical form (Lean):

```lean
theorem add_pred (x y : Z) : x + pred y = pred (x + y)
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
theorem add_pred (x y : Z) : x + pred y = pred (x + y) := by
  sorry

/--
`negZ` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      pos (flipN n) (source fallback; no compiled unfold data available)

Logical form (Lean):

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
`mul` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
      mulN n (source fallback; no compiled unfold data available)

Logical form (Lean):

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
`mul_zero` TODO

Predicate logic:

  (∀ x ∈ Z), x * zero = zero

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.zero

Logical form (Lean):

```lean
theorem mul_zero (x : Z) : x * zero = zero
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
theorem mul_zero (x : Z) : x * zero = zero := by
  sorry

/--
`mul_pos_succZero` TODO

Predicate logic:

  (∀ x ∈ Z), x * pos P.succZero = x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P.succZero) = x

Logical form (Lean):

```lean
theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x
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
theorem mul_pos_succZero (x : Z) : x * pos P.succZero = x := by
  sorry

/--
`mul_pos_succ` TODO

Predicate logic:

  (∀ x ∈ Z ∀ p ∈ P), x * pos (P.succ p) = x * pos p + x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) (p : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.P), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p.succ) = instHAdd.1 (instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.pos p)) x

Logical form (Lean):

```lean
theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x
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
theorem mul_pos_succ (x : Z) (p : P) : x * pos (P.succ p) = x * pos p + x := by
  sorry

/--
`mul_neg_predZero` TODO

Predicate logic:

  (∀ x ∈ Z), x * neg N.predZero = -x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N.predZero) = LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x

Logical form (Lean):

```lean
theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x
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
theorem mul_neg_predZero (x : Z) : x * neg N.predZero = -x := by
  sorry

/--
`mul_neg_pred` TODO

Predicate logic:

  (∀ x ∈ Z ∀ n ∈ N), x * neg (N.pred n) = x * neg n + -x

Predicate logic (unfolded):

  ∀ (x : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z) (n : LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.N), instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n.pred) = instHAdd.1 (instHMul.1 x (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z.neg n)) (LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.instNegZ.1 x)

Logical form (Lean):

```lean
theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x
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
theorem mul_neg_pred (x : Z) (n : N) : x * neg (N.pred n) = x * neg n + -x := by
  sorry

end LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor
