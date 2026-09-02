import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Topology.Order.OrderClosed
import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.NestedIntervalProperty

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/--
`HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty` TODO

Predicate logic:

  HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u) ↔ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun l => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun i => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 i x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l i)

Logical form (Lean):

```lean
theorem HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem HasLeastUpperBoundPropertyIffHasGreatestLowerBoundProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ HasGreatestLowerBoundProperty F := by
  sorry
/--
`HasLeastUpperBoundPropertyIffNestedIntervalProperty` TODO

Predicate logic:

  HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u) ↔ ∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (b n))

Logical form (Lean):

```lean
theorem HasLeastUpperBoundPropertyIffNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem HasLeastUpperBoundPropertyIffNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ NestedIntervalProperty F := by
  sorry
/--
`HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty` TODO

Predicate logic:

  HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u) ↔ ∀ (a : Nat → F), (Exists fun u => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun indexMap => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (indexMap a) (indexMap b) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (Function.comp a indexMap) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem HasLeastUpperBoundPropertyIffBolzanoWeierstrassProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    HasLeastUpperBoundProperty F ↔ BolzanoWeierstrassProperty F := by
  sorry
/--
`LubPropertyEquivalentToMonotoneProcessConvergence` TODO

Predicate logic:

  [HasLeastUpperBoundProperty F, IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F].TFAE

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1)) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil))) x → ∀ (y : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1)) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil))) y → x ↔ y

Logical form (Lean):

```lean
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE
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
theorem LubPropertyEquivalentToMonotoneProcessConvergence
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F].TFAE := by
  sorry
/--
`LubPropertyEquivalentToNestedIntervalProperty` TODO

Predicate logic:

  [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (b n))) List.nil)) x → ∀ (y : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (b n))) List.nil)) y → x ↔ y

Logical form (Lean):

```lean
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE
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
theorem LubPropertyEquivalentToNestedIntervalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F, NestedIntervalProperty F].TFAE := by
  sorry
/--
`StandardCompletenessEquivalences` TODO

Predicate logic:

  [HasLeastUpperBoundProperty F, HasGreatestLowerBoundProperty F, IncreasingBoundedProcessesConverge F, DecreasingBoundedProcessesConverge F, NestedIntervalProperty F, BolzanoWeierstrassProperty F].TFAE

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun l => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun i => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 i x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l i)) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1)) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (b n))) (List.cons (∀ (a : Nat → F), (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun indexMap => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (indexMap a) (indexMap b) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage (Function.comp a indexMap)) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil)))))) x → ∀ (y : Prop), List.instMembership.1 (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) (List.cons (∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun l => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun i => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 i x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l i)) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1)) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (Set.range a) x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage a) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.toLE.1 a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x (b n))) (List.cons (∀ (a : Nat → F), (Exists fun u => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → (Exists fun l => ∀ (x : F), Set.instMembership.1 (setOf fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun indexMap => (∀ ⦃a b : Nat⦄, Nat.instPreorder.toLT.1 a b → Nat.instPreorder.toLT.1 (indexMap a) (indexMap b) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := Set.preimage (Set.preimage (Function.comp a indexMap)) Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil)))))) y → x ↔ y

Logical form (Lean):

```lean
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      BolzanoWeierstrassProperty F].TFAE
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
theorem StandardCompletenessEquivalences
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    [HasLeastUpperBoundProperty F,
      HasGreatestLowerBoundProperty F,
      IncreasingBoundedProcessesConverge F,
      DecreasingBoundedProcessesConverge F,
      NestedIntervalProperty F,
      BolzanoWeierstrassProperty F].TFAE := by
  sorry
end LRA.Analysis.Completeness
