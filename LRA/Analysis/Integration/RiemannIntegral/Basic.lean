
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

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L))) ε)

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

  ∀ (f : Real → Real) (a b : Real), Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)

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

  (a ≤ b) → IsRiemannIntegrable f a b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε)

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

  (ℝ → ℝ ∧ ∀ x ∈ Set.Icc 0 ∈ ℝ 1, (LRA.Analysis.Completeness.IsIrrational x → T x = 0) ∧ ∀ p q ∈ ℕ, q > 0 → Nat.Coprime p q → x = p ∈ ℝ / q → T x = 1 / q) → HasRiemannIntegral T 0 1 0

Predicate logic (unfolded):

  ∀ (T : Real → Real), (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) x → ((Set.instMembership.1 (fun x => Exists fun y => y.cast = x)x → False) → T x = Zero.toOfNat0.1 ∧ ∀ (p q : Nat), instLTNat.1 (instOfNatNat 0).1 q → p.gcd q = instOfNatNat 1.1 → x = instHDiv.1 (Real.instNatCast.1 p) (Real.instNatCast.1 q) → T x = instHDiv.1 One.toOfNat1.1 (Real.instNatCast.1 q))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration Zero.toOfNat0.1 One.toOfNat1.1), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (T (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum T P) 0))) ε)

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

  (HasRiemannIntegral f a b Lf ∧ HasRiemannIntegral g a b Lg) → HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {a b : Real} (α β Lf Lg : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) Lf))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (g (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum g P) Lg))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) (instHAdd.1 (instHMul.hMul α Lf) (instHMul.hMul β Lg))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) P) (instHAdd.hAdd (instHMul.hMul α Lf) (instHMul.hMul β Lg))))) ε)

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

  (HasRiemannIntegral f a b Lf ∧ HasRiemannIntegral g a b Lg ∧ ∀ x ∈ Set.Icc a b, f x ≤ g x) → Lf ≤ Lg

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {a b : Real} (Lf Lg : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) Lf))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (g (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum g P) Lg))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (f x) (g x))) → Real.instLE.1 Lf Lg

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

  (IsRiemannIntegrable f a b) → IsRiemannIntegrable (fun x => |f x|) a b ∧ ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' → |L| ≤ L'

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε)) → (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum (fun x => abs (f x)) P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum (fun x => abs (f x)) P) L))) ε) ∧ ∀ (L L' : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L))) ε)) → (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => abs (f x)) (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L') (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum (fun x => abs (f x)) P) L'))) ε)) → Real.instLE.1 (SemilatticeSup.toMax.1 L (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 L)) L')

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

  (a ≤ c ∧ c ≤ b) → IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} (c : Real), (Real.instLE.1 a c ∧ Real.instLE.1 c b) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε) ↔ (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a c), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration c b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε))

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

  (a ≤ c ∧ c ≤ b ∧ HasRiemannIntegral f a b Lab ∧ HasRiemannIntegral f a c Lac ∧ HasRiemannIntegral f c b Lcb) → Lab = Lac + Lcb

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} (c Lab Lac Lcb : Real), (Real.instLE.1 a c ∧ (Real.instLE.1 c b ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lab) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) Lab))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a c), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lac) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) Lac))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration c b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Lcb) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) Lcb))) ε))))) → Lab = instHAdd.1 Lac Lcb

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

  (a ≤ b) → IsRiemannIntegrable f a b ↔ ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ → |RiemannSum f P - RiemannSum f Q| < ε

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real}, (Real.instLE.1 a b ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.RiemannSum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.RiemannSum f P) L))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P Q : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (Q.points i.succ) (Q.points i.castSucc))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum (Multiset.map (fun i => instHMul.hMul (f (Q.tag i)) (LRA.Analysis.Integration.SubintervalWidth Q.toIntegrationPartition i)) Finset.univ.val).sum) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) (Finset.univ.sum fun i => instHMul.hMul (f (Q.tag i)) (LRA.Analysis.Integration.SubintervalWidth Q.toIntegrationPartition i))))) ε)

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
