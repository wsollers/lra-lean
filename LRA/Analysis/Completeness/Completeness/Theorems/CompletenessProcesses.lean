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

  (HasLeastUpperBoundProperty F ∧ ∃ u, IsUpperBound u (Set.range a)) → ∃ L, IsSupremum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) → ∀ {a : Nat → F}, (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a a_1) (a b) ∧ Exists fun u => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x L ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L u) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

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

  (HasLeastUpperBoundProperty F ∧ ∃ l, IsLowerBound l (Set.range a)) → ∃ L, IsInfimum L (Set.range a) ∧ Filter.Tendsto a Filter.atTop (nhds L)

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : LinearOrder F] [inst_1 : TopologicalSpace F], (OrderTopology F ∧ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) → ∀ {a : Nat → F}, (∀ ⦃a_1 b : Nat⦄, Nat.instPreorder.toLE.1 a_1 b → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 (a b) (a a_1) ∧ Exists fun l => ∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → Exists fun L => ((∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 L x ∧ ∀ (l : F), (∀ (x : F), Set.instMembership.1 (fun x => Exists fun y => a y = x)x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l x) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 l L) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))

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

  (∀ n, a n ≤ b n ∧ ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n) ∧ ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) → ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧ Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop (nhds x)

Predicate logic (unfolded):

  ∀ {a b : Nat → Real}, (∀ (n : Nat), Real.instLE.1 (a n) (b n) ∧ (∀ (n : Nat), Set.instLE.1 (fun x => (Real.instPreorder.toLE.1 (a (instHAdd.1 n (instOfNatNat 1).1)) x ∧ Real.instPreorder.toLE.1 x (b (instHAdd.1 n (instOfNatNat 1).1)))) fun x => (Real.instPreorder.toLE.1 (a n) x ∧ Real.instPreorder.toLE.1 x (b n)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (instHSub.1 (b n) (a n)) ε)) → Exists fun x => ((fun x => (∀ (n : Nat), (Real.instLE.1 (a n) x ∧ Real.instLE.1 x (b n)) ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage b x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds x)))) x ∧ ∀ (y : Real), (∀ (n : Nat), (Real.instLE.1 (a n) y ∧ Real.instLE.1 y (b n)) ∧ (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage a x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds y) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage b x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds y))) → y = x)

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

  ArchimedeanReciprocalProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], (IsStrictOrderedRing F ∧ Archimedean F) → ∀ [inst_2 : TopologicalSpace F], OrderTopology F → Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (fun n => instHDiv.hDiv 1 n.cast) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  (HasLeastUpperBoundProperty F) → ArchimedeanReciprocalProperty F

Predicate logic (unfolded):

  ∀ (F : Type u_1) [inst : Field F] [inst_1 : LinearOrder F], IsStrictOrderedRing F → ∀ [inst_2 : TopologicalSpace F], (OrderTopology F ∧ ∀ (A : F → Prop), (Exists fun x => Set.instMembership.1 A x) → (Exists fun u => ∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → Exists fun s => (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x s ∧ ∀ (u : F), (∀ (x : F), Set.instMembership.1 A x → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 x u) → instDistribLatticeOfLinearOrder.toSemilatticeInf.toLE.1 s u)) → Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem Filter.atTop.sets (Set.preimage (fun n => instHDiv.hDiv 1 n.cast) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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
