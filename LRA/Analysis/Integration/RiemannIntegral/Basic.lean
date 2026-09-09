
import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Completeness.Density
import LRA.Analysis.Integration.CauchyIntegral.Basic

namespace LRA.Analysis.Integration

/--
`RiemannSum` TODO

Predicate logic:

  def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
    ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i

Predicate logic (unfolded):

  def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
    ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
  ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i
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
def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
  ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i

/--
`HasRiemannIntegral` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = { hSub := fun a b => Real.instSub.sub a b }.hSub (P.toIntegrationPartition.2 i.succ) (P.toIntegrationPartition.2 i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯)) L)) ε))

Logical form (Lean):

```lean
def HasRiemannIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ → |RiemannSum f P - L| < ε
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
def HasRiemannIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ → |RiemannSum f P - L| < ε

/--
`IsRiemannIntegrable` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun L => LRA.Analysis.Integration.HasRiemannIntegral f a b L

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))

Logical form (Lean):

```lean
def IsRiemannIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasRiemannIntegral f a b L
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
def IsRiemannIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasRiemannIntegral f a b L

variable {f g : ℝ → ℝ} {a b : ℝ}

/--
`continuous_riemann_integrable` TODO

Predicate logic:

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → LRA.Analysis.Integration.IsRiemannIntegrable f a b

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))

Logical form (Lean):

```lean
theorem continuous_riemann_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsRiemannIntegrable f a b
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
theorem continuous_riemann_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsRiemannIntegrable f a b := by
  sorry
/--
`thomae_riemann_integrable_zero` TODO

Predicate logic:

  ∀ (T : Real → Real), (∀ (x : Real), x ∈ Set.Icc 0 1 → ((LRA.Analysis.Completeness.IsIrrational x → T x = 0) ∧ (∀ (p q : Nat), GT.gt q 0 → p.Coprime q → x = instHDiv.hDiv p.cast q.cast → T x = instHDiv.hDiv 1 q.cast))) → LRA.Analysis.Integration.HasRiemannIntegral T 0 1 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    T : ℝ → ℝ
  Prove
    (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le 0 x ∧ Real.instPreorder.1.le x 1) → (((x ∈ fun x => Exists fun y => y.cast = x → False) → T x = 0) ∧ (∀ (p q : Nat), instLTNat.lt 0 q → p.gcd q = 1 → x = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Real.instNatCast.1 p) (Real.instNatCast.1 q) → T x = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (Real.instNatCast.1 q)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration 0 1), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (T (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) 0)) ε))

Logical form (Lean):

```lean
theorem thomae_riemann_integrable_zero (T : ℝ → ℝ)
    (hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
      (LRA.Analysis.Completeness.IsIrrational x → T x = 0) ∧
      (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) :
    HasRiemannIntegral T 0 1 0
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
theorem thomae_riemann_integrable_zero (T : ℝ → ℝ)
    (hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
      (LRA.Analysis.Completeness.IsIrrational x → T x = 0) ∧
      (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) :
    HasRiemannIntegral T 0 1 0 := by
  sorry
/--
`riemann_integral_linearity` TODO

Predicate logic:

  ∀ {f g : Real → Real} {a b : Real} (α β Lf Lg : Real), (LRA.Analysis.Integration.HasRiemannIntegral f a b Lf ∧ LRA.Analysis.Integration.HasRiemannIntegral g a b Lg) → LRA.Analysis.Integration.HasRiemannIntegral (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) a b (instHAdd.hAdd (instHMul.hMul α Lf) (instHMul.hMul β Lg))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    α β Lf Lg : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (g (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul α Lf) ({ hMul := fun a b => Real.instMul.mul a b }.hMul β Lg)))) ε))

Logical form (Lean):

