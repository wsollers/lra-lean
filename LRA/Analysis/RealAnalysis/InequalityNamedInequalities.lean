
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.Real

namespace LRA.Analysis.RealAnalysis

/--
`IneqAmGmTwo` TODO

Predicate logic:

  Real.sqrt (a * b) ≤ (a + b) / 2

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLE.1 Zero.toOfNat0.1 b) → Real.instLE.1 (instHMul.1 a b).sqrt (instHDiv.1 (instHAdd.1 a b) instOfNatAtLeastTwo.1)

Logical form (Lean):

```lean
theorem IneqAmGmTwo (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) ≤ (a + b) / 2
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
theorem IneqAmGmTwo (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) ≤ (a + b) / 2 := by
  sorry

/--
`ArithmeticMean` TODO

Predicate logic:

  noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n

Predicate logic (unfolded):

  noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n
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
noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n

/--
`GeometricMean` TODO

Predicate logic:

  noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n)

Predicate logic (unfolded):

  noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n)
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
noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n)

/--
`HarmonicMean` TODO

Predicate logic:

  noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i)

Predicate logic (unfolded):

  noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i)
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
noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i)

/--
`IneqAmGm` TODO

Predicate logic:

  (0 < n ∧ Fin n → ℝ ∧ ∀ i, a i > 0) → GeometricMean n a ≤ ArithmeticMean n a

Predicate logic (unfolded):

  ∀ (n : Nat), instLTNat.1 (instOfNatNat 0).1 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), Real.instLT.1 Zero.toOfNat0.1 (a i)) → Real.instLE.1 (instHPow.1 (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯) (instHDiv.1 One.toOfNat1.1 (Real.instNatCast.1 n))) (instHDiv.1 (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (Real.instNatCast.1 n))

Logical form (Lean):

```lean
theorem IneqAmGm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    GeometricMean n a ≤ ArithmeticMean n a
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
theorem IneqAmGm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    GeometricMean n a ≤ ArithmeticMean n a := by
  sorry

/--
`IneqAmGmHm` TODO

Predicate logic:

  (0 < n ∧ Fin n → ℝ ∧ ∀ i, a i > 0) → HarmonicMean n a ≤ GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a

