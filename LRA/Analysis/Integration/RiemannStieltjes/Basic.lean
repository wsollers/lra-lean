
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.Continuity.MonotoneFunctions
import LRA.Analysis.Differentiation.GraphReading

namespace LRA.Analysis.Integration

/--
`VariationSums` TODO

Predicate logic:

  ∀ (α : Real → Real) (a b a_1 : Real), Exists fun P => a_1 = Finset.univ.sum fun i => abs (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))

Predicate logic (unfolded):

  ∀ (α : Real → Real) (a b a_1 : Real), Exists fun P => a_1 = Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => abs (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯ Finset.univ.val)

Logical form (Lean):

```lean
def VariationSums (α : ℝ → ℝ) (a b : ℝ) : Set ℝ :=
  {v : ℝ | ∃ P : IntegrationPartition a b,
    v = ∑ i : Fin P.n, |α (P.points i.succ) - α (P.points i.castSucc)|}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def VariationSums (α : ℝ → ℝ) (a b : ℝ) : Set ℝ :=
  {v : ℝ | ∃ P : IntegrationPartition a b,
    v = ∑ i : Fin P.n, |α (P.points i.succ) - α (P.points i.castSucc)|}

/--
`HasBoundedVariation` TODO

Predicate logic:

  ∀ (α : Real → Real) (a b : Real), Exists fun x => Set.instMembership.mem (upperBounds (LRA.Analysis.Integration.VariationSums α a b)) x

Predicate logic (unfolded):

  ∀ (α : Real → Real) (a b : Real), Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a_1 : Real⦄, Set.instMembership.1 (fun v => Exists fun P => v = Finset.univ.sum fun i => abs (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) a_1 → Real.instLE.1 a_1 x) x

Logical form (Lean):

```lean
def HasBoundedVariation (α : ℝ → ℝ) (a b : ℝ) : Prop := BddAbove (VariationSums α a b)
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
def HasBoundedVariation (α : ℝ → ℝ) (a b : ℝ) : Prop := BddAbove (VariationSums α a b)

/--
`TotalVariation` TODO

Predicate logic:

  noncomputable def TotalVariation (α : ℝ → ℝ) (a b : ℝ) : ℝ := sSup (VariationSums α a b)

Predicate logic (unfolded):

  noncomputable def TotalVariation (α : ℝ → ℝ) (a b : ℝ) : ℝ := sSup (VariationSums α a b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TotalVariation (α : ℝ → ℝ) (a b : ℝ) : ℝ := sSup (VariationSums α a b)
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
noncomputable def TotalVariation (α : ℝ → ℝ) (a b : ℝ) : ℝ := sSup (VariationSums α a b)

/--
`MonotoneBoundedVariation` TODO

Predicate logic:

  (ℝ → ℝ ∧ a ≤ b) → HasBoundedVariation α a b

Predicate logic (unfolded):

  ∀ (α : Real → Real) (a b : Real), (Real.instLE.1 a b ∧ ∀ ⦃a_1 : Real⦄, Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) a_1 → ∀ ⦃b_1 : Real⦄, Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) b_1 → Real.instPreorder.toLE.1 a_1 b_1 → Real.instPreorder.toLE.1 (α a_1) (α b_1)) → Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a_2 : Real⦄, Set.instMembership.mem (LRA.Analysis.Integration.VariationSums α a b) a_2 → Real.instLE.le a_2 x) x

Logical form (Lean):

```lean
theorem MonotoneBoundedVariation (α : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hmono : MonotoneOn α (Set.Icc a b)) : HasBoundedVariation α a b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem MonotoneBoundedVariation (α : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hmono : MonotoneOn α (Set.Icc a b)) : HasBoundedVariation α a b := by

  sorry

/--
`HasRiemannStieltjesIntegral` TODO

Predicate logic:

  ∀ (f α : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L)) ε)

Predicate logic (unfolded):

  ∀ (f α : Real → Real) (a b L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum L))) ε)

Logical form (Lean):

```lean
def HasRiemannStieltjesIntegral (f α : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ →
    |(∑ i : Fin P.n, f (P.tag i) *
        (α (P.points i.succ) - α (P.points i.castSucc))) - L| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def HasRiemannStieltjesIntegral (f α : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ →
    |(∑ i : Fin P.n, f (P.tag i) *
        (α (P.points i.succ) - α (P.points i.castSucc))) - L| < ε

/--
`IsRiemannStieltjesIntegrable` TODO

Predicate logic:

  ∀ (f α : Real → Real) (a b : Real), Exists fun L => LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b L

Predicate logic (unfolded):

  ∀ (f α : Real → Real) (a b : Real), Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L))) ε)

