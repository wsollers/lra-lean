import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic
import LRA.Order.Density

namespace LRA.Analysis.Completeness

/--
`IsOrderDenseSubset` TODO

Predicate logic:

  ∀ {S : Type u_1} [inst : Preorder S] (D : Set S) (x y : S), (fun x1 x2 => inst.lt x1 x2) x y → Exists fun d => (Set.instMembership.mem D d ∧ ((fun x1 x2 => inst.lt x1 x2) x d ∧ (fun x1 x2 => inst.lt x1 x2) d y))

Predicate logic (unfolded):

  ∀ {S : Type u_1} [inst : Preorder S] (D : S → Prop) (x y : S), inst.toLT.1 x y → Exists fun d => (Set.instMembership.1 D d ∧ ((fun x1 x2 => inst.toLT.1 x1 x2) x d ∧ (fun x1 x2 => inst.toLT.1 x1 x2) d y))

Logical form (Lean):

```lean
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  LRA.Order.DenseSubset (· < · : S → S → Prop) D
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
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  LRA.Order.DenseSubset (· < · : S → S → Prop) D

/--
`IsRational` TODO

Predicate logic:

  ∀ (x : Real), Exists fun y => y.cast = x

Predicate logic (unfolded):

  ∀ (x : Real), Exists fun y => Real.instRatCast.1 y = x

Logical form (Lean):

```lean
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)
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
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

/--
`IsIrrational` TODO

Predicate logic:

  ∀ (x : Real), LRA.Analysis.Completeness.IsRational x → False

Predicate logic (unfolded):

  ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.1 y = x)x → False

Logical form (Lean):

```lean
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x
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
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x

end LRA.Analysis.Completeness
