
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

  ∀ (f : Real → Real) (a b L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P) δ → Real.instLT.lt (abs (instHSub.hSub (LRA.Analysis.Integration.CauchySum f P) L)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = { hSub := fun a b => Real.instSub.sub a b }.hSub (P.2 i.succ) (P.2 i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) l)) ⋯)) L)) ε))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) L)) ε))

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

  ∀ (a b c : Real), Real.instLE.le a b → LRA.Analysis.Integration.HasCauchyIntegral (fun x => c) a b (instHMul.hMul c (instHSub.hSub b a))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b c : ℝ
  Prove
    Real.instLE.le a b → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => c) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul c ({ hSub := fun a b => Real.instSub.sub a b }.hSub b a)))) ε))

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

  ∀ {f : Real → Real} {a b : Real} {g : Real → Real}, (LRA.Analysis.Integration.IsCauchyIntegrable f a b ∧ LRA.Analysis.Integration.IsCauchyIntegrable g a b) → ∀ (α β Lf Lg : Real), (LRA.Analysis.Integration.HasCauchyIntegral f a b Lf ∧ LRA.Analysis.Integration.HasCauchyIntegral g a b Lg) → LRA.Analysis.Integration.HasCauchyIntegral (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) a b (instHAdd.hAdd (instHMul.hMul α Lf) (instHMul.hMul β Lg))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    α β Lf Lg : ℝ
  Prove
    ((Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))) ∧ (Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (g (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε)))) → ∀ (α β Lf Lg : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lf)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (g (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lg)) ε)))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul α Lf) ({ hMul := fun a b => Real.instMul.mul a b }.hMul β Lg)))) ε))

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

  ∀ {f : Real → Real} {a b : Real} {g : Real → Real} (Lf Lg : Real), (LRA.Analysis.Integration.HasCauchyIntegral f a b Lf ∧ (LRA.Analysis.Integration.HasCauchyIntegral g a b Lg ∧ (∀ (x : Real), x ∈ Set.Icc a b → Real.instLE.le (f x) (g x)))) → Real.instLE.le Lf Lg

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    Lf Lg : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lf)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (g (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lg)) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (f x) (g x)))) → Real.instLE.le Lf Lg

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

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (L m M : Real), (LRA.Analysis.Integration.HasCauchyIntegral f a b L ∧ ((∀ (x : Real), x ∈ Set.Icc a b → Real.instLE.le m (f x)) ∧ (∀ (x : Real), x ∈ Set.Icc a b → Real.instLE.le (f x) M))) → (Real.instLE.le (instHMul.hMul m (instHSub.hSub b a)) L ∧ Real.instLE.le L (instHMul.hMul M (instHSub.hSub b a)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
    L m M : ℝ
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (L m M : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) L)) ε))) ∧ ((∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le m (f x)) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLE.le (f x) M))) → (Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul m ({ hSub := fun a b => Real.instSub.sub a b }.hSub b a)) L ∧ Real.instLE.le L ({ hMul := fun a b => Real.instMul.mul a b }.hMul M ({ hSub := fun a b => Real.instSub.sub a b }.hSub b a)))

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

  ∀ {f : Real → Real} {a b : Real} (L L' : Real), (LRA.Analysis.Integration.HasCauchyIntegral f a b L ∧ LRA.Analysis.Integration.HasCauchyIntegral (fun x => abs (f x)) a b L') → Real.instLE.le (abs L) L'

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    L L' : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) L)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul ((fun x => abs (f x)) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) L')) ε)))) → Real.instLE.le (abs L) L'

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

  ∀ {a b : Real} {f : Real → Real} (c : Real), (Real.instLE.le a c ∧ Real.instLE.le c b) → ∀ (Lab Lac Lcb : Real), (LRA.Analysis.Integration.HasCauchyIntegral f a b Lab ∧ (LRA.Analysis.Integration.HasCauchyIntegral f a c Lac ∧ LRA.Analysis.Integration.HasCauchyIntegral f c b Lcb)) → Lab = instHAdd.hAdd Lac Lcb

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    c : ℝ
    Lab Lac Lcb : ℝ
  Prove
    (Real.instLE.le a c ∧ Real.instLE.le c b) → ∀ (Lab Lac Lcb : Real), ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lab)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a c), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lac)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition c b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) Lcb)) ε))))) → Lab = { hAdd := fun a b => Real.instAdd.add a b }.hAdd Lac Lcb

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

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → LRA.Analysis.Integration.IsCauchyIntegrable f a b

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))

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

  ∀ {a b : Real} {f : Real → Real}, (Real.instLE.le a b ∧ LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) → ∀ (L : Real), LRA.Analysis.Integration.HasCauchyIntegral f a b L → ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (LRA.Analysis.Integration.PartitionMesh P.toIntegrationPartition) δ → Real.instLT.lt (abs (instHSub.hSub (Finset.univ.sum fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) L)) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)
    L : ℝ
  Prove
    (Real.instLE.le a b ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x_1) (f x))) ε)))) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = instHSub.hSub (P.points i.succ) (P.points i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun i => instHMul.hMul (f (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val)) L)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.TaggedPartitionIntegration a b), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = { hSub := fun a b => Real.instSub.sub a b }.hSub (P.toIntegrationPartition.2 i.succ) (P.toIntegrationPartition.2 i.castSucc))) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (f (P.tag i)) (LRA.Analysis.Integration.SubintervalWidth P.toIntegrationPartition i)) l)) ⋯ Finset.univ.val)) L)) ε))

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

  LRA.Analysis.Integration.IsCauchyIntegrable (fun x => ite (Real.instLT.lt x (1 / 2)) 0 1) 0 1

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (P : LRA.Analysis.Integration.IntegrationPartition 0 1), Real.instLT.lt (Real.instSupSet.1 (Set.instSingletonSet.1 0 ∪ funw => Exists fun i => w = LRA.Analysis.Integration.SubintervalWidth P i)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Quot.liftOn (Multiset.map (fun i => instHMul.hMul ((fun x => ite (Real.instLT.lt x (1 / 2)) 0 1) (P.points i.castSucc)) (LRA.Analysis.Integration.SubintervalWidth P i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) L)) ε))

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
