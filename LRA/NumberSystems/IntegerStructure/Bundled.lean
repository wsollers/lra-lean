
namespace LRA.NumberSystems.IntegerStructure.Bundled

/--
`iterate` TODO

Predicate logic:

  def iterate {α : Type u} (f : α → α) : Nat → α → α
    | 0, x => x
    | n + 1, x => f (iterate f n x)

Predicate logic (unfolded):

  def iterate {α : Type u} (f : α → α) : Nat → α → α
    | 0, x => x
    | n + 1, x => f (iterate f n x) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def iterate {α : Type u} (f : α → α) : Nat → α → α
  | 0, x => x
  | n + 1, x => f (iterate f n x)
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
def iterate {α : Type u} (f : α → α) : Nat → α → α
  | 0, x => x
  | n + 1, x => f (iterate f n x)

/--
`iterate_succ'` TODO

Predicate logic:

  ∀ {α : Type u} (f : α → α) (n : Nat) (x : α), LRA.NumberSystems.IntegerStructure.Bundled.iterate f (instHAdd.hAdd n 1) x = f (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x)

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    f : α → α
    n : Nat
    x : α
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate f ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) x = f (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x)

Logical form (Lean):

```lean
theorem iterate_succ' {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = f (iterate f n x)
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
theorem iterate_succ' {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = f (iterate f n x) := by
  sorry
/--
`iterate_comm` TODO

Predicate logic:

  ∀ {α : Type u} (f : α → α) (n : Nat) (x : α), f (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x) = LRA.NumberSystems.IntegerStructure.Bundled.iterate f n (f x)

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    f : α → α
    n : Nat
    x : α
  Prove
    f (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x) = LRA.NumberSystems.IntegerStructure.Bundled.iterate f n (f x)

Logical form (Lean):

```lean
theorem iterate_comm {α : Type u} (f : α → α) (n : Nat) (x : α) :
    f (iterate f n x) = iterate f n (f x)
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
theorem iterate_comm {α : Type u} (f : α → α) (n : Nat) (x : α) :
    f (iterate f n x) = iterate f n (f x) := by
  sorry
/--
`iterate_succ_apply` TODO

Predicate logic:

  ∀ {α : Type u} (f : α → α) (n : Nat) (x : α), LRA.NumberSystems.IntegerStructure.Bundled.iterate f (instHAdd.hAdd n 1) x = LRA.NumberSystems.IntegerStructure.Bundled.iterate f n (f x)

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    f : α → α
    n : Nat
    x : α
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate f ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) x = LRA.NumberSystems.IntegerStructure.Bundled.iterate f n (f x)

Logical form (Lean):

```lean
theorem iterate_succ_apply {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = iterate f n (f x)
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
theorem iterate_succ_apply {α : Type u} (f : α → α) (n : Nat) (x : α) :
    iterate f (n + 1) x = iterate f n (f x) := by
  sorry
/--
`iterate_add` TODO

Predicate logic:

  ∀ {α : Type u} (f : α → α) (m n : Nat) (x : α), LRA.NumberSystems.IntegerStructure.Bundled.iterate f (instHAdd.hAdd m n) x = LRA.NumberSystems.IntegerStructure.Bundled.iterate f m (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x)

Predicate logic (unfolded):

  Ambient
    (α)
  Objects
    f : α → α
    m n : Nat
    x : α
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate f ({ hAdd := fun a b => instAddNat.add a b }.hAdd m n) x = LRA.NumberSystems.IntegerStructure.Bundled.iterate f m (LRA.NumberSystems.IntegerStructure.Bundled.iterate f n x)

Logical form (Lean):

```lean
theorem iterate_add {α : Type u} (f : α → α) (m n : Nat) (x : α) :
    iterate f (m + n) x = iterate f m (iterate f n x)
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
theorem iterate_add {α : Type u} (f : α → α) (m n : Nat) (x : α) :
    iterate f (m + n) x = iterate f m (iterate f n x) := by
  sorry
/--
`Injective` TODO

Predicate logic:

  ∀ {α : Type u_1} {β : Type u_2} (f : α → β) ⦃a b : α⦄, f a = f b → a = b

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    f a = f b → a = b

Logical form (Lean):

