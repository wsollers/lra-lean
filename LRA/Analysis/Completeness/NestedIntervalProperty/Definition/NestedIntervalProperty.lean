import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Completeness

variable (F : Type*)

/--
`NestedIntervalProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] (a b : Nat → F), (Monotone a ∧ (Antitone b ∧ (∀ (n : Nat), inst.le (a n) (b n)))) → Exists fun x => ∀ (n : Nat), (inst.le (a n) x ∧ inst.le x (b n))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → inst.1.le (a a_1) (a b)) ∧ ((∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → inst.1.le (b b_1) (b a)) ∧ (∀ (n : Nat), inst.1.le (a n) (b n)))) → Exists fun x => ∀ (n : Nat), (inst.1.le (a n) x ∧ inst.1.le x (b n))

Logical form (Lean):

```lean
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

variable (a b : ℕ → ℝ)

/--
`IsNestedClosedIntervalFamily` TODO

Predicate logic:

  ∀ (a b : Nat → Real), ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ (∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n))))

Logical form (Lean):

```lean
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
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
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

end LRA.Analysis.Completeness
