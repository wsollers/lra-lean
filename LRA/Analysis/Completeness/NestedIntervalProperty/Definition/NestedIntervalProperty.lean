import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Completeness

variable (F : Type*)

/--
`NestedIntervalProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Preorder F] (a b : Nat → F), (Monotone a ∧ (Antitone b ∧ ∀ (n : Nat), inst.le (a n) (b n))) → Exists fun x => ∀ (n : Nat), (inst.le (a n) x ∧ inst.le x (b n))

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Preorder F] (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → inst.toLE.1 (a a_1) (a b) ∧ (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → inst.toLE.1 (b b_1) (b a) ∧ ∀ (n : Nat), inst.toLE.1 (a n) (b n))) → Exists fun x => ∀ (n : Nat), (inst.toLE.1 (a n) x ∧ inst.toLE.1 x (b n))

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

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.le (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n)))

Predicate logic (unfolded):

  ∀ (a b : Nat → Real), (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ ∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n)))

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
