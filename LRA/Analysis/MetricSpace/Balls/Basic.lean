import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.Analysis.MetricSpace

variable {X : Type u} [MetricSpace X]

/--
`center_mem_ball` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {r : Real}, Real.instLT.lt 0 r → x ∈ Metric.ball x r

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    x : X
    r : Real
  Prove
    Real.instLT.lt 0 r → x ∈ fun y => Real.instLT.lt (inst.toDist.1 y x) r

Logical form (Lean):

```lean
theorem center_mem_ball
    (x : X)
    {r : Real}
    (radius_positive : 0 < r) :
    x ∈ Metric.ball x r
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
theorem center_mem_ball
    (x : X)
    {r : Real}
    (radius_positive : 0 < r) :
    x ∈ Metric.ball x r := by
  sorry
/--
`ball_subset_ball` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {r s : Real}, Real.instLE.le r s → Set.instLE.le (Metric.ball x r) (Metric.ball x s)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    x : X
    r s : Real
  Prove
    Real.instLE.le r s → { le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (inst.toDist.1 y x) r) fun y => Real.instLT.lt (inst.toDist.1 y x) s

Logical form (Lean):

```lean
theorem ball_subset_ball
    (x : X)
    {r s : Real}
    (radius_le : r ≤ s) :
    Metric.ball x r ⊆ Metric.ball x s
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
theorem ball_subset_ball
    (x : X)
    {r s : Real}
    (radius_le : r ≤ s) :
    Metric.ball x r ⊆ Metric.ball x s := by
  sorry
/--
`ball_subset_closedBall` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) (r : Real), Set.instLE.le (Metric.ball x r) (Metric.closedBall x r)

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    x : X
    r : Real
  Prove
    { le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le (fun y => Real.instLT.lt (inst.toDist.1 y x) r) fun y => Real.instLE.le (inst.toDist.1 y x) r

Logical form (Lean):

```lean
theorem ball_subset_closedBall
    (x : X)
    (r : Real) :
    Metric.ball x r ⊆ Metric.closedBall x r
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
theorem ball_subset_closedBall
    (x : X)
    (r : Real) :
    Metric.ball x r ⊆ Metric.closedBall x r := by
  sorry
/--
`ball_subset_ball_of_mem` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] {x y : X} {r : Real}, y ∈ Metric.ball x r → Exists fun ε => (GT.gt ε 0 ∧ Set.instLE.le (Metric.ball y ε) (Metric.ball x r))

Predicate logic (unfolded):

  Ambient
    (X)
  Objects
    x y : X
    r : Real
  Prove
    y ∈ fun y => Real.instLT.lt (inst.toDist.1 y x) r → Exists fun ε => (Real.instLT.lt 0 ε ∧ ({ le := fun s₁ s₂ => ∀ ⦃a : X⦄, a ∈ s₁ → a ∈ s₂}.le (fun y_1 => Real.instLT.lt (inst.toDist.1 y_1 y) ε) fun y => Real.instLT.lt (inst.toDist.1 y x) r))

Logical form (Lean):

```lean
theorem ball_subset_ball_of_mem
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem ball_subset_ball_of_mem
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  sorry
end LRA.Analysis.MetricSpace