```lean
def Injective {α β : Type _} (f : α → β) : Prop :=
  ∀ ⦃a b⦄, f a = f b → a = b
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
def Injective {α β : Type _} (f : α → β) : Prop :=
  ∀ ⦃a b⦄, f a = f b → a = b

/--
`Surjective` TODO

Predicate logic:

  ∀ {α : Type u_1} {β : Type u_2} (f : α → β) (b : β), Exists fun a => f a = b

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => f a = b

Logical form (Lean):

```lean
def Surjective {α β : Type _} (f : α → β) : Prop :=
  ∀ b, ∃ a, f a = b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def Surjective {α β : Type _} (f : α → β) : Prop :=
  ∀ b, ∃ a, f a = b

/--
`Bijective` TODO

Predicate logic:

  ∀ {α : Type u_1} {β : Type u_2} (f : α → β), (LRA.NumberSystems.IntegerStructure.Bundled.Injective f ∧ LRA.NumberSystems.IntegerStructure.Bundled.Surjective f)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ ⦃a b : α⦄, f a = f b → a = b) ∧ (∀ (b : β), Exists fun a => f a = b))

Logical form (Lean):

```lean
def Bijective {α β : Type _} (f : α → β) : Prop :=
  Injective f ∧ Surjective f
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def Bijective {α β : Type _} (f : α → β) : Prop :=
  Injective f ∧ Surjective f

/--
`IntegerStructure` TODO

Predicate logic:

  structure IntegerStructure where
    carrier : Type u
    zero : carrier
    succ : carrier → carrier
    pred : carrier → carrier
    pred_succ : ∀ x, pred (succ x) = x
    succ_pred : ∀ x, succ (pred x) = x
    aperiodic : ∀ n : Nat, 0 < n → iterate succ n zero ≠ zero
    induction :
      ∀ (A : carrier → Prop),
        A zero →
        (∀ x, A x → A (succ x)) →
        (∀ x, A x → A (pred x)) →
        ∀ x, A x

Predicate logic (unfolded):

  structure IntegerStructure where
    carrier : Type u
    zero : carrier
    succ : carrier → carrier
    pred : carrier → carrier
    pred_succ : ∀ x, pred (succ x) = x
    succ_pred : ∀ x, succ (pred x) = x
    aperiodic : ∀ n : Nat, 0 < n → iterate succ n zero ≠ zero
    induction :
      ∀ (A : carrier → Prop),
        A zero →
        (∀ x, A x → A (succ x)) →
        (∀ x, A x → A (pred x)) →
        ∀ x, A x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegerStructure where
  carrier : Type u
  zero : carrier
  succ : carrier → carrier
  pred : carrier → carrier
  pred_succ : ∀ x, pred (succ x) = x
  succ_pred : ∀ x, succ (pred x) = x
  aperiodic : ∀ n : Nat, 0 < n → iterate succ n zero ≠ zero
  induction :
    ∀ (A : carrier → Prop),
      A zero →
      (∀ x, A x → A (succ x)) →
      (∀ x, A x → A (pred x)) →
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
structure IntegerStructure where
  carrier : Type u
  zero : carrier
  succ : carrier → carrier
  pred : carrier → carrier
  pred_succ : ∀ x, pred (succ x) = x
  succ_pred : ∀ x, succ (pred x) = x
  aperiodic : ∀ n : Nat, 0 < n → iterate succ n zero ≠ zero
  induction :
    ∀ (A : carrier → Prop),
      A zero →
      (∀ x, A x → A (succ x)) →
      (∀ x, A x → A (pred x)) →
      ∀ x, A x

end LRA.NumberSystems.IntegerStructure.Bundled
namespace LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure

variable (S : IntegerStructure)

/--
`rep` TODO

Predicate logic:

  def rep : Int → S.carrier
    | Int.ofNat n => iterate S.succ n S.zero
    | Int.negSucc n => iterate S.pred (n + 1) S.zero

Predicate logic (unfolded):

  def rep : Int → S.carrier
    | Int.ofNat n => iterate S.succ n S.zero
    | Int.negSucc n => iterate S.pred (n + 1) S.zero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def rep : Int → S.carrier
  | Int.ofNat n => iterate S.succ n S.zero
  | Int.negSucc n => iterate S.pred (n + 1) S.zero
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
def rep : Int → S.carrier
  | Int.ofNat n => iterate S.succ n S.zero
  | Int.negSucc n => iterate S.pred (n + 1) S.zero

/--
`rep_zero` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure), S.rep 0 = S.zero

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : IntegerStructure
  Prove
    Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) 0 = S.2

Logical form (Lean):

```lean
theorem rep_zero : S.rep 0 = S.zero
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
theorem rep_zero : S.rep 0 = S.zero := by
  sorry