Predicate logic (unfolded):

  ∀ (n : Nat), instLTNat.1 (instOfNatNat 0).1 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), Real.instLT.1 Zero.toOfNat0.1 (a i)) → (Real.instLE.1 (instHDiv.1 (Real.instNatCast.1 n) (Quot.liftOn (Multiset.map (fun i => instHDiv.hDiv 1 (a i)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯)) (instHPow.1 (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯) (instHDiv.1 One.toOfNat1.1 (Real.instNatCast.1 n))) ∧ Real.instLE.1 (instHPow.1 (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯) (instHDiv.1 One.toOfNat1.1 (Real.instNatCast.1 n))) (instHDiv.1 (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (Real.instNatCast.1 n)))

Logical form (Lean):

```lean
theorem IneqAmGmHm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    HarmonicMean n a ≤ GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a
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
theorem IneqAmGmHm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    HarmonicMean n a ≤ GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a := by
  sorry

/--
`IneqCauchySchwarz` TODO

Predicate logic:

  |Finset.univ.sum (fun j => a j * b j)| ≤ Real.sqrt (Finset.univ.sum (fun j => a j ^ 2)) * Real.sqrt (Finset.univ.sum (fun j => b j ^ 2))

Predicate logic (unfolded):

  ∀ (n : Nat) (a b : Fin n → Real), Real.instLE.1 (SemilatticeSup.toMax.1 (Quot.liftOn (Multiset.map (fun j => instHMul.hMul (a j) (b j)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map (fun j => instHMul.hMul (a j) (b j)) Finset.univ.val)))) (instHMul.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun j => instHPow.hPow (a j) 2) Finset.univ.val)).sqrt (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun j => instHPow.hPow (b j) 2) Finset.univ.val)).sqrt)

Logical form (Lean):

```lean
theorem IneqCauchySchwarz (n : ℕ) (a b : Fin n → ℝ) :
    |Finset.univ.sum (fun j => a j * b j)| ≤
      Real.sqrt (Finset.univ.sum (fun j => a j ^ 2)) *
        Real.sqrt (Finset.univ.sum (fun j => b j ^ 2))
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
theorem IneqCauchySchwarz (n : ℕ) (a b : Fin n → ℝ) :
    |Finset.univ.sum (fun j => a j * b j)| ≤
      Real.sqrt (Finset.univ.sum (fun j => a j ^ 2)) *
        Real.sqrt (Finset.univ.sum (fun j => b j ^ 2)) := by
  sorry

/--
`IneqChebyshevSum` TODO

Predicate logic:

  (0 < n) → (ArithmeticMean n a) * (ArithmeticMean n b) ≤ ArithmeticMean n (fun j => a j * b j)

Predicate logic (unfolded):

  ∀ (n : Nat), instLTNat.1 (instOfNatNat 0).1 n → ∀ (a b : Fin n → Real), (∀ ⦃a_1 b : Fin n⦄, Fin.instPartialOrder.toLE.1 a_1 b → Real.instPreorder.toLE.1 (a a_1) (a b) ∧ ∀ ⦃a b_1 : Fin n⦄, Fin.instPartialOrder.toLE.1 a b_1 → Real.instPreorder.toLE.1 (b a) (b b_1)) → Real.instLE.1 (instHMul.1 (instHDiv.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map a Finset.univ.val)) (Real.instNatCast.1 n)) (instHDiv.1 (Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map b Finset.univ.val)) (Real.instNatCast.1 n))) (instHDiv.1 (Quot.liftOn (Multiset.map (fun j => instHMul.hMul (a j) (b j)) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (Real.instNatCast.1 n))

Logical form (Lean):

```lean
theorem IneqChebyshevSum (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ)
    (ha : Monotone a) (hb : Monotone b) :
    (ArithmeticMean n a) * (ArithmeticMean n b) ≤
      ArithmeticMean n (fun j => a j * b j)
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
theorem IneqChebyshevSum (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ)
    (ha : Monotone a) (hb : Monotone b) :
    (ArithmeticMean n a) * (ArithmeticMean n b) ≤
      ArithmeticMean n (fun j => a j * b j) := by
  sorry

/--
`IneqRearrangement` TODO

Predicate logic:

  Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤ Finset.univ.sum (fun j => a j * b (σ j)) ∧ Finset.univ.sum (fun j => a j * b (σ j)) ≤ Finset.univ.sum (fun j => a j * b j)

Predicate logic (unfolded):

  ∀ (n : Nat) (a b : Fin n → Real), (∀ ⦃a_1 b : Fin n⦄, Fin.instPartialOrder.toLE.1 a_1 b → Real.instPreorder.toLE.1 (a a_1) (a b) ∧ ∀ ⦃a b_1 : Fin n⦄, Fin.instPartialOrder.toLE.1 a b_1 → Real.instPreorder.toLE.1 (b a) (b b_1)) → ∀ (σ : Equiv (Fin n) (Fin n)), (Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j.rev)) l)) ⋯)) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) l)) ⋯)) ∧ Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) l)) ⋯)) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j)) l)) ⋯)))

Logical form (Lean):

```lean
theorem IneqRearrangement (n : ℕ) (a b : Fin n → ℝ) (ha : Monotone a) (hb : Monotone b)
    (σ : Equiv.Perm (Fin n)) :
    Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤
      Finset.univ.sum (fun j => a j * b (σ j)) ∧
    Finset.univ.sum (fun j => a j * b (σ j)) ≤
      Finset.univ.sum (fun j => a j * b j)
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
theorem IneqRearrangement (n : ℕ) (a b : Fin n → ℝ) (ha : Monotone a) (hb : Monotone b)
    (σ : Equiv.Perm (Fin n)) :
    Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤
      Finset.univ.sum (fun j => a j * b (σ j)) ∧
    Finset.univ.sum (fun j => a j * b (σ j)) ≤
      Finset.univ.sum (fun j => a j * b j) := by
  sorry

/--
`IneqHolder` TODO

Predicate logic:

  (1 / p + 1 / q = 1) → Finset.univ.sum (fun j => |a j * b j|) ≤ (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) * (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q)

Predicate logic (unfolded):

  ∀ (n : Nat) (p q : Real), (Real.instLT.1 One.toOfNat1.1 p ∧ (Real.instLT.1 One.toOfNat1.1 q ∧ instHAdd.1 (instHDiv.1 One.toOfNat1.1 p) (instHDiv.1 One.toOfNat1.1 q) = One.toOfNat1.1)) → ∀ (a b : Fin n → Real), Real.instLE.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => abs (instHMul.hMul (a j) (b j))) l)) ⋯)) (instHMul.1 (instHPow.1 (Quot.liftOn (Multiset.map (fun j => instHPow.hPow (abs (a j)) p) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (instHDiv.1 One.toOfNat1.1 p)) (instHPow.1 (Quot.liftOn (Multiset.map (fun j => instHPow.hPow (abs (b j)) q) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (instHDiv.1 One.toOfNat1.1 q)))

Logical form (Lean):

```lean
theorem IneqHolder (n : ℕ) (p q : ℝ) (hp : p > 1) (hq : q > 1)
    (hpq : 1 / p + 1 / q = 1) (a b : Fin n → ℝ) :
    Finset.univ.sum (fun j => |a j * b j|) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) *
        (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q)
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
theorem IneqHolder (n : ℕ) (p q : ℝ) (hp : p > 1) (hq : q > 1)
    (hpq : 1 / p + 1 / q = 1) (a b : Fin n → ℝ) :
    Finset.univ.sum (fun j => |a j * b j|) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) *
        (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q) := by
  sorry

/--
`IneqMinkowski` TODO

Predicate logic:

  (Finset.univ.sum (fun j => |a j + b j| ^ p)) ^ (1 / p) ≤ (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) + (Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p)

Predicate logic (unfolded):

  ∀ (n : Nat) (p : Real), Real.instLE.1 One.toOfNat1.1 p → ∀ (a b : Fin n → Real), Real.instLE.1 (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯ (Multiset.map (fun j => instHPow.hPow (abs (instHAdd.hAdd (a j) (b j))) p) Finset.univ.val)) (instHDiv.1 One.toOfNat1.1 p)) (instHAdd.1 (instHPow.1 (Quot.liftOn (Multiset.map (fun j => instHPow.hPow (abs (a j)) p) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (instHDiv.1 One.toOfNat1.1 p)) (instHPow.1 (Quot.liftOn (Multiset.map (fun j => instHPow.hPow (abs (b j)) p) Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) (instHDiv.1 One.toOfNat1.1 p)))

Logical form (Lean):

```lean
theorem IneqMinkowski (n : ℕ) (p : ℝ) (hp : p ≥ 1) (a b : Fin n → ℝ) :
    (Finset.univ.sum (fun j => |a j + b j| ^ p)) ^ (1 / p) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) +
        (Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p)
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
theorem IneqMinkowski (n : ℕ) (p : ℝ) (hp : p ≥ 1) (a b : Fin n → ℝ) :
    (Finset.univ.sum (fun j => |a j + b j| ^ p)) ^ (1 / p) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) +
        (Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p) := by
  sorry

/--
`IneqBernoulli` TODO

Predicate logic:

  (1 + x) ^ n ≥ 1 + n * x

Predicate logic (unfolded):

  ∀ (x : Real) (n : Nat), Real.instLE.1 (Real.instNeg.1 One.toOfNat1.1) x → Real.instLE.1 (instHAdd.1 One.toOfNat1.1 (instHMul.1 (Real.instNatCast.1 n) x)) (instHPow.1 (instHAdd.1 One.toOfNat1.1 x) n)

Logical form (Lean):

```lean
theorem IneqBernoulli (x : ℝ) (n : ℕ) (hx : x ≥ -1) :
    (1 + x) ^ n ≥ 1 + n * x
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
theorem IneqBernoulli (x : ℝ) (n : ℕ) (hx : x ≥ -1) :
    (1 + x) ^ n ≥ 1 + n * x := by
  sorry

end LRA.Analysis.RealAnalysis
