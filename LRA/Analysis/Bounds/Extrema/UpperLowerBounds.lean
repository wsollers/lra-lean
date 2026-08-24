import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Bounds

namespace LRA.Analysis.Bounds.Extrema

variable {F : Type*}

/--
`IsBound` TODO

Predicate logic:

  ∀ {F : Type u_1} [inst : LE F] (b : F) (A : Set F), Or (∀ (a : F), Set.instMembership.mem A a → inst.le a b) (∀ (a : F), Set.instMembership.mem A a → inst.le b a)

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : LE F] (b : F) (A : F → Prop), Or (∀ (a : F), Set.instMembership.1 A a → inst.1 a b) (∀ (a : F), Set.instMembership.1 A a → inst.1 b a)

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

  IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M

Predicate logic (unfolded):

  ∀ {F : Type u_1} [inst : AddCommGroup F] [inst_1 : LinearOrder F], IsOrderedAddMonoid F → ∀ (A : F → Prop), (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) ↔ Exists fun M => (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 Zero.toOfNat0.1 M ∧ ∀ (a : F), Set.instMembership.1 A a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (SemilatticeSup.toMax.1 a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 a)) M)

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
