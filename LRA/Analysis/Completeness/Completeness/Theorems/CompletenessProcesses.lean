import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.MonotoneContinuity
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition
import LRA.Analysis.Completeness.ArchimedeanProperty
import LRA.Analysis.Completeness.NestedIntervalProperty

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (F : Type*)

/--
`IncreasingBoundedProcessHasLimit` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) → ∀ {a : Nat → F}, (Monotone a ∧ Exists fun u => LRA.Analysis.Bounds.IsUpperBound u (Set.range a)) → Exists fun L => (LRA.Analysis.Bounds.IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L))

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    a : ℕ → F
    monotoneHypothesis : Monotone a
  Prove
    (OrderTopology F ∧ (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → ∀ {a : Nat → F}, ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a a_1) (a b)) ∧ (Exists fun u => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x L) ∧ (∀ (u : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L u)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem IncreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (monotoneHypothesis : Monotone a)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u (Set.range a)) :
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem IncreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (monotoneHypothesis : Monotone a)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u (Set.range a)) :
    ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L) := by
  sorry
/--
`DecreasingBoundedProcessHasLimit` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) → ∀ {a : Nat → F}, (Antitone a ∧ Exists fun l => LRA.Analysis.Bounds.IsLowerBound l (Set.range a)) → Exists fun L => (LRA.Analysis.Bounds.IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L))

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    a : ℕ → F
    antitoneHypothesis : Antitone a
  Prove
    (OrderTopology F ∧ (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → ∀ {a : Nat → F}, ((∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.1.le a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le (a b) (a a_1)) ∧ (Exists fun l => ∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x)) → Exists fun L => (((∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le L x) ∧ (∀ (l : F), (∀ (x : F), x ∈ fun x => Exists fun y => a y = x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le l L)) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => setOf fun x_1 => a x_1 ∈ x ∈ Filter.atTop.1, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

Logical form (Lean):

```lean
theorem DecreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (antitoneHypothesis : Antitone a)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l (Set.range a)) :
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem DecreasingBoundedProcessHasLimit
    [LinearOrder F] [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F)
    {a : ℕ → F}
    (antitoneHypothesis : Antitone a)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l (Set.range a)) :
    ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L) := by
  sorry
/--
`ShrinkingNestedIntervalProcessHasUniqueLimit` TODO

Predicate logic:

  ∀ {a b : Nat → Real}, ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), Set.instLE.le (Set.Icc (a (instHAdd.hAdd n 1)) (b (instHAdd.hAdd n 1))) (Set.Icc (a n) (b n))) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (instHSub.hSub (b n) (a n)) ε))) → ExistsUnique fun x => ((∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))) ∧ (Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x)))

Predicate logic (unfolded):

  Ambient
    (F)
  Objects
    a b : ℕ → ℝ
  Prove
    ((∀ (n : Nat), Real.instLE.le (a n) (b n)) ∧ ((∀ (n : Nat), { le := fun s₁ s₂ => ∀ ⦃a : Real⦄, a ∈ s₁ → a ∈ s₂}.le (fun x => (Real.instPreorder.1.le (a ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)) x ∧ Real.instPreorder.1.le x (b ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1)))) fun x => (Real.instPreorder.1.le (a n) x ∧ Real.instPreorder.1.le x (b n))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub (b n) (a n)) ε))) → Exists fun x => (((fun x => ((∀ (n : Nat), (Real.instLE.le (a n) x ∧ Real.instLE.le x (b n))) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage b x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x)))) x) ∧ (∀ (y : Real), ((∀ (n : Nat), (Real.instLE.le (a n) y ∧ Real.instLE.le y (b n))) ∧ (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage a x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds y) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage b x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds y))) → y = x))

Logical form (Lean):

```lean
theorem ShrinkingNestedIntervalProcessHasUniqueLimit
    {a b : ℕ → ℝ}
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      Filter.Tendsto a Filter.atTop (nhds x) ∧
        Filter.Tendsto b Filter.atTop (nhds x)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem ShrinkingNestedIntervalProcessHasUniqueLimit
    {a b : ℕ → ℝ}
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      Filter.Tendsto a Filter.atTop (nhds x) ∧
        Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry
/--
`ArchimedeanReciprocalProcessTendsToZero` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst_2 : TopologicalSpace F], OrderTopology F → LRA.Analysis.Completeness.ArchimedeanReciprocalProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst_2 : TopologicalSpace F], OrderTopology F → Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (fun n => instHDiv.hDiv 1 n.cast) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem ArchimedeanReciprocalProcessTendsToZero
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    ArchimedeanReciprocalProperty F
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
theorem ArchimedeanReciprocalProcessTendsToZero
    [Field F] [LinearOrder F] [IsStrictOrderedRing F] [Archimedean F]
    [TopologicalSpace F] [OrderTopology F] :
    ArchimedeanReciprocalProperty F := by
  sorry
/--
`LeastUpperBoundPropertyImpliesArchimedeanReciprocalProperty` TODO

Predicate logic:

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ [inst_2 : TopologicalSpace F], (OrderTopology F ∧ LRA.Analysis.Completeness.HasLeastUpperBoundProperty F) → LRA.Analysis.Completeness.ArchimedeanReciprocalProperty F

Predicate logic (unfolded):

  Ambient
    (F, ≤)
  Objects
    (none)
  Prove
    IsStrictOrderedRing F → ∀ [inst_2 : TopologicalSpace F], (OrderTopology F ∧ (∀ (A : F → Prop), (Exists fun x => x) ∈ A → (Exists fun u => ∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → Exists fun s => ((∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x s) ∧ (∀ (u : F), (∀ (x : F), x ∈ A → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toPreorder.1.le s u)))) → Filter.instPartialOrder.toPreorder.1.le { sets := fun x => Set.preimage (fun n => instHDiv.hDiv 1 n.cast) x ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem LeastUpperBoundPropertyImpliesArchimedeanReciprocalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F]
    [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    ArchimedeanReciprocalProperty F
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
theorem LeastUpperBoundPropertyImpliesArchimedeanReciprocalProperty
    [Field F] [LinearOrder F] [IsStrictOrderedRing F]
    [TopologicalSpace F] [OrderTopology F]
    (leastUpperBoundProperty : HasLeastUpperBoundProperty F) :
    ArchimedeanReciprocalProperty F := by
  sorry
end LRA.Analysis.Completeness