Logical form (Lean):

```lean
def IsRiemannStieltjesIntegrable (f α : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ L, HasRiemannStieltjesIntegral f α a b L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def IsRiemannStieltjesIntegrable (f α : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ L, HasRiemannStieltjesIntegral f α a b L

/--
`rs_continuous_bv_existence` TODO

Predicate logic:

  (a ≤ b ∧ HasBoundedVariation α a b) → IsRiemannStieltjesIntegrable f α a b

Predicate logic (unfolded):

  ∀ {a b : Real} {f α : Real → Real}, (Real.instLE.1 a b ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε) ∧ Exists fun x => Set.instMembership.1 (fun x => ∀ ⦃a_1 : Real⦄, Set.instMembership.mem (LRA.Analysis.Integration.VariationSums α a b) a_1 → Real.instLE.le a_1 x) x)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L))) ε)

Logical form (Lean):

```lean
theorem rs_continuous_bv_existence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hbv : HasBoundedVariation α a b) : IsRiemannStieltjesIntegrable f α a b
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
theorem rs_continuous_bv_existence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hbv : HasBoundedVariation α a b) : IsRiemannStieltjesIntegrable f α a b := by
  sorry

/--
`rs_bilinearity` TODO

Predicate logic:

  (HasRiemannStieltjesIntegral f α a b Lfα ∧ HasRiemannStieltjesIntegral g α a b Lgα) → HasRiemannStieltjesIntegral (fun x => lam * f x + μ * g x) α a b (lam * Lfα + μ * Lgα) ∧ ∀ Lfβ ∈ ℝ, HasRiemannStieltjesIntegral f β a b Lfβ → HasRiemannStieltjesIntegral f (fun x => lam * α x + μ * β x a b (lam * Lfα + μ * Lfβ))

Predicate logic (unfolded):

  ∀ {f α : Real → Real} {a b : Real} {g β : Real → Real} (Lfα Lgα : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lfα) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lfα))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (g (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lgα) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (g (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lgα))) ε)) → ∀ (lam μ : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul lam (f x)) (instHMul.hMul μ (g x))) (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum (instHAdd.1 (instHMul.hMul lam Lfα) (instHMul.hMul μ Lgα))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul lam (f x)) (instHMul.hMul μ (g x))) (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) (instHAdd.hAdd (instHMul.hMul lam Lfα) (instHMul.hMul μ Lgα))))) ε) ∧ ∀ (Lfβ : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (β (P.points i.succ)) (β (P.points i.castSucc)))) Finset.univ.val).sum Lfβ) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (β (P.points i.succ)) (β (P.points i.castSucc)))) Lfβ))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.succ)) ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.castSucc)))) Finset.univ.val).sum (instHAdd.1 (instHMul.hMul lam Lfα) (instHMul.hMul μ Lfβ))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.succ)) ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.castSucc)))) (instHAdd.hAdd (instHMul.hMul lam Lfα) (instHMul.hMul μ Lfβ))))) ε))

Logical form (Lean):

