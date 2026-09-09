
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.ChainRule
import LRA.Analysis.Differentiation.GraphReading
import LRA.Analysis.Differentiation.AlgebraOfDerivatives

namespace LRA.Analysis.Differentiation

/--
`TaylorPoly` TODO

Predicate logic:

  noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
    fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k

Predicate logic (unfolded):

  noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
    fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k
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
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k

/--
`TaylorRemainder` TODO

Predicate logic:

  noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
    fun x => f x - TaylorPoly fD n a x

Predicate logic (unfolded):

  noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
    fun x => f x - TaylorPoly fD n a x (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x
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
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x

/--
`MaclaurinPoly` TODO

Predicate logic:

  noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
    TaylorPoly fD n 0

Predicate logic (unfolded):

  noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
    TaylorPoly fD n 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0
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
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0

/--
`TaylorTheoremLagrangeRemainder` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (a b : Real), Real.instLT.lt a b → ∀ (n : Nat), ((∀ (k : Nat), instLENat.le k n → LRA.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b)) ∧ (∀ (x : Real), x ∈ Set.Ioo a b → LRA.Analysis.Differentiation.HigherDerivativeAt f fD (Set.Ioo a b) (instHAdd.hAdd n 1) x)) → ∀ (x : Real), x ∈ Set.Ioo a b → Exists fun c => ((Real.instLT.lt a c ∧ Real.instLT.lt c x) ∧ (Exists fun Dnp1 => (LRA.Analysis.Differentiation.Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧ f x = instHAdd.hAdd (LRA.Analysis.Differentiation.TaylorPoly fD n a x) (instHMul.hMul (instHDiv.hDiv Dnp1 (instHAdd.hAdd n 1).factorial.cast) (instHPow.hPow (instHSub.hSub x a) (instHAdd.hAdd n 1))))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    fD : ℕ → ℝ → ℝ
    a b : ℝ
    n : ℕ
  Prove
    Real.instLT.lt a b → ∀ (n : Nat), ((∀ (k : Nat), instLENat.le k n → ∀ (x : Real), x ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ fun x => (Real.instPreorder.1.le a x ∧ Real.instPreorder.1.le x b) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))) ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → (fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd x h ∈ fun x => (Real.instPreorder.lt a x ∧ Real.instPreorder.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) x))) ε)))))) → ∀ (x : Real), x ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Exists fun c => ((Real.instLT.lt a c ∧ Real.instLT.lt c x) ∧ (Exists fun Dnp1 => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ fun x => (Real.instPreorder.2.lt a x ∧ Real.instPreorder.2.lt x b) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD n ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (fD n c)) h) Dnp1)) ε))) ∧ f x = { hAdd := fun a b => Real.instAdd.add a b }.hAdd (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn (Finset.range (instHAdd.hAdd n 1)).val (fun l => Multiset.ofList (List.map (fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) l)) ⋯)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv Dnp1 (Real.instNatCast.1 ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1).factorial)) (instHPow.1 ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a) ({ hAdd := fun a b => instAddNat.add a b }.hAdd n 1))))))

Logical form (Lean):

