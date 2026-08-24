
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Integration.Partitions

namespace LRA.Analysis.Integration

/--
`CauchySum` TODO

Predicate logic:

  def CauchySum {a b : ℝ} (f : ℝ → ℝ) (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n, f (P.points i.castSucc) * SubintervalWidth P i

Predicate logic (unfolded):

  def CauchySum {a b : ℝ} (f : ℝ → ℝ) (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n, f (P.points i.castSucc) * SubintervalWidth P i (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CauchySum {a b : ℝ} (f : ℝ → ℝ) (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n, f (P.points i.castSucc) * SubintervalWidth P i
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
def CauchySum {a b : ℝ} (f : ℝ → ℝ) (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n, f (P.points i.castSucc) * SubintervalWidth P i

/--
`HasCauchyIntegral` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.CauchySum f P) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val).sum L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L))) ε)

Logical form (Lean):

```lean
def HasCauchyIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : IntegrationPartition a b, PartitionMesh P < δ →
    |CauchySum f P - L| < ε
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
def HasCauchyIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : IntegrationPartition a b, PartitionMesh P < δ →
    |CauchySum f P - L| < ε

/--
`IsCauchyIntegrable` TODO

Predicate logic:

  ∀ (f : Real → Real) (a b : Real), Exists fun L => LRA.Analysis.Integration.HasCauchyIntegral f a b L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a b : Real), Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L))) ε)

Logical form (Lean):

```lean
def IsCauchyIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasCauchyIntegral f a b L
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
def IsCauchyIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasCauchyIntegral f a b L

/--
`CauchyIntegralConstant` TODO

Predicate logic:

  (a ≤ b) → HasCauchyIntegral (fun _ => c) a b (c * (b - a))

Predicate logic (unfolded):

  ∀ (a b c : Real), Real.instLE.1 a b → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => c) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) (instHMul.1 c (instHSub.hSub b a))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum (fun x => c) P) (instHMul.hMul c (instHSub.hSub b a))))) ε)

Logical form (Lean):

```lean
theorem CauchyIntegralConstant (a b c : ℝ) (hab : a ≤ b) :
    HasCauchyIntegral (fun _ => c) a b (c * (b - a))
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
theorem CauchyIntegralConstant (a b c : ℝ) (hab : a ≤ b) :
    HasCauchyIntegral (fun _ => c) a b (c * (b - a)) := by

  sorry

/--
`cauchy_integral_linearity` TODO

Predicate logic:

  (IsCauchyIntegrable f a b ∧ IsCauchyIntegrable g a b ∧ HasCauchyIntegral f a b Lf ∧ HasCauchyIntegral g a b Lg) → HasCauchyIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} {g : Real → Real}, (Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.CauchySum f P) L))) ε) ∧ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum g P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.CauchySum g P) L))) ε)) → ∀ (α β Lf Lg : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) Lf))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (g (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum g P) Lg))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) (instHAdd.1 (instHMul.hMul α Lf) (instHMul.hMul β Lg))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) P) (instHAdd.hAdd (instHMul.hMul α Lf) (instHMul.hMul β Lg))))) ε)

Logical form (Lean):

```lean
theorem cauchy_integral_linearity (hf : IsCauchyIntegrable f a b) (hg : IsCauchyIntegrable g a b)
    (α β Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf) (hLg : HasCauchyIntegral g a b Lg) :
    HasCauchyIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg)
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
theorem cauchy_integral_linearity (hf : IsCauchyIntegrable f a b) (hg : IsCauchyIntegrable g a b)
    (α β Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf) (hLg : HasCauchyIntegral g a b Lg) :
    HasCauchyIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by
  sorry

/--
`cauchy_integral_monotonicity` TODO

Predicate logic:

  (HasCauchyIntegral f a b Lf ∧ HasCauchyIntegral g a b Lg ∧ ∀ x ∈ Set.Icc a b, f x ≤ g x) → Lf ≤ Lg

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} {g : Real → Real} (Lf Lg : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) Lf))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (g (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum g P) Lg))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (f x) (g x))) → Real.instLE.1 Lf Lg

Logical form (Lean):

```lean
theorem cauchy_integral_monotonicity (Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf)
    (hLg : HasCauchyIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg
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
theorem cauchy_integral_monotonicity (Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf)
    (hLg : HasCauchyIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry

/--
`cauchy_integral_bounds` TODO

Predicate logic:

  (a ≤ b ∧ HasCauchyIntegral f a b L ∧ ∀ x ∈ Set.Icc a b, m ≤ f x ∧ ∀ x ∈ Set.Icc a b, f x ≤ M) → m * (b - a) ≤ L ∧ L ≤ M * (b - a)

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (L m M : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L))) ε) ∧ (∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 m (f x) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → Real.instLE.1 (f x) M)) → (Real.instLE.1 (instHMul.1 m (instHSub.1 b a)) L ∧ Real.instLE.1 L (instHMul.1 M (instHSub.1 b a)))

Logical form (Lean):

```lean
theorem cauchy_integral_bounds (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L m M : ℝ) (hL : HasCauchyIntegral f a b L)
    (hm : ∀ x ∈ Set.Icc a b, m ≤ f x) (hM : ∀ x ∈ Set.Icc a b, f x ≤ M) :
    m * (b - a) ≤ L ∧ L ≤ M * (b - a)
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
theorem cauchy_integral_bounds (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L m M : ℝ) (hL : HasCauchyIntegral f a b L)
    (hm : ∀ x ∈ Set.Icc a b, m ≤ f x) (hM : ∀ x ∈ Set.Icc a b, f x ≤ M) :
    m * (b - a) ≤ L ∧ L ≤ M * (b - a) := by
  sorry