attribute [simp] rep_zero

/--
`pred_iterate_succ_iterate` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Nat) (x : S.carrier), LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred n (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ n x) = x

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    n : Nat
    x : S.carrier
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n x) = x

Logical form (Lean):

```lean
theorem pred_iterate_succ_iterate (n : Nat) (x : S.carrier) :
    iterate S.pred n (iterate S.succ n x) = x
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
theorem pred_iterate_succ_iterate (n : Nat) (x : S.carrier) :
    iterate S.pred n (iterate S.succ n x) = x := by
  sorry
/--
`succ_iterate_pred_iterate` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Nat) (x : S.carrier), LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ n (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred n x) = x

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    n : Nat
    x : S.carrier
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n x) = x

Logical form (Lean):

```lean
theorem succ_iterate_pred_iterate (n : Nat) (x : S.carrier) :
    iterate S.succ n (iterate S.pred n x) = x
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
theorem succ_iterate_pred_iterate (n : Nat) (x : S.carrier) :
    iterate S.succ n (iterate S.pred n x) = x := by
  sorry
/--
`aperiodic_pred` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Nat), instLTNat.lt 0 n → Ne (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred n S.zero) S.zero

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    n : Nat
  Prove
    (instLTNat.lt 0 n ∧ LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n S.2 = S.2) → False

Logical form (Lean):

```lean
theorem aperiodic_pred (n : Nat) (h : 0 < n) :
    iterate S.pred n S.zero ≠ S.zero
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
theorem aperiodic_pred (n : Nat) (h : 0 < n) :
    iterate S.pred n S.zero ≠ S.zero := by
  sorry
/--
`iterate_succ_injective` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Nat), Function.Injective (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ n)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    n : Nat
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n a₁ = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n a₂ → a₁ = a₂

Logical form (Lean):

```lean
theorem iterate_succ_injective (n : Nat) :
    _root_.Function.Injective (iterate S.succ n)
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
theorem iterate_succ_injective (n : Nat) :
    _root_.Function.Injective (iterate S.succ n) := by
  sorry
/--
`iterate_pred_injective` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Nat), Function.Injective (LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred n)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    n : Nat
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n a₁ = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n a₂ → a₁ = a₂

Logical form (Lean):

```lean
theorem iterate_pred_injective (n : Nat) :
    _root_.Function.Injective (iterate S.pred n)
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
theorem iterate_pred_injective (n : Nat) :
    _root_.Function.Injective (iterate S.pred n) := by
  sorry
/--
`no_forward_collision` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (m n : Nat), LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ m S.zero = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ n S.zero → m = n

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    m n : Nat
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 m S.2 = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2 → m = n

Logical form (Lean):

```lean
theorem no_forward_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.succ n S.zero) :
    m = n
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
theorem no_forward_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.succ n S.zero) :
    m = n := by
  sorry
/--
`no_backward_collision` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (m n : Nat), LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred m S.zero = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred n S.zero → m = n

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    m n : Nat
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 m S.2 = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 n S.2 → m = n

Logical form (Lean):

```lean
theorem no_backward_collision
    (m n : Nat)
    (h : iterate S.pred m S.zero = iterate S.pred n S.zero) :
    m = n
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
theorem no_backward_collision
    (m n : Nat)
    (h : iterate S.pred m S.zero = iterate S.pred n S.zero) :
    m = n := by
  sorry
/--
`no_mixed_collision` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (m n : Nat), LRA.NumberSystems.IntegerStructure.Bundled.iterate S.succ m S.zero = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.pred (instHAdd.hAdd n 1) S.zero → False

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    S : IntegerStructure
    m n : Nat
  Prove
    LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 m S.2 = LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2 → False

Logical form (Lean):

```lean
theorem no_mixed_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.pred (n + 1) S.zero) :
    False
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
theorem no_mixed_collision
    (m n : Nat)
    (h : iterate S.succ m S.zero = iterate S.pred (n + 1) S.zero) :
    False := by
  sorry
