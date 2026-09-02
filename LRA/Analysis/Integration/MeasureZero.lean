
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.RiemannIntegral
import LRA.Analysis.Integration.DarbouxIntegral
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.StructureOfRealLine.OpenClosedSets

namespace LRA.Analysis.Integration

/--
`IsMeasureZero` TODO

Predicate logic:

  ∀ (E : Set Real) (ε : Real), GT.gt ε 0 → Exists fun p => Exists fun q => (∀ (k : Nat), Real.instLT.lt (p k) (q k) ∧ (Set.instLE.le E (Set.iUnion fun k => Set.Ioo (p k) (q k)) ∧ Exists fun L => (Real.instLE.le L ε ∧ HasSum (fun k => instHSub.hSub (q k) (p k)) L)))

Predicate logic (unfolded):

  ∀ (E : Real → Prop) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun p => Exists fun q => (∀ (k : Nat), Real.instLT.1 (p k) (q k) ∧ (Set.instLE.1 E (Set.instSupSet.1 fun x => Exists fun y => (fun k => Set.Ioo (p k) (q k)) y = x) ∧ Exists fun L => (Real.instLE.1 L ε ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (SummationFilter.unconditional Nat).filter.sets (Set.preimage (fun s => s.sum fun b => (fun k => instHSub.hSub (q k) (p k)) b) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))))

Logical form (Lean):

```lean
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L

/--
`PointOscillation` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b x ω : Real), (Set.instMembership.mem (Set.Icc a b) x ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b x ω : Real), (Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x ∧ (Real.instLE.1 Zero.toOfNat0.1 ω ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) x_1 → ∀ (y : Real), Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f y)))) Ω ∧ ∀ (b_1 : Real), Real.instLE.1 Zero.toOfNat0.1 b_1 → Real.instLT.1 b_1 Ω → Exists fun x_1 => (Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) x_1 ∧ Exists fun y => (Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) y ∧ Real.instLT.1 b_1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f y)))))))) ∧ Real.instLT.1 Ω (instHAdd.1 ω ε))) ∧ ∀ (b_1 : Real), Real.instLE.1 Zero.toOfNat0.1 b_1 → Real.instLT.1 b_1 ω → ∀ (δ : Real), Real.instLT.1 Zero.toOfNat0.1 δ → Exists fun Ω => ((Real.instLE.1 Zero.toOfNat0.1 Ω ∧ (∀ (x_1 : Real), Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) x_1 → ∀ (y : Real), Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f y)))) Ω ∧ ∀ (b_2 : Real), Real.instLE.1 Zero.toOfNat0.1 b_2 → Real.instLT.1 b_2 Ω → Exists fun x_1 => (Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) x_1 ∧ Exists fun y => (Set.instMembership.1 (fun x_2 => (Set.instMembership.1 (Set.Icc a b) x_2 ∧ Real.instLT.1 (abs (instHSub.hSub x_2 x)) δ)) y ∧ Real.instLT.1 b_2 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f y)))))))) ∧ Real.instLT.1 b_1 Ω))))

Logical form (Lean):

```lean
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω

/--
`lebesgue_criterion_riemann_integrability` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → IsRiemannIntegrable f a b ↔ IsMeasureZero {x ∈ Set.Icc a b | ∃ ω ∈ ℝ, 0 < ω ∧ PointOscillation f a b x ω}

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun p => Exists fun q => (∀ (k : Nat), Real.instLT.1 (p k) (q k) ∧ (Set.instLE.1 (fun x => (Set.instMembership.1 (fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x ∧ Exists fun ω => (Real.instLT.1 Zero.toOfNat0.1 ω ∧ (Set.instMembership.1 (setOf fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x ∧ (Real.instLE.1 0 ω ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ Exists fun Ω => ((Real.instLE.le 0 Ω ∧ (∀ (x_1 : Real), Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) x_1 → ∀ (y : Real), Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) y → Real.instLE.le (abs (instHSub.hSub (f x_1) (f y))) Ω ∧ ∀ (b_1 : Real), Real.instLE.le 0 b_1 → Real.instLT.lt b_1 Ω → Exists fun x_1 => (Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) x_1 ∧ Exists fun y => (Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) y ∧ Real.instLT.lt b_1 (abs (instHSub.hSub (f x_1) (f y))))))) ∧ Real.instLT.1 Ω (instHAdd.hAdd ω ε))) ∧ ∀ (b_1 : Real), Real.instLE.1 0 b_1 → Real.instLT.1 b_1 ω → ∀ (δ : Real), Real.instLT.lt 0 δ → Exists fun Ω => ((Real.instLE.le 0 Ω ∧ (∀ (x_1 : Real), Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) x_1 → ∀ (y : Real), Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) y → Real.instLE.le (abs (instHSub.hSub (f x_1) (f y))) Ω ∧ ∀ (b_2 : Real), Real.instLE.le 0 b_2 → Real.instLT.lt b_2 Ω → Exists fun x_1 => (Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) x_1 ∧ Exists fun y => (Set.instMembership.mem (LRA.Analysis.Continuity.RelativeNeighborhood (Set.Icc a b) x δ) y ∧ Real.instLT.lt b_2 (abs (instHSub.hSub (f x_1) (f y))))))) ∧ Real.instLT.1 b_1 Ω))))))) (Set.instSupSet.1 (setOf fun x => Exists fun y => (fun k => Set.Ioo (p k) (q k)) y = x)) ∧ Exists fun L => (Real.instLE.1 L ε ∧ Filter.instPartialOrder.toLE.1 { sets := setOf fun x => Set.instMembership.mem (SummationFilter.unconditional Nat).filter.sets (Set.preimage (fun s => s.sum fun b => (fun k => instHSub.hSub (q k) (p k)) b) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds L))))

Logical form (Lean):

```lean
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω}
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
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω} := by
  sorry
end LRA.Analysis.Integration
