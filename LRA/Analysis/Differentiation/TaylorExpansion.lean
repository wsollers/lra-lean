
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

  (ℝ → ℝ ∧ ℕ → ℝ → ℝ ∧ a < b ∧ ∀ k ≤ n, LRA.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b) ∧ ∀ x ∈ Set.Ioo a b, HigherDerivativeAt f fD (Set.Ioo a b) (n + 1) x) → ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1, Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧ f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (a b : Real), Real.instLT.1 a b → ∀ (n : Nat), (∀ (k : Nat), instLENat.1 k n → ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 a x ∧ Real.instPreorder.toLE.1 x b)) x_1 → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (fD k x_1) (fD k x)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → (fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k (instHAdd.1 n (instOfNatNat 1).1) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.lt a x ∧ Real.instPreorder.lt x b)) (instHAdd.1 x h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd x h)) (fD k x)) h) (fD (instHAdd.hAdd k 1) x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd x h)) (fD k x)) h) (fD (instHAdd.hAdd k 1) x)))) ε))) → ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) x → Exists fun c => ((Real.instLT.1 a c ∧ Real.instLT.1 c x) ∧ Exists fun Dnp1 => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLT.1 a x ∧ Real.instPreorder.toLT.1 x b)) (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD n (instHAdd.hAdd c h)) (fD n c)) h) Dnp1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD n (instHAdd.hAdd c h)) (fD n c)) h) Dnp1))) ε) ∧ f x = instHAdd.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) (Finset.range (instHAdd.hAdd n 1)).val)) (instHMul.1 (instHDiv.1 Dnp1 (Real.instNatCast.1 (instHAdd.1 n 1).factorial)) (instHPow.1 (instHSub.1 x a) (instHAdd.1 n (instOfNatNat 1).1)))))

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

  (ℝ → ℝ ∧ ℕ → ℝ → ℝ ∧ a ∈ interior I) → Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n) (nhdsWithin a (I \ {a})) (nhds 0)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (I : Real → Prop) (a : Real) (n : Nat), (Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t I)) a ∧ ((fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 I (instHAdd.1 a h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd a h)) (fD k a)) h) (fD (instHAdd.hAdd k 1) a)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd a h)) (fD k a)) h) (fD (instHAdd.hAdd k 1) a)))) ε)) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 I x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (fD n x) (fD n a)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (fD n x) (fD n a)))) ε))) → Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin a (Set.instSDiff.sdiff I (Set.instSingletonSet.singleton a))).sets (Set.preimage (fun x => instHDiv.hDiv (instHSub.hSub (f x) (LRA.Analysis.Differentiation.TaylorPoly fD n a x)) (instHPow.hPow (instHSub.hSub x a) n)) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  (ℝ → ℝ) → Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h) nhdsWithin 0 {h ∈ ℝ | c + h ∈ A ∧ h ≠ 0} (nhds 0)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)) → Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin 0 (setOf fun h => (Set.instMembership.mem A (instHAdd.hAdd c h) ∧ Ne h 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (instHMul.hMul D h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  (ℕ → ℝ → ℝ ∧ fD 0 = FlatFunction) → IsClassCInfty FlatFunction fD Set.univ ∧ ∀ n ∈ ℕ, fD n 0 = 0 ∧ ¬ IsClassCOmega FlatFunction fD Set.univ

Predicate logic (unfolded):

  ∀ (fD : Nat → Real → Real), fD (instOfNatNat 0).1 = LRA.Analysis.Differentiation.FlatFunction → (∀ (k : Nat), (∀ (x : Real), Set.instMembership.1 (fun _a => True) x → (fD (instOfNatNat 0).1 = LRA.Analysis.Differentiation.FlatFunction ∧ ∀ (k_1 : Nat), instLTNat.1 k_1 k → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ ∀ (h : Real), Set.instMembership.1 Set.univ (instHAdd.hAdd x h) → Real.instLT.1 0 (abs h) → Real.instLT.1 (abs h) δ → Real.instLT.1 (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k_1 (instHAdd.hAdd x h)) (fD k_1 x)) h) (fD (instHAdd.hAdd k_1 1) x))) ε)) ∧ ∀ (x : Real), Set.instMembership.1 (fun _a => True) x → ∀ (ε : Real), Real.instLT.1 0 ε → Exists fun δ => (Real.instLT.1 0 δ ∧ ∀ (x_1 : Real), Set.instMembership.1 (setOf fun _a => True) x_1 → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub x_1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x_1 x))) δ → Real.instLT.1 (SemilatticeSup.toMax.max (instHSub.hSub (fD k x_1) (fD k x)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (fD k x_1) (fD k x)))) ε)) ∧ (∀ (n : Nat), fD n Zero.toOfNat0.1 = Zero.toOfNat0.1 ∧ (∀ (a : Real), Set.instMembership.1 (fun _a => True) a → Exists fun r => (Real.instLT.1 Zero.toOfNat0.1 r ∧ ∀ (x : Real), Set.instMembership.1 (Set.instInter.1 (fun x => (Real.instPreorder.lt (instHSub.hSub a r) x ∧ Real.instPreorder.lt x (instHAdd.hAdd a r))) fun _a => True) x → Filter.instPartialOrder.toLE.1 { sets := setOf fun x_1 => Set.instMembership.mem Filter.atTop.sets (Set.preimage (fun n => (Finset.range (instHAdd.hAdd n 1)).sum fun k => instHMul.hMul (instHDiv.hDiv (fD k a) k.factorial.cast) (instHPow.hPow (instHSub.hSub x a) k)) x_1), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds (Decidable.casesOn (x.decidable0) = fun x_1 => Real.exp (instHDiv.hDiv (-1) (instHPow.hPow x 2)) fun x => 0)))) → False))

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

  ∀ (f : Real → Real) (c : Real), Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  (ℝ → ℝ ∧ c ∈ interior A) → IsDifferentiable f A c ↔ DifferentiableByDifferential f c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Set.instMembership.1 (Set.instSupSet.1 fun t => (Real.pseudoMetricSpace.toUniformSpace.IsOpen t ∧ Set.instLE.1 t A)) c → Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  (ℝ → ℝ) → L₁ = L₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (c : Real) (L₁ L₂ : LinearMap { toFun := fun x => x, map_one' := ⋯, map_mul' := ⋯, map_zero' := ⋯, map_add' := ⋯ } Real Real), (Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₁ h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1) ∧ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L₂ h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)) → L₁ = L₂

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

  (ℝ → ℝ) → LRA.Analysis.Continuity.ContinuousAtPoint f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε)

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

  DifferentiableByDifferential (fun x => g (f x)) c

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (c : Real), (Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (g (instHAdd.hAdd (f c) h)) (g (f c))) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)) → Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub ((fun x => g (f x)) (instHAdd.hAdd c h)) ((fun x => g (f x)) c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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

  DifferentiableByDifferential (fun x => α * f x + β * g x) c

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (c α β : Real), (Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1) ∧ Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub (g (instHAdd.hAdd c h)) (g c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)) → Exists fun L => Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.mem (nhdsWithin 0 (Set.instCompl.compl (Set.instSingletonSet.singleton 0))).sets (Set.preimage (fun h => instHDiv.hDiv (instHSub.hSub (instHSub.hSub ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) (instHAdd.hAdd c h)) ((fun x => instHAdd.hAdd (instHMul.hMul α (f x)) (instHMul.hMul β (g x))) c)) (LinearMap.instFunLike.coe L h)) h) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

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
