
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Integration

/--
`IsGaugeOn` TODO

Predicate logic:

  ∀ (a b : Real) (δ : Real → Real) (x : Real), Set.instMembership.mem (Set.Icc a b) x → GT.gt (δ x) 0

Predicate logic (unfolded):

  ∀ (a b : Real) (δ : Real → Real) (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x)

Logical form (Lean):

```lean
def IsGaugeOn (a b : ℝ) (δ : ℝ → ℝ) : Prop := ∀ x ∈ Set.Icc a b, δ x > 0
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
def IsGaugeOn (a b : ℝ) (δ : ℝ → ℝ) : Prop := ∀ x ∈ Set.Icc a b, δ x > 0

/--
`IsHKDeltaFine` TODO

Predicate logic:

  ∀ {a b : Real} (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b) (δ : Real → Real) (i : Fin P.n), (GE.ge (P.points i.castSucc) (instHSub.hSub (P.tag i) (δ (P.tag i))) ∧ Real.instLE.le (P.points i.succ) (instHAdd.hAdd (P.tag i) (δ (P.tag i))))

Predicate logic (unfolded):

  ∀ {a b : Real} (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b) (δ : Real → Real) (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i 1, ⋯⟩) val isLt) val isLt) i)) (instHAdd.1 (P.2 i) (δ (P.2 i))))

Logical form (Lean):

```lean
def IsHKDeltaFine {a b : ℝ} (P : TaggedPartitionIntegration a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)
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
def IsHKDeltaFine {a b : ℝ} (P : TaggedPartitionIntegration a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

/--
`HasHKIntegral` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (LRA.Analysis.Integration.IsGaugeOn a b δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), LRA.Analysis.Integration.IsHKDeltaFine P δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L))) ε)

Logical form (Lean):

```lean
def HasHKIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ →
      |RiemannSum f P - L| < ε
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
def HasHKIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ →
      |RiemannSum f P - L| < ε

/--
`IsHKIntegrable` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun L => LRA.Analysis.Integration.HasHKIntegral f a b L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)

Logical form (Lean):

```lean
def IsHKIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasHKIntegral f a b L
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
def IsHKIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasHKIntegral f a b L

/--
`CousinsLemma` TODO

Predicate logic:

  (a ≤ b ∧ ℝ → ℝ ∧ IsGaugeOn a b δ) → ∃ P ∈ TaggedPartitionIntegration a b, IsHKDeltaFine P δ

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLE.1 a b → ∀ (δ : Real → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x)) → Exists fun P => ∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) (instHAdd.1 (P.2 i) (δ (P.2 i))))

Logical form (Lean):

```lean
theorem CousinsLemma (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ) (hδ : IsGaugeOn a b δ) :
    ∃ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ
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
theorem CousinsLemma (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ) (hδ : IsGaugeOn a b δ) :
    ∃ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ := by
  sorry
/--
`riemann_integrable_implies_hk_integrable` TODO

Predicate logic:

  (a ≤ b ∧ HasRiemannIntegral f a b L) → HasHKIntegral f a b L

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real}, Real.instLE.1 a b → ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)

Logical form (Lean):

```lean
theorem riemann_integrable_implies_hk_integrable (hab : a ≤ b) (L : ℝ)
    (hR : HasRiemannIntegral f a b L) : HasHKIntegral f a b L
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
theorem riemann_integrable_implies_hk_integrable (hab : a ≤ b) (L : ℝ)
    (hR : HasRiemannIntegral f a b L) : HasHKIntegral f a b L := by
  sorry
/--
`hk_straddle` TODO

Predicate logic:

  (ℝ → ℝ) → ∀ ε > 0, ∃ δξ > 0, ∀ u v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F u - Dξ * (v - u)| ≤ ε * (v - u)

Predicate logic (unfolded):

  ∀ (F : Real → Real) (ξ Dξ : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun _a => True) (instHAdd.1 ξ h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (F (instHAdd.hAdd ξ h)) (F ξ)) h) Dξ) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (F (instHAdd.hAdd ξ h)) (F ξ)) h) Dξ))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δξ => (Real.instLT.1 Zero.toOfNat0.1 δξ ∧ ∀ (u v : Real), Real.instLE.1 u ξ → Real.instLE.1 ξ v → Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.1 ξ δξ) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 ξ δξ))) u → Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 (instHSub.1 ξ δξ) x ∧ Real.instPreorder.toLT.1 x (instHAdd.1 ξ δξ))) v → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHSub.1 (F v) (F u)) (instHMul.1 Dξ (instHSub.1 v u))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHSub.1 (F v) (F u)) (instHMul.1 Dξ (instHSub.hSub v u))))) (instHMul.1 ε (instHSub.1 v u)))

Logical form (Lean):

```lean
theorem hk_straddle (F : ℝ → ℝ) (ξ : ℝ) (Dξ : ℝ)
    (hF : LRA.Analysis.Differentiation.Derivative Dξ F Set.univ ξ) :
    ∀ ε > 0, ∃ δξ > 0, ∀ u v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) →
      v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F u - Dξ * (v - u)| ≤ ε * (v - u)
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
theorem hk_straddle (F : ℝ → ℝ) (ξ : ℝ) (Dξ : ℝ)
    (hF : LRA.Analysis.Differentiation.Derivative Dξ F Set.univ ξ) :
    ∀ ε > 0, ∃ δξ > 0, ∀ u v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) →
      v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F u - Dξ * (v - u)| ≤ ε * (v - u) := by
  sorry
/--
`hk_fundamental_theorem` TODO

Predicate logic:

  (a ≤ b ∧ ∀ x ∈ Set.Icc a b, LRA.Analysis.Differentiation.Derivative (FD x) F Set.univ x) → HasHKIntegral FD a b (F b - F a)

Predicate logic (unfolded):

  ∀ {a b : Real} (F FD : Real → Real), (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun _a => True) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (F (instHAdd.hAdd x h)) (F x)) h) (FD x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (F (instHAdd.hAdd x h)) (F x)) h) (FD x)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (FD (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) (instHSub.1 (F b) (F a))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum FD P) (instHSub.hSub (F b) (F a))))) ε)

Logical form (Lean):

```lean
theorem hk_fundamental_theorem (F FD : ℝ → ℝ) (hab : a ≤ b)
    (hF : ∀ x ∈ Set.Icc a b, LRA.Analysis.Differentiation.Derivative (FD x) F Set.univ x) :
    HasHKIntegral FD a b (F b - F a)
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
theorem hk_fundamental_theorem (F FD : ℝ → ℝ) (hab : a ≤ b)
    (hF : ∀ x ∈ Set.Icc a b, LRA.Analysis.Differentiation.Derivative (FD x) F Set.univ x) :
    HasHKIntegral FD a b (F b - F a) := by
  sorry
/--
`continuous_hk_integrable` TODO

Predicate logic:

  (a ≤ b) → IsHKIntegrable f a b

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.tag i) (δ (P.tag i))) (P.toIntegrationPartition.2 i.castSucc) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.succ.match_1 (fun x => Fin (instHAdd.hAdd P.n 1)) i fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε)

Logical form (Lean):

```lean
theorem continuous_hk_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsHKIntegrable f a b
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
theorem continuous_hk_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsHKIntegrable f a b := by
  sorry
end LRA.Analysis.Integration
