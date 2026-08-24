import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.Analysis.MetricSpace

variable {X : Type u} [MetricSpace X]

/--
`center_mem_ball` TODO

Predicate logic:

  (∀ x ∈ X), (0 < r) → x ∈ Metric.ball x r

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {r : Real}, Real.instLT.1 Zero.toOfNat0.1 r → Set.instMembership.1 (fun y => Real.instLT.1 (inst.toDist.1 y x) r) x

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

  (∀ x ∈ X), (r ≤ s) → Metric.ball x r ⊆ Metric.ball x s

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) {r s : Real}, Real.instLE.1 r s → Set.instLE.1 (fun y => Real.instLT.1 (inst.toDist.1 y x) r) fun y => Real.instLT.1 (inst.toDist.1 y x) s

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

  (∀ x ∈ X ∀ r ∈ Real), Metric.ball x r ⊆ Metric.closedBall x r

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x : X) (r : Real), Set.instLE.1 (fun y => Real.instLT.1 (inst.toDist.1 y x) r) fun y => Real.instLE.1 (inst.toDist.1 y x) r

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

  (y ∈ Metric.ball x r) → ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] {x y : X} {r : Real}, Set.instMembership.1 (fun y => Real.instLT.1 (inst.toDist.1 y x) r) y → Exists fun ε => (Real.instLT.1 Zero.toOfNat0.1 ε ∧ Set.instLE.1 (fun y_1 => Real.instLT.1 (inst.toDist.1 y_1 y) ε) fun y => Real.instLT.1 (inst.toDist.1 y x) r)

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