```lean
theorem rs_bilinearity (Lfα Lgα : ℝ) (hf : HasRiemannStieltjesIntegral f α a b Lfα)
    (hg : HasRiemannStieltjesIntegral g α a b Lgα) (lam μ : ℝ) :
    HasRiemannStieltjesIntegral (fun x => lam * f x + μ * g x) α a b (lam * Lfα + μ * Lgα) ∧
    (∀ Lfβ : ℝ, HasRiemannStieltjesIntegral f β a b Lfβ →
      HasRiemannStieltjesIntegral f (fun x => lam * α x + μ * β x) a b (lam * Lfα + μ * Lfβ))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem rs_bilinearity (Lfα Lgα : ℝ) (hf : HasRiemannStieltjesIntegral f α a b Lfα)
    (hg : HasRiemannStieltjesIntegral g α a b Lgα) (lam μ : ℝ) :
    HasRiemannStieltjesIntegral (fun x => lam * f x + μ * g x) α a b (lam * Lfα + μ * Lgα) ∧
    (∀ Lfβ : ℝ, HasRiemannStieltjesIntegral f β a b Lfβ →
      HasRiemannStieltjesIntegral f (fun x => lam * α x + μ * β x) a b (lam * Lfα + μ * Lfβ)) := by
  sorry

/--
`rs_interval_additivity` TODO

Predicate logic:

  (a ≤ c ∧ c ≤ b ∧ HasRiemannStieltjesIntegral f α a b Lab ∧ HasRiemannStieltjesIntegral f α a c Lac ∧ HasRiemannStieltjesIntegral f α c b Lcb) → Lab = Lac + Lcb

Predicate logic (unfolded):

  ∀ {a b : Real} {f α : Real → Real} (c Lab Lac Lcb : Real), (Real.instLE.1 a c ∧ (Real.instLE.1 c b ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lab) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lab))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a c), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lac) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lac))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration c b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lcb) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lcb))) ε))))) → Lab = instHAdd.1 Lac Lcb

Logical form (Lean):

```lean
theorem rs_interval_additivity (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannStieltjesIntegral f α a b Lab)
    (hac' : HasRiemannStieltjesIntegral f α a c Lac)
    (hcb' : HasRiemannStieltjesIntegral f α c b Lcb) : Lab = Lac + Lcb
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
theorem rs_interval_additivity (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannStieltjesIntegral f α a b Lab)
    (hac' : HasRiemannStieltjesIntegral f α a c Lac)
    (hcb' : HasRiemannStieltjesIntegral f α c b Lcb) : Lab = Lac + Lcb := by
  sorry

/--
`rs_integration_by_parts` TODO

Predicate logic:

  (HasRiemannStieltjesIntegral f α a b L) → ∃ L', HasRiemannStieltjesIntegral α f a b L' ∧ L + L' = f b * α b - f a * α a

Predicate logic (unfolded):

  ∀ {f α : Real → Real} {a b : Real} (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L))) ε)) → Exists fun L' => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (α (P.tag i)) (instHSub.hSub (f (P.points i.succ)) (f (P.points i.castSucc)))) Finset.univ.val).sum L') (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (α (P.tag i)) (instHSub.hSub (f (P.points i.succ)) (f (P.points i.castSucc)))) L'))) ε) ∧ instHAdd.1 L L' = instHSub.1 (instHMul.1 (f b) (α b)) (instHMul.1 (f a) (α a)))

Logical form (Lean):

```lean
theorem rs_integration_by_parts (L : ℝ) (hL : HasRiemannStieltjesIntegral f α a b L) :
    ∃ L', HasRiemannStieltjesIntegral α f a b L' ∧ L + L' = f b * α b - f a * α a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem rs_integration_by_parts (L : ℝ) (hL : HasRiemannStieltjesIntegral f α a b L) :
    ∃ L', HasRiemannStieltjesIntegral α f a b L' ∧ L + L' = f b * α b - f a * α a := by
  sorry

/--
`rs_c1_reduction` TODO

Predicate logic:

  (a ≤ b ∧ ℝ → ℝ ∧ IsRiemannIntegrable (fun x => f x * αD x) a b ∧ HasRiemannIntegral (fun x => f x * αD x) a b Lint) → HasRiemannStieltjesIntegral f α a b Lint

Predicate logic (unfolded):

  ∀ {a b : Real} {α f : Real → Real}, Real.instLE.1 a b → ∀ (αD : Real → Real), ((∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (α (instHAdd.hAdd x h)) (α x)) h) (αD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (α (instHAdd.hAdd x h)) (α x)) h) (αD x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (αD x_1) (αD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (αD x_1) (αD x)))) ε)) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum (fun x => instHMul.hMul (f x) (αD x)) P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum (fun x => instHMul.hMul (f x) (αD x)) P) L))) ε)) → ∀ (Lint : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => instHMul.hMul (f x) (αD x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lint) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum (fun x => instHMul.hMul (f x) (αD x)) P) Lint))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum Lint) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Lint))) ε)

Logical form (Lean):

```lean
theorem rs_c1_reduction (hab : a ≤ b)
    (αD : ℝ → ℝ) (hα : LRA.Analysis.Differentiation.IsClassC1 α αD (Set.Icc a b))
    (hf : IsRiemannIntegrable (fun x => f x * αD x) a b) (Lint : ℝ)
    (hLint : HasRiemannIntegral (fun x => f x * αD x) a b Lint) :
    HasRiemannStieltjesIntegral f α a b Lint
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem rs_c1_reduction (hab : a ≤ b)
    (αD : ℝ → ℝ) (hα : LRA.Analysis.Differentiation.IsClassC1 α αD (Set.Icc a b))
    (hf : IsRiemannIntegrable (fun x => f x * αD x) a b) (Lint : ℝ)
    (hLint : HasRiemannIntegral (fun x => f x * αD x) a b Lint) :
    HasRiemannStieltjesIntegral f α a b Lint := by
  sorry

/--
`rs_step_integrator_finite_sum` TODO

