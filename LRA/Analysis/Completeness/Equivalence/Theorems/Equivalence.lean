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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.HasGreatestLowerBoundProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.HasGreatestLowerBoundProperty F

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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.NestedIntervalProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.NestedIntervalProperty F

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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.BolzanoWeierstrassProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.HasLeastUpperBoundProperty F ↔ LRA.Analysis.Completeness.BolzanoWeierstrassProperty F

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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → (List.cons (LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) (List.cons (LRA.Analysis.Completeness.IncreasingBoundedProcessesConverge F) (List.cons (LRA.Analysis.Completeness.DecreasingBoundedProcessesConverge F) List.nil))).TFAE

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.x ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil)) → ∀ (y : Prop), List.y ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil)) → x ↔ y

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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → (List.cons (LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) (List.cons (LRA.Analysis.Completeness.NestedIntervalProperty F) List.nil)).TFAE

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.x ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x (b n))) List.nil) → ∀ (y : Prop), List.y ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x (b n))) List.nil) → x ↔ y

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

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → (List.cons (LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) (List.cons (LRA.Analysis.Completeness.HasGreatestLowerBoundProperty F) (List.cons (LRA.Analysis.Completeness.IncreasingBoundedProcessesConverge F) (List.cons (LRA.Analysis.Completeness.DecreasingBoundedProcessesConverge F) (List.cons (LRA.Analysis.Completeness.NestedIntervalProperty F) (List.cons (LRA.Analysis.Completeness.BolzanoWeierstrassProperty F) List.nil)))))).TFAE

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst : TopologicalSpace F], OrderTopology F → ∀ (x : Prop), List.x ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun l => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun i => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le i x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l i))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x (b n))) (List.cons (∀ (a : Nat → F), (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun indexMap => ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Nat.instPreorder.2.lt (indexMap a) (indexMap b)) ∧ Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage (Function.comp a indexMap) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil))))) → ∀ (y : Prop), List.y ∈ List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u))) (List.cons (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun l => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun i => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le i x) ∧ (∀ (l : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l i))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun L => (((∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ Set.range a → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) (List.cons (∀ (a b : Nat → F), (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) → (∀ ⦃a b_1 : Nat⦄, Nat.instPreorder.1.le a b_1 → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (b b_1) (b a)) → (∀ (n : Nat), instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) (b n)) → Exists fun x => ∀ (n : Nat), (instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a n) x ∧ instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x (b n))) (List.cons (∀ (a : Nat → F), (Exists fun u => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → (Exists fun l => ∀ (x : F), x ∈ setOf fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → Exists fun indexMap => ((∀ ⦃a b : Nat⦄, Nat.instPreorder.2.lt a b → Nat.instPreorder.2.lt (indexMap a) (indexMap b)) ∧ Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := setOf fun x => Set.preimage (Function.comp a indexMap) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))) List.nil))))) → x ↔ y

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