```lean
theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) :
    HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)
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
theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) :
    HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by
  sorry
/--
`riemann_integral_monotonicity` TODO

Predicate logic:

  ∀ {f g : Real → Real} {a b : Real} (Lf Lg : Real), (LRA.Analysis.Integration.HasRiemannIntegral f a b Lf ∧ (LRA.Analysis.Integration.HasRiemannIntegral g a b Lg ∧ (∀ (x : Real), x ∈ Set.Icc a b → Real.instLE.le (f x) (g x)))) → Real.instLE.le Lf Lg

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    Lf Lg : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lf)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (g (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lg)) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (f x) (g x)))) → Real.instLE.le Lf Lg

Logical form (Lean):

```lean
theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg
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
theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry
/--
`riemann_integral_triangle_inequality` TODO

Predicate logic:

  ∀ {f : Real → Real} {a b : Real}, LRA.Analysis.Integration.IsRiemannIntegrable f a b → (LRA.Analysis.Integration.IsRiemannIntegrable (fun x => abs (f x)) a b ∧ (∀ (L L' : Real), LRA.Analysis.Integration.HasRiemannIntegral f a b L → LRA.Analysis.Integration.HasRiemannIntegral (fun x => abs (f x)) a b L' → Real.instLE.le (abs L) L'))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
  Prove
    (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))) → ((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul ((fun x => abs (f x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))) ∧ (∀ (L L' : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L)) ε))) → (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => abs (f x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L')) ε))) → Real.instLE.le (abs L) L'))

Logical form (Lean):

```lean
theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) :
    IsRiemannIntegrable (fun x => |f x|) a b ∧
    ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' →
      |L| ≤ L'
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
theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) :
    IsRiemannIntegrable (fun x => |f x|) a b ∧
    ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' →
      |L| ≤ L' := by
  sorry
/--
`riemann_integral_interval_additivity` TODO

Predicate logic:

  ∀ {f : Real → Real} {a b : Real} (c : Real), (Real.instLE.le a c ∧ Real.instLE.le c b) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ (LRA.Analysis.Integration.IsRiemannIntegrable f a c ∧ LRA.Analysis.Integration.IsRiemannIntegrable f c b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    c : ℝ
  Prove
    (Real.instLE.le a c ∧ Real.instLE.le c b) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ (LRA.Analysis.Integration.IsRiemannIntegrable f a c ∧ LRA.Analysis.Integration.IsRiemannIntegrable f c b)

Logical form (Lean):

```lean
theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) :
    IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) :
    IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b := by
  sorry
/--
`riemann_integral_interval_additivity_value` TODO

Predicate logic:

  ∀ {f : Real → Real} {a b : Real} (c Lab Lac Lcb : Real), (Real.instLE.le a c ∧ (Real.instLE.le c b ∧ (LRA.Analysis.Integration.HasRiemannIntegral f a b Lab ∧ (LRA.Analysis.Integration.HasRiemannIntegral f a c Lac ∧ LRA.Analysis.Integration.HasRiemannIntegral f c b Lcb)))) → Lab = instHAdd.hAdd Lac Lcb

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    c Lab Lac Lcb : ℝ
  Prove
    (Real.instLE.le a c ∧ (Real.instLE.le c b ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lab)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a c), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lac)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration c b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) Lcb)) ε))))))) → Lab = { hAdd := fun a b => Real.instAdd.add a b }.hAdd Lac Lcb

Logical form (Lean):

```lean
theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac)
    (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb
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
theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac)
    (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry
/--
`riemann_cauchy_criterion` TODO

Predicate logic:

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P Q : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh Q.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) (LRA.Analysis.Integration.RiemannSum f Q))) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a b : ℝ
    hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) → LRA.Analysis.Integration.IsRiemannIntegrable f a b ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P Q : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh Q.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) (LRA.Analysis.Integration.RiemannSum f Q))) ε))

Logical form (Lean):

```lean
theorem riemann_cauchy_criterion (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
        PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
        |RiemannSum f P - RiemannSum f Q| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem riemann_cauchy_criterion (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
        PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
        |RiemannSum f P - RiemannSum f Q| < ε := by
  sorry
end LRA.Analysis.Integration
