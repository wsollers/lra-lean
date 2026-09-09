
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Integration

/--
`IsGaugeOn` TODO

Predicate logic:

  ∀ (a b : Real) (δ : Real → Real) (x : Real), x ∈ Set.Icc a b → GT.gt (δ x) 0

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.1, ⋯⟩) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))

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

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (LRA.Analysis.Integration.IsGaugeOn a b δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), LRA.Analysis.Integration.IsHKDeltaFine P δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯)) L)) ε))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))

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

  ∀ (a b : Real), Real.instLE.le a b → ∀ (δ : Real → Real), LRA.Analysis.Integration.IsGaugeOn a b δ → Exists fun P => LRA.Analysis.Integration.IsHKDeltaFine P δ

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    δ : ℝ → ℝ
  Prove
    Real.instLE.le a b → ∀ (δ : Real → Real), (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) → Exists fun P => ∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))

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

  ∀ {a b : Real} {f : Real → Real}, Real.instLE.le a b → ∀ (L : Real), LRA.Analysis.Integration.HasRiemannIntegral f a b L → LRA.Analysis.Integration.HasHKIntegral f a b L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    L : ℝ
  Prove
    Real.instLE.le a b → ∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))

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

  ∀ (F : Real → Real) (ξ Dξ : Real), LRA.Analysis.Differentiation.Derivative Dξ F Set.univ ξ → ∀ (ε : Real), GT.gt ε 0 → Exists fun δξ => (GT.gt δξ 0 ∧ (∀ (u v : Real), Real.instLE.le u ξ → Real.instLE.le ξ v → u ∈ Set.Ioo (instHSub.hSub ξ δξ) (instHAdd.hAdd ξ δξ) → v ∈ Set.Ioo (instHSub.hSub ξ δξ) (instHAdd.hAdd ξ δξ) → Real.instLE.le (abs (instHSub.hSub (instHSub.hSub (F v) (F u)) (instHMul.hMul Dξ (instHSub.hSub v u)))) (instHMul.hMul ε (instHSub.hSub v u))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    F : ℝ → ℝ
    ξ : ℝ
    Dξ : ℝ
    hF : LRA.Analysis.Differentiation.Derivative Dξ F Set.univ ξ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd ξ h ∈ fun _a => True → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (F ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ξ h)) (F ξ)) h) Dξ)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δξ => (Real.instLT.lt 0 δξ ∧ (∀ (u v : Real), Real.instLE.le u ξ → Real.instLE.le ξ v → u ∈ fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub ξ δξ) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ξ δξ)) → v ∈ fun x => (Real.instPreorder.2.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub ξ δξ) x ∧ Real.instPreorder.2.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ξ δξ)) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hSub := fun a b => Real.instSub.sub a b }.hSub (F v) (F u)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul Dξ ({ hSub := fun a b => Real.instSub.sub a b }.hSub v u)))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε ({ hSub := fun a b => Real.instSub.sub a b }.hSub v u))))

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

  ∀ {a b : Real} (F FD : Real → Real), (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ Set.Icc a b → LRA.Analysis.Differentiation.Derivative (FD x) F Set.univ x)) → LRA.Analysis.Integration.HasHKIntegral FD a b (instHSub.hSub (F b) (F a))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    F FD : ℝ → ℝ
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun _a => True → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (F ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (F x)) h) (FD x))) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (FD (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub (F b) (F a)))) ε))

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

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → LRA.Analysis.Integration.IsHKIntegrable f a b

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castAdd 1 i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.casesOn i fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))

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