Predicate logic:

  (Fin n → ℝ ∧ ∀ i, c i ∈ Set.Icc a b ∧ Fin n → ℝ ∧ ∀ x ∈ Set.Icc a b, (∀ i, x ≠ c i) → ∃ k, ∀ y ∈ Set.Icc a b, (∀ i, y ≠ c i) → α y = k ∧ ∀ i, LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i) ∧ ∀ i, LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) (c i)) → HasRiemannStieltjesIntegral f α a b (∑ i, f (c i) * jump i)

Predicate logic (unfolded):

  ∀ {a b : Real} {α f : Real → Real} (n : Nat) (c : Fin n → Real), (∀ (i : Fin n), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) (c i)) → ∀ (jump : Fin n → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → (∀ (i : Fin n), x = c i → False) → Exists fun k => ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) y → (∀ (i : Fin n), y = c i → False) → α y = k ∧ (∀ (i : Fin n), (Real.instLE.1 Zero.toOfNat0.1 (jump i) ∧ Exists fun L₁ => Exists fun L₂ => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (instHSub.1 (c i) δ) x → Real.instLT.1 x (c i) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (α x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (α x) L₁))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (c i) x → Real.instLT.1 x (instHAdd.1 (c i) δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (α x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (α x) L₂))) ε) ∧ jump i = instHSub.1 L₂ L₁))) ∧ ∀ (i : Fin n) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x (c i)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x (c i)))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f (c i))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f (c i))))) ε))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val).sum (Multiset.map (fun i => instHMul.hMul (f (c i)) (jump i)) Finset.univ.val).sum) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) (Finset.univ.sum fun i => instHMul.hMul (f (c i)) (jump i))))) ε)

Logical form (Lean):

```lean
theorem rs_step_integrator_finite_sum (n : ℕ) (c : Fin n → ℝ) (hc : ∀ i, c i ∈ Set.Icc a b)
    (jump : Fin n → ℝ)
    (hstep : ∀ x ∈ Set.Icc a b, (∀ i, x ≠ c i) → ∃ k, ∀ y ∈ Set.Icc a b, (∀ i, y ≠ c i) → α y = k)
    (hjump : ∀ i, LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i))
    (hcont : ∀ i, LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) (c i)) :
    HasRiemannStieltjesIntegral f α a b (∑ i, f (c i) * jump i)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem rs_step_integrator_finite_sum (n : ℕ) (c : Fin n → ℝ) (hc : ∀ i, c i ∈ Set.Icc a b)
    (jump : Fin n → ℝ)
    (hstep : ∀ x ∈ Set.Icc a b, (∀ i, x ≠ c i) → ∃ k, ∀ y ∈ Set.Icc a b, (∀ i, y ≠ c i) → α y = k)
    (hjump : ∀ i, LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i))
    (hcont : ∀ i, LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) (c i)) :
    HasRiemannStieltjesIntegral f α a b (∑ i, f (c i) * jump i) := by
  sorry

/--
`rs_shared_jump_failure_witness` TODO

Predicate logic:

  (c ∈ Set.Ioo 0 ∈ ℝ 1) → ¬ IsRiemannStieltjesIntegrable (fun x => if x ≥ c then 1 ∈ ℝ else 0) (fun x => if x ≥ c then 1 ∈ ℝ else 0) 0 1

Predicate logic (unfolded):

  ∀ (c : Real), (Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLT.1 x One.toOfNat1.1)) c ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration Zero.toOfNat0.1 One.toOfNat1.1), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.union (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul ((fun x => ite (GE.ge x c) 1 0) (P.tag i)) (instHSub.hSub ((fun x => ite (GE.ge x c) 1 0) (P.points i.succ)) ((fun x => ite (GE.ge x c) 1 0) (P.points i.castSucc)))) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul ((fun x => ite (GE.ge x c) 1 0) (P.tag i)) (instHSub.hSub ((fun x => ite (GE.ge x c) 1 0) (P.points i.succ)) ((fun x => ite (GE.ge x c) 1 0) (P.points i.castSucc)))) L))) ε)) → False

Logical form (Lean):

```lean
theorem rs_shared_jump_failure_witness (c : ℝ) (hc : c ∈ Set.Ioo (0:ℝ) 1) :
    ¬ IsRiemannStieltjesIntegrable (fun x => if x ≥ c then (1:ℝ) else 0)
      (fun x => if x ≥ c then (1:ℝ) else 0) 0 1
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
theorem rs_shared_jump_failure_witness (c : ℝ) (hc : c ∈ Set.Ioo (0:ℝ) 1) :
    ¬ IsRiemannStieltjesIntegrable (fun x => if x ≥ c then (1:ℝ) else 0)
      (fun x => if x ≥ c then (1:ℝ) else 0) 0 1 := by
  sorry

end LRA.Analysis.Integration