```lean
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hchain : ∀ x ∈ Set.Ioo a b, HigherDerivativeAt f fD (Set.Ioo a b) (n + 1) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hchain : ∀ x ∈ Set.Ioo a b, HigherDerivativeAt f fD (Set.Ioo a b) (n + 1) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1) := by
  sorry
/--
`TaylorExpansionPeanoRemainder` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Set Real) (a : Real) (n : Nat), (a ∈ interior I ∧ (LRA.Analysis.Differentiation.HigherDerivativeAt f fD I n a ∧ LRA.Analysis.Continuity.ContinuousAtPoint (fD n) I a)) → Filter.Tendsto (fun x => instHDiv.hDiv (instHSub.hSub (f x) (LRA.Analysis.Differentiation.TaylorPoly fD n a x)) (instHPow.hPow (instHSub.hSub x a) n)) (nhdsWithin a (I \ Set.instSingletonSet.singleton a)) (nhds 0)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    fD : ℕ → ℝ → ℝ
    I : Set ℝ
    a : ℝ
    n : ℕ
    hD : HigherDerivativeAt f fD I n a
    hcont : LRA.Analysis.Continuity.ContinuousAtPoint (fD n) I a
  Prove
    ((a ∈ Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ { le := Set.Subset }.le t I)) ∧ ((fD 0 = f ∧ (∀ (k : Nat), instLTNat.lt k n → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd a h ∈ I → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a h)) (fD k a)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k 1) a))) ε)))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ I → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD n x) (fD n a))) ε))))) → Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .1 ∈ nhdsWithin a (I \ Set.instSingletonSet.singleton a) (setOf fun x_1 => (fun x => instHDiv.hDiv (instHSub.hSub (f x) (LRA.Analysis.Differentiation.TaylorPoly fD n a x)) (instHPow.hPow (instHSub.hSub x a) n)) x_1 ∈ x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a (I \ {a})) (nhds 0)
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
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a (I \ {a})) (nhds 0) := by
  sorry
/--
`FirstOrderPeanoRemainder` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c D : Real), LRA.Analysis.Differentiation.Derivative D f A c → Filter.Tendsto (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (instHMul.hMul D h)) h) (nhdsWithin 0 (setOf fun h => (instHAdd.hAdd c h ∈ A ∧ Ne h 0))) (nhds 0)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c D : ℝ
    hf : Derivative D f A c
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D)) ε))) → Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .1 ∈ nhdsWithin 0 (setOf fun h => (instHAdd.hAdd c h ∈ A ∧ Ne h 0)) (setOf fun x_1 => (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (instHMul.hMul D h)) h) x_1 ∈ x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h)
      (nhdsWithin 0 {h : ℝ | c + h ∈ A ∧ h ≠ 0}) (nhds 0)
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
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h)
      (nhdsWithin 0 {h : ℝ | c + h ∈ A ∧ h ≠ 0}) (nhds 0) := by
  sorry
/--
`FlatFunction` TODO

Predicate logic:

  noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)

Predicate logic (unfolded):

  noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)
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
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)

/--
`FlatFunctionProperties` TODO

Predicate logic:

  ∀ (fD : Nat → Real → Real), fD 0 = LRA.Analysis.Differentiation.FlatFunction → (LRA.Analysis.Differentiation.IsClassCInfty LRA.Analysis.Differentiation.FlatFunction fD Set.univ ∧ ((∀ (n : Nat), fD n 0 = 0) ∧ ¬ LRA.Analysis.Differentiation.IsClassCOmega LRA.Analysis.Differentiation.FlatFunction fD Set.univ))

Predicate logic (unfolded):

  Ambient
    (ℕ, ℝ)
  Objects
    fD : ℕ → ℝ → ℝ
  Prove
    fD 0 = LRA.Analysis.Differentiation.FlatFunction → ((∀ (k : Nat), ((∀ (x : Real), x ∈ fun _a => True → (fD 0 = LRA.Analysis.Differentiation.FlatFunction ∧ (∀ (k_1 : Nat), instLTNat.lt k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), instHAdd.hAdd x h ∈ Set.univ → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k_1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x h)) (fD k_1 x)) h) (fD ({ hAdd := fun a b => instAddNat.add a b }.hAdd k_1 1) x))) ε))))) ∧ (∀ (x : Real), x ∈ fun _a => True → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x_1 : Real), x_1 ∈ setOf fun _a => True → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x_1 x)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (fD k x_1) (fD k x))) ε))))) ∧ ((∀ (n : Nat), fD n 0 = 0) ∧ ((∀ (a : Real), a ∈ fun _a => True → Exists fun r => (Real.instLT.lt 0 r ∧ (∀ (x : Real), x ∈ fun x => (Real.instPreorder.lt (instHSub.hSub a r) x ∧ Real.instPreorder.lt x (instHAdd.hAdd a r)) ∩ fun_a => True → Filter.instPartialOrder.toPreorder.1.le { sets := fun x_1 => Set.preimage (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_1 ∈ Filter.atTop.sets, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Decidable.rec (fun h => (fun x_1 => Real.exp (instHDiv.hDiv (-1) (instHPow.hPow x 2))) h) (fun h => (fun x => 0) h) (x.decidable0)))))) = → False)))

Logical form (Lean):

```lean
theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ
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
theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ := by
  sorry
