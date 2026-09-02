
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Integration.HenstockKurzweil.Basic
import LRA.Analysis.Integration.MeasureZero

namespace LRA.Analysis.Integration

/--
`McShaneTaggedPartition` TODO

Predicate logic:

  structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b

Predicate logic (unfolded):

  structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b
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
structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b

/--
`IsMcShaneDeltaFine` TODO

Predicate logic:

  ∀ {a b : Real} (P : LRA.Analysis.Integration.McShaneTaggedPartition a b) (δ : Real → Real) (i : Fin P.n), (GE.ge (P.points i.castSucc) (instHSub.hSub (P.tag i) (δ (P.tag i))) ∧ Real.instLE.le (P.points i.succ) (instHAdd.hAdd (P.tag i) (δ (P.tag i))))

Predicate logic (unfolded):

  ∀ {a b : Real} (P : LRA.Analysis.Integration.McShaneTaggedPartition a b) (δ : Real → Real) (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.1 i 1, ⋯⟩) val isLt) val isLt) i)) (instHAdd.1 (P.2 i) (δ (P.2 i))))

Logical form (Lean):

```lean
def IsMcShaneDeltaFine {a b : ℝ} (P : McShaneTaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
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
def IsMcShaneDeltaFine {a b : ℝ} (P : McShaneTaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

/--
`HasMcShaneIntegral` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (LRA.Analysis.Integration.IsGaugeOn a b δ ∧ ∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), LRA.Analysis.Integration.IsMcShaneDeltaFine P δ → Real.instLT.lt (abs (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L))) ε)

Logical form (Lean):

```lean
def HasMcShaneIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : McShaneTaggedPartition a b, IsMcShaneDeltaFine P δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε
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
def HasMcShaneIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : McShaneTaggedPartition a b, IsMcShaneDeltaFine P δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε

/--
`IsMcShaneIntegrable` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun L => LRA.Analysis.Integration.HasMcShaneIntegral f a b L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L))) ε)

Logical form (Lean):

```lean
def IsMcShaneIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasMcShaneIntegral f a b L
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
def IsMcShaneIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasMcShaneIntegral f a b L

variable {f : ℝ → ℝ} {a b : ℝ}

/--
`riemann_mcshane_hk_inclusions` TODO

Predicate logic:

  (a ≤ b) → (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧ (HasMcShaneIntegral f a b L → HasHKIntegral f a b L)

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, Real.instLE.1 a b → ∀ (L : Real), ((∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLT.1 Zero.toOfNat0.1 (δ x) ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.1 (instHSub.1 (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.1 (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) (instHAdd.1 (P.2 i) (δ (P.2 i))))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε))

Logical form (Lean):

```lean
theorem riemann_mcshane_hk_inclusions (hab : a ≤ b) (L : ℝ) :
    (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧
    (HasMcShaneIntegral f a b L → HasHKIntegral f a b L)
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
theorem riemann_mcshane_hk_inclusions (hab : a ≤ b) (L : ℝ) :
    (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧
    (HasMcShaneIntegral f a b L → HasHKIntegral f a b L) := by
  sorry
end LRA.Analysis.Integration
