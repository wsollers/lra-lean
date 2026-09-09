
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun P => a_1 = Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => abs (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯ Finset.univ.val)

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

  ∀ (α : Real → Real) (a b : Real), Exists fun x => x ∈ upperBounds (LRA.Analysis.Integration.VariationSums α a b)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => x ∈ fun x => ∀ ⦃a_1 : Real⦄, a_1 ∈ fun v => Exists fun P => v = Finset.univ.sum fun i => abs (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc))) → Real.instLE.le a_1 x

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

  ∀ (α : Real → Real) (a b : Real), (Real.instLE.le a b ∧ MonotoneOn α (Set.Icc a b)) → LRA.Analysis.Integration.HasBoundedVariation α a b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    α : ℝ → ℝ
    a b : ℝ
    hmono : MonotoneOn α (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ ⦃a_1 : Real⦄, a_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ ⦃b_1 : Real⦄, b_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instPreorder.1.le a_1 b_1 → Real.instPreorder.1.le (α a_1) (α b_1))) → Exists fun x => x ∈ fun x => ∀ ⦃a_2 : Real⦄, a_2 ∈ LRA.Analysis.Integration.VariationSums α a b → Real.instLE.le a_2 x

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

  ∀ (f α : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) L)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = { hSub := fun a b => Real.instSub.sub a b }.hSub (P.toIntegrationPartition.2 i.succ) (P.toIntegrationPartition.2 i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯ Finset.univ.val)) L)) ε))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) L)) ε))

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

  ∀ {a b : Real} {f α : Real → Real}, (Real.instLE.le a b ∧ (LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b) ∧ LRA.Analysis.Integration.HasBoundedVariation α a b)) → LRA.Analysis.Integration.IsRiemannStieltjesIntegrable f α a b

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε))) ∧ (Exists fun x => x ∈ fun x => ∀ ⦃a_1 : Real⦄, a_1 ∈ LRA.Analysis.Integration.VariationSums α a b → Real.instLE.le a_1 x))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) Finset.univ.val)) L)) ε))

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

  ∀ {f α : Real → Real} {a b : Real} {g β : Real → Real} (Lfα Lgα : Real), (LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b Lfα ∧ LRA.Analysis.Integration.HasRiemannStieltjesIntegral g α a b Lgα) → ∀ (lam μ : Real), (LRA.Analysis.Integration.HasRiemannStieltjesIntegral (fun x => instHAdd.hAdd (instHMul.hMul lam (f x)) (instHMul.hMul μ (g x))) α a b (instHAdd.hAdd (instHMul.hMul lam Lfα) (instHMul.hMul μ Lgα)) ∧ (∀ (Lfβ : Real), LRA.Analysis.Integration.HasRiemannStieltjesIntegral f β a b Lfβ → LRA.Analysis.Integration.HasRiemannStieltjesIntegral f (fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) a b (instHAdd.hAdd (instHMul.hMul lam Lfα) (instHMul.hMul μ Lfβ))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    Lfα Lgα : ℝ
    lam μ : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lfα)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (g (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lgα)) ε)))) → ∀ (lam μ : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul lam (f x)) (instHMul.hMul μ (g x))) (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam Lfα) ({ hMul := fun a b => Real.instMul.mul a b }.hMul μ Lgα)))) ε))) ∧ (∀ (Lfβ : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (β (P.points i.succ)) (β (P.points i.castSucc)))) l)) ⋯)) Lfβ)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.succ)) ((fun x => instHAdd.hAdd (instHMul.hMul lam (α x)) (instHMul.hMul μ (β x))) (P.points i.castSucc)))) l)) ⋯)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam Lfα) ({ hMul := fun a b => Real.instMul.mul a b }.hMul μ Lfβ)))) ε))))

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

  ∀ {a b : Real} {f α : Real → Real} (c Lab Lac Lcb : Real), (Real.instLE.le a c ∧ (Real.instLE.le c b ∧ (LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b Lab ∧ (LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a c Lac ∧ LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α c b Lcb)))) → Lab = instHAdd.hAdd Lac Lcb

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c Lab Lac Lcb : ℝ
  Prove
    (Real.instLE.le a c ∧ (Real.instLE.le c b ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lab)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a c), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lac)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration c b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lcb)) ε))))))) → Lab = { hAdd := fun a b => Real.instAdd.add a b }.hAdd Lac Lcb

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

  ∀ {f α : Real → Real} {a b : Real} (L : Real), LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b L → Exists fun L' => (LRA.Analysis.Integration.HasRiemannStieltjesIntegral α f a b L' ∧ instHAdd.hAdd L L' = instHSub.hSub (instHMul.hMul (f b) (α b)) (instHMul.hMul (f a) (α a)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    L : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) L)) ε))) → Exists fun L' => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (α (P.tag i)) (instHSub.hSub (f (P.points i.succ)) (f (P.points i.castSucc)))) l)) ⋯)) L')) ε))) ∧ { hAdd := fun a b => Real.instAdd.add a b }.hAdd L L' = { hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f b) (α b)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (f a) (α a)))

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

  ∀ {a b : Real} {α f : Real → Real}, Real.instLE.le a b → ∀ (αD : Real → Real), (LRA.Analysis.Differentiation.IsClassC1 α αD (Set.Icc a b) ∧ LRA.Analysis.Integration.IsRiemannIntegrable (fun x => instHMul.hMul (f x) (αD x)) a b) → ∀ (Lint : Real), LRA.Analysis.Integration.HasRiemannIntegral (fun x => instHMul.hMul (f x) (αD x)) a b Lint → LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b Lint

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    αD : ℝ → ℝ
    hα : LRA.Analysis.Differentiation.IsClassC1 α αD (Set.Icc a b)
    Lint : ℝ
  Prove
    Real.instLE.le a b → ∀ (αD : Real → Real), (((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (α ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (α x)) h) (αD x))) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.le a x ∧ Real.instPreorder.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (αD x_1) (αD x))) ε)))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul ((fun x => instHMul.hMul (f x) (αD x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε)))) → ∀ (Lint : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => instHMul.hMul (f x) (αD x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lint)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) Lint)) ε))

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

  ∀ {a b : Real} {α f : Real → Real} (n : Nat) (c : Fin n → Real), (∀ (i : Fin n), c i ∈ Set.Icc a b) → ∀ (jump : Fin n → Real), ((∀ (x : Real), x ∈ Set.Icc a b → (∀ (i : Fin n), Ne x (c i)) → Exists fun k => ∀ (y : Real), y ∈ Set.Icc a b → (∀ (i : Fin n), Ne y (c i)) → α y = k) ∧ ((∀ (i : Fin n), LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i)) ∧ (∀ (i : Fin n), LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) (c i)))) → LRA.Analysis.Integration.HasRiemannStieltjesIntegral f α a b (Finset.univ.sum fun i => instHMul.hMul (f (c i)) (jump i))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    c : Fin n → ℝ
    jump : Fin n → ℝ
  Prove
    (∀ (i : Fin n), c i ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b)) → ∀ (jump : Fin n → Real), ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → (∀ (i : Fin n), x = c i → False) → Exists fun k => ∀ (y : Real), y ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → (∀ (i : Fin n), y = c i → False) → α y = k) ∧ ((∀ (i : Fin n), (Real.instLE.le 0 (jump i) ∧ (Exists fun L₁ => Exists fun L₂ => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub (c i) δ) x → Real.instLT.lt x (c i) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (α x) L₁)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (c i) x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (c i) δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (α x) L₂)) ε))) ∧ jump i = { hSub := fun a b => Real.instSub.sub a b }.hSub L₂ L₁))))) ∧ (∀ (i : Fin n) (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x (c i))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f (c i)))) ε))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (instHSub.hSub (α (P.points i.succ)) (α (P.points i.castSucc)))) l)) ⋯)) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (c i)) (jump i)) l)) ⋯)))) ε))

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

  ∀ (c : Real), c ∈ Set.Ioo 0 1 → ¬ LRA.Analysis.Integration.IsRiemannStieltjesIntegrable (fun x => ite (GE.ge x c) 1 0) (fun x => ite (GE.ge x c) 1 0) 0 1

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c : ℝ
  Prove
    ((c ∈ fun x => (Real.instPreorder.2.lt 0 x ∧ Real.instPreorder.2.lt x 1)) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration 0 1), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.singleton 0 ∪ setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul ((fun x => ite (GE.ge x c) 1 0) (P.tag i)) (instHSub.hSub ((fun x => ite (GE.ge x c) 1 0) (P.points i.succ)) ((fun x => ite (GE.ge x c) 1 0) (P.points i.castSucc)))) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε)))) → False

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