/--
`DifferentiableByDifferential` TODO

Predicate logic:

  ∀ (f : Real → Real) (c : Real), Exists fun L => Filter.Tendsto (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))) (nhds 0)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .1 ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (setOf fun x_1 => (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x_1 ∈ x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)
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
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)

/--
`DifferentialAndDerivativeAgree` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), c ∈ interior A → LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ LRA.Analysis.Differentiation.DifferentiableByDifferential f c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    c ∈ interior A → LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ LRA.Analysis.Differentiation.DifferentiableByDifferential f c

Logical form (Lean):

```lean
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c := by
  sorry
/--
`UniquenessOfTheDifferential` TODO

Predicate logic:

  ∀ (f : Real → Real) (c : Real) (L₁ L₂ : LinearMap (RingHom.id Real) Real Real), (Filter.Tendsto (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₁ h)) h) (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))) (nhds 0) ∧ Filter.Tendsto (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₂ h)) h) (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))) (nhds 0)) → L₁ = L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    c : ℝ
    h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)
    h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)
  Prove
    (Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .1 ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (setOf fun x_1 => (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₁ h)) h) x_1 ∈ x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0) ∧ Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .1 ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (setOf fun x_1 => (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₂ h)) h) x_1 ∈ x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)) → L₁ = L₂

Logical form (Lean):

```lean
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂
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
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂ := by
  sorry
/--
`DifferentialContinuityCriterion` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.DifferentiableByDifferential f c → LRA.Analysis.Continuity.ContinuousAtPoint f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
    h : DifferentiableByDifferential f c
  Prove
    (Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))

Logical form (Lean):

```lean
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c
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
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry
/--
`ChainRuleForDifferentials` TODO

Predicate logic:

  ∀ (f g : Real → Real) (c : Real), (LRA.Analysis.Differentiation.DifferentiableByDifferential f c ∧ LRA.Analysis.Differentiation.DifferentiableByDifferential g (f c)) → LRA.Analysis.Differentiation.DifferentiableByDifferential (fun x => g (f x)) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    c : ℝ
    hf : DifferentiableByDifferential f c
    hg : DifferentiableByDifferential g (f c)
  Prove
    (Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0) ∧ Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (g (instHAdd.hAdd (f c) h)) (g (f c))) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)) → Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub ((fun x => g (f x)) (instHAdd.hAdd c h)) ((fun x => g (f x)) c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c
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
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c := by
  sorry
/--
`LinearityOfTheDifferential` TODO

Predicate logic:

  ∀ (f g : Real → Real) (c α β : Real), (LRA.Analysis.Differentiation.DifferentiableByDifferential f c ∧ LRA.Analysis.Differentiation.DifferentiableByDifferential g c) → LRA.Analysis.Differentiation.DifferentiableByDifferential (fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    c α β : ℝ
    hf : DifferentiableByDifferential f c
    hg : DifferentiableByDifferential g c
  Prove
    (Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0) ∧ Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)) → Exists fun L => Filter.instPartialOrder.toPreorder.1.le { sets := fun x => .sets ∈ nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0)) (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (instHAdd.hAdd c h)) ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds 0)

Logical form (Lean):

```lean
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c
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
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c := by
  sorry
end LRA.Analysis.Differentiation