/--
`rep_injective` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure), Function.Injective S.rep

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : IntegerStructure
  Prove
    Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₁ = Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₂ → a₁ = a₂

Logical form (Lean):

```lean
theorem rep_injective : _root_.Function.Injective S.rep
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
theorem rep_injective : _root_.Function.Injective S.rep := by
  sorry
/--
`rep_succ` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Int), S.rep (instHAdd.hAdd n 1) = S.succ (S.rep n)

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    S : IntegerStructure
    n : Int
  Prove
    Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) ({ hAdd := fun a b => Int.instAdd.add a b }.hAdd n 1) = S.3 (Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) n)

Logical form (Lean):

```lean
theorem rep_succ (n : Int) : S.rep (n + 1) = S.succ (S.rep n)
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
theorem rep_succ (n : Int) : S.rep (n + 1) = S.succ (S.rep n) := by
  sorry
/--
`rep_pred` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure) (n : Int), S.rep (instHSub.hSub n 1) = S.pred (S.rep n)

Predicate logic (unfolded):

  Ambient
    (Int)
  Objects
    S : IntegerStructure
    n : Int
  Prove
    Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) ({ hSub := fun a b => Int.instSub.sub a b }.hSub n 1) = S.4 (Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) n)

Logical form (Lean):

```lean
theorem rep_pred (n : Int) : S.rep (n - 1) = S.pred (S.rep n)
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
theorem rep_pred (n : Int) : S.rep (n - 1) = S.pred (S.rep n) := by
  sorry
/--
`rep_surjective` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure), Function.Surjective S.rep

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : IntegerStructure
  Prove
    Exists fun a => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a = b

Logical form (Lean):

```lean
theorem rep_surjective : _root_.Function.Surjective S.rep
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
theorem rep_surjective : _root_.Function.Surjective S.rep := by
  sorry
/--
`rep_bijective` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure), (Function.Injective S.rep ∧ Function.Surjective S.rep)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : IntegerStructure
  Prove
    ((∀ ⦃a₁ a₂ : Int⦄, Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₁ = Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₂ → a₁ = a₂) ∧ (∀ (b : S.1), Exists fun a => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a = b))

Logical form (Lean):

```lean
theorem rep_bijective :
    _root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep
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
theorem rep_bijective :
    _root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep := by
  sorry
/--
`categoricity` TODO

Predicate logic:

  ∀ (S : LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure), ((Function.Injective S.rep ∧ Function.Surjective S.rep) ∧ (S.rep 0 = S.zero ∧ (∀ (n : Int), S.rep (instHAdd.hAdd n 1) = S.succ (S.rep n))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    S : IntegerStructure
  Prove
    (((∀ ⦃a₁ a₂ : Int⦄, Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₁ = Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a₂ → a₁ = a₂) ∧ (∀ (b : S.1), Exists fun a => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) a = b)) ∧ (Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) 0 = S.2 ∧ (∀ (n : Int), Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) ({ hAdd := fun a b => Int.instAdd.add a b }.hAdd n 1) = S.3 (Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.3 n S.2) a) a) (fun a => (fun a => (fun n => LRA.NumberSystems.IntegerStructure.Bundled.iterate S.4 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) S.2) a) a) n))))

Logical form (Lean):

```lean
theorem categoricity :
    (_root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep) ∧
      S.rep 0 = S.zero ∧
      ∀ n : Int, S.rep (n + 1) = S.succ (S.rep n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem categoricity :
    (_root_.Function.Injective S.rep ∧ _root_.Function.Surjective S.rep) ∧
      S.rep 0 = S.zero ∧
      ∀ n : Int, S.rep (n + 1) = S.succ (S.rep n) := by
  sorry
end LRA.NumberSystems.IntegerStructure.Bundled.IntegerStructure
namespace LRA.NumberSystems.IntegerStructure.Bundled

end LRA.NumberSystems.IntegerStructure.Bundled
