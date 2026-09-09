import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Bounds

namespace LRA.Analysis.Bounds.Extrema

variable {F : Type*}

/--
`IsBound` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (b : F) (A : Set F), Or (∀ (a : F), a ∈ A → inst.le a b) (∀ (a : F), a ∈ A → inst.le b a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (∀ (a : F), a ∈ A → inst.le a b) (∀ (a : F), a ∈ A → inst.le b a)

Logical form (Lean):

```lean
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)

/--
`IsBoundedIffAbsBound` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : AddCommGroup F] [inst_1 : LinearOrder F], IsOrderedAddMonoid F → ∀ (A : Set F), LRA.Analysis.Bounds.IsBounded A ↔ Exists fun M => (instDistribLatticeOfLinearOrder.toSemilatticeInf.le 0 M ∧ (∀ (a : F), a ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.le (abs a) M))

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    A : Set F
  Prove
    IsOrderedAddMonoid F → ∀ (A : Set F), LRA.Analysis.Bounds.IsBounded A ↔ Exists fun M => (instDistribLatticeOfLinearOrder.toSemilatticeInf.le 0 M ∧ (∀ (a : F), a ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.le (abs a) M))

Logical form (Lean):

```lean
theorem IsBoundedIffAbsBound [AddCommGroup F] [LinearOrder F] [IsOrderedAddMonoid F]
    (A : Set F) :
    IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem IsBoundedIffAbsBound [AddCommGroup F] [LinearOrder F] [IsOrderedAddMonoid F]
    (A : Set F) :
    IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M := by
  sorry
end LRA.Analysis.Bounds.Extrema
