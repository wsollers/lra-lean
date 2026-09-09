
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.1, ⋯⟩) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))

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

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (LRA.Analysis.Integration.IsGaugeOn a b δ ∧ (∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), LRA.Analysis.Integration.IsMcShaneDeltaFine P δ → Real.instLT.lt (abs (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 ⟨i.val, ⋯⟩) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨{ hAdd := fun a b => instAddNat.add a b }.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯ Finset.univ.val)) L)) ε))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯)) L)) ε))

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

  ∀ {f : Real → Real} {a b : Real}, Real.instLE.le a b → ∀ (L : Real), ((LRA.Analysis.Integration.HasRiemannIntegral f a b L → LRA.Analysis.Integration.HasMcShaneIntegral f a b L) ∧ (LRA.Analysis.Integration.HasMcShaneIntegral f a b L → LRA.Analysis.Integration.HasHKIntegral f a b L))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    a b : ℝ
    L : ℝ
  Prove
    Real.instLE.le a b → ∀ (L : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯)) L)) ε)) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.McShaneTaggedPartition a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯)) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (δ x)) ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), (∀ (i : Fin P.toIntegrationPartition.1), (Real.instLE.le ({ hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i) (δ (P.2 i))) (P.toIntegrationPartition.2 (Fin.castLE ⋯ i)) ∧ Real.instLE.le (P.toIntegrationPartition.2 (Fin.rec (fun val isLt => (fun val isLt => (fun i h => ⟨instHAdd.hAdd i 1, ⋯⟩) val isLt) val isLt) i)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (P.2 i) (δ (P.2 i))))) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε)))

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