/--
`cauchy_integral_triangle_inequality` TODO

Predicate logic:

  (HasCauchyIntegral f a b L ∧ HasCauchyIntegral (fun x => |f x|) a b L') → |L| ≤ L'

Predicate logic (unfolded):

  ∀ {f : Real → Real} {a b : Real} (L L' : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul ((fun x => abs (f x)) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L') (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum (fun x => abs (f x)) P) L'))) ε)) → Real.instLE.1 (SemilatticeSup.toMax.1 L (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 L)) L'

Logical form (Lean):

```lean
theorem cauchy_integral_triangle_inequality (L L' : ℝ) (hL : HasCauchyIntegral f a b L)
    (hL' : HasCauchyIntegral (fun x => |f x|) a b L') : |L| ≤ L'
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
theorem cauchy_integral_triangle_inequality (L L' : ℝ) (hL : HasCauchyIntegral f a b L)
    (hL' : HasCauchyIntegral (fun x => |f x|) a b L') : |L| ≤ L' := by
  sorry

/--
`cauchy_integral_interval_additivity` TODO

Predicate logic:

  (a ≤ c ∧ c ≤ b ∧ HasCauchyIntegral f a b Lab ∧ HasCauchyIntegral f a c Lac ∧ HasCauchyIntegral f c b Lcb) → Lab = Lac + Lcb

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real} (c : Real), (Real.instLE.1 a c ∧ Real.instLE.1 c b) → ∀ (Lab Lac Lcb : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lab) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) Lab))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a c), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lac) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) Lac))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition c b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Lcb) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) Lcb))) ε))) → Lab = instHAdd.1 Lac Lcb

Logical form (Lean):

```lean
theorem cauchy_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (Lab Lac Lcb : ℝ) (hab' : HasCauchyIntegral f a b Lab) (hac' : HasCauchyIntegral f a c Lac)
    (hcb' : HasCauchyIntegral f c b Lcb) : Lab = Lac + Lcb
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
theorem cauchy_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (Lab Lac Lcb : ℝ) (hab' : HasCauchyIntegral f a b Lab) (hac' : HasCauchyIntegral f a c Lac)
    (hcb' : HasCauchyIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry

/--
`IntervalOscillation` TODO

Predicate logic:

  noncomputable def IntervalOscillation (f : ℝ → ℝ) (I : Set ℝ) : ℝ :=
  0

Predicate logic (unfolded):

  noncomputable def IntervalOscillation (f : ℝ → ℝ) (I : Set ℝ) : ℝ :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def IntervalOscillation (f : ℝ → ℝ) (I : Set ℝ) : ℝ :=
  0
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
noncomputable def IntervalOscillation (f : ℝ → ℝ) (I : Set ℝ) : ℝ :=
  0

/--
`continuous_cauchy_integrable` TODO

Predicate logic:

  (a ≤ b) → IsCauchyIntegrable f a b

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.CauchySum f P) L))) ε)

Logical form (Lean):

```lean
theorem continuous_cauchy_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsCauchyIntegrable f a b
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
theorem continuous_cauchy_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsCauchyIntegrable f a b := by
  sorry

/--
`cauchy_tag_independence` TODO

Predicate logic:

  (a ≤ b ∧ HasCauchyIntegral f a b L) → ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ → |∑ i ∈ Fin P.n, f (P.tag i * SubintervalWidth P.toIntegrationPartition i) - L| < ε

Predicate logic (unfolded):

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.1 a b ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x_1) (f x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (f x_1) (f x)))) ε)) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 0) fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Finset.univ.sum fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum f P) L))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.1 Zero.toOfNat0.1) fun w => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (Multiset.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) Finset.univ.val).sum L))) ε)

Logical form (Lean):

```lean
theorem cauchy_tag_independence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L : ℝ) (hL : HasCauchyIntegral f a b L) :
    ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ →
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

Related proof moves: intro, use, rcases

-/
theorem cauchy_tag_independence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L : ℝ) (hL : HasCauchyIntegral f a b L) :
    ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε := by
  sorry

/--
`cauchy_step_function_failure_witness` TODO

Predicate logic:

  IsCauchyIntegrable (fun x => if x < 1 ∈ ℝ/2 then 0 ∈ ℝ else 1) 0 1

Predicate logic (unfolded):

  Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (P : LRA.Analysis.Integration.IntegrationPartition Zero.toOfNat0.1 One.toOfNat1.1), Real.instLT.1 (Real.instSupSet.1 (Set.instUnion.1 (Set.instSingletonSet.singleton 0) (setOf fun w => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (LRA.Analysis.Integration.CauchySum (fun x => ite (Real.instLT.lt x (1 / 2)) 0 1) P) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (LRA.Analysis.Integration.CauchySum (fun x => ite (Real.instLT.lt x (1 / 2)) 0 1) P) L))) ε)

Logical form (Lean):

```lean
theorem cauchy_step_function_failure_witness :
    IsCauchyIntegrable (fun x => if x < (1:ℝ)/2 then (0:ℝ) else 1) 0 1
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
theorem cauchy_step_function_failure_witness :
    IsCauchyIntegrable (fun x => if x < (1:ℝ)/2 then (0:ℝ) else 1) 0 1 := by
  sorry

end LRA.Analysis.Integration
