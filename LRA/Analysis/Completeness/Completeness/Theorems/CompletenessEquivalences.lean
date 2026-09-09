import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/--
`LubPropertyImpliesIncreasingProcessConvergence` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) → LRA.Analysis.Completeness.IncreasingBoundedProcessesConverge F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (OrderTopology F ∧ (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → ∀ (a : Nat → F), ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) ∧ (Exists fun u => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F
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
theorem LubPropertyImpliesIncreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    IncreasingBoundedProcessesConverge F := by
  sorry
/--
`LubPropertyImpliesDecreasingProcessConvergence` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) → LRA.Analysis.Completeness.DecreasingBoundedProcessesConverge F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (OrderTopology F ∧ (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → ∀ (a : Nat → F), ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) ∧ (Exists fun l => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F
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
theorem LubPropertyImpliesDecreasingProcessConvergence
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    DecreasingBoundedProcessesConverge F := by
  sorry
/--
`MonotoneProcessConvergenceImpliesLubProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.IncreasingBoundedProcessesConverge F) → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], (OrderTopology F ∧ (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (Exists fun u => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L)))) → ∀ (A : F → Prop), (Exists fun x => x ∈ A ∧ (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u)) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))

Logical form (Lean):

```lean
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F
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
theorem MonotoneProcessConvergenceImpliesLubProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F]
    (monotoneProcessConvergenceHypothesis : IncreasingBoundedProcessesConverge F) :
    HasLeastUpperBoundProperty F := by
  sorry
end LRA.Analysis.Completeness
