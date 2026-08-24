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

  (HasLeastUpperBoundProperty F) → IncreasingBoundedProcessesConverge F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) → ∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b) ∧ Exists fun u => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

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

  (HasLeastUpperBoundProperty F) → DecreasingBoundedProcessesConverge F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) → ∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1) ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

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

  HasLeastUpperBoundProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], (OrderTopology F ∧ ∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (Exists fun u => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) → ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x ∧ Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)

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
