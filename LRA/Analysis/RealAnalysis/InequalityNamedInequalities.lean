
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.Real

namespace LRA.Analysis.RealAnalysis

/--
`IneqAmGmTwo` TODO

Predicate logic:

  ∀ (a b : Real), (GE.ge a 0 ∧ GE.ge b 0) → Real.instLE.le (instHMul.hMul a b).sqrt (instHDiv.hDiv (instHAdd.hAdd a b) 2)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    ha : a ≥ 0
    hb : b ≥ 0
  Prove
    (Real.instLE.le 0 a ∧ Real.instLE.le 0 b) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b).sqrt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd a b) 2)

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

  ∀ (n : Nat), instLTNat.lt 0 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), GT.gt (a i) 0) → Real.instLE.le (LRA.Analysis.RealAnalysis.GeometricMean n a) (LRA.Analysis.RealAnalysis.ArithmeticMean n a)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a : Fin n → ℝ
  Prove
    instLTNat.lt 0 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), Real.instLT.lt 0 (a i)) → Real.instLE.le (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯ (Multiset.map a Finset.univ.val)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (Real.instNatCast.1 n))) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map a l)) ⋯)) (Real.instNatCast.1 n))

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

  ∀ (n : Nat), instLTNat.lt 0 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), GT.gt (a i) 0) → (Real.instLE.le (LRA.Analysis.RealAnalysis.HarmonicMean n a) (LRA.Analysis.RealAnalysis.GeometricMean n a) ∧ Real.instLE.le (LRA.Analysis.RealAnalysis.GeometricMean n a) (LRA.Analysis.RealAnalysis.ArithmeticMean n a))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a : Fin n → ℝ
  Prove
    instLTNat.lt 0 n → ∀ (a : Fin n → Real), (∀ (i : Fin n), Real.instLT.lt 0 (a i)) → (Real.instLE.le ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Real.instNatCast.1 n) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHDiv.hDiv 1 (a i)) l)) ⋯))) (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯ (Multiset.map a Finset.univ.val)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (Real.instNatCast.1 n))) ∧ Real.instLE.le (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => instHMul.hMul x1 x2) 1 l) ⋯ (Multiset.map a Finset.univ.val)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (Real.instNatCast.1 n))) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map a l)) ⋯)) (Real.instNatCast.1 n)))

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

  ∀ (n : Nat) (a b : Fin n → Real), Real.instLE.le (abs (Finset.univ.sum fun j => instHMul.hMul (a j) (b j))) (instHMul.hMul (Finset.univ.sum fun j => instHPow.hPow (a j) 2).sqrt (Finset.univ.sum fun j => instHPow.hPow (b j) 2).sqrt)

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a b : Fin n → ℝ
  Prove
    Real.instLE.le (abs (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j)) l)) ⋯ Finset.univ.val))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (a j) 2) l)) ⋯ Finset.univ.val)).sqrt (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (b j) 2) l)) ⋯ Finset.univ.val)).sqrt)

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

  ∀ (n : Nat), instLTNat.lt 0 n → ∀ (a b : Fin n → Real), (Monotone a ∧ Monotone b) → Real.instLE.le (instHMul.hMul (LRA.Analysis.RealAnalysis.ArithmeticMean n a) (LRA.Analysis.RealAnalysis.ArithmeticMean n b)) (LRA.Analysis.RealAnalysis.ArithmeticMean n fun j => instHMul.hMul (a j) (b j))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a b : Fin n → ℝ
    ha : Monotone a
    hb : Monotone b
  Prove
    instLTNat.lt 0 n → ∀ (a b : Fin n → Real), ((∀ ⦃a_1 b : Fin n⦄, Fin.instPartialOrder.toPreorder.1.le a_1 b → Real.instPreorder.1.le (a a_1) (a b)) ∧ (∀ ⦃a b_1 : Fin n⦄, Fin.instPartialOrder.toPreorder.1.le a b_1 → Real.instPreorder.1.le (b a) (b b_1))) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map a l)) ⋯)) (Real.instNatCast.1 n)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map b l)) ⋯)) (Real.instNatCast.1 n))) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j)) l)) ⋯)) (Real.instNatCast.1 n))

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

  ∀ (n : Nat) (a b : Fin n → Real), (Monotone a ∧ Monotone b) → ∀ (σ : Equiv.Perm (Fin n)), (Real.instLE.le (Finset.univ.sum fun j => instHMul.hMul (a j) (b j.rev)) (Finset.univ.sum fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) ∧ Real.instLE.le (Finset.univ.sum fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) (Finset.univ.sum fun j => instHMul.hMul (a j) (b j)))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a b : Fin n → ℝ
    ha : Monotone a
    hb : Monotone b
    σ : Equiv.Perm (Fin n)
  Prove
    ((∀ ⦃a_1 b : Fin n⦄, Fin.instPartialOrder.toPreorder.1.le a_1 b → Real.instPreorder.1.le (a a_1) (a b)) ∧ (∀ ⦃a b_1 : Fin n⦄, Fin.instPartialOrder.toPreorder.1.le a b_1 → Real.instPreorder.1.le (b a) (b b_1))) → ∀ (σ : Equiv (Fin n) (Fin n)), (Real.instLE.le (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j.rev)) l)) ⋯ Finset.univ.val)) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) l)) ⋯ Finset.univ.val)) ∧ Real.instLE.le (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b (EquivLike.toFunLike.coe σ j))) l)) ⋯ Finset.univ.val)) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => instHMul.hMul (a j) (b j)) l)) ⋯ Finset.univ.val)))

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

  ∀ (n : Nat) (p q : Real), (GT.gt p 1 ∧ (GT.gt q 1 ∧ instHAdd.hAdd (instHDiv.hDiv 1 p) (instHDiv.hDiv 1 q) = 1)) → ∀ (a b : Fin n → Real), Real.instLE.le (Finset.univ.sum fun j => abs (instHMul.hMul (a j) (b j))) (instHMul.hMul (instHPow.hPow (Finset.univ.sum fun j => instHPow.hPow (abs (a j)) p) (instHDiv.hDiv 1 p)) (instHPow.hPow (Finset.univ.sum fun j => instHPow.hPow (abs (b j)) q) (instHDiv.hDiv 1 q)))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    p q : ℝ
    hp : p > 1
    hq : q > 1
    a b : Fin n → ℝ
  Prove
    (Real.instLT.lt 1 p ∧ (Real.instLT.lt 1 q ∧ { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 q) = 1)) → ∀ (a b : Fin n → Real), Real.instLE.le (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun j => abs (instHMul.hMul (a j) (b j))) l)) ⋯ Finset.univ.val)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (abs (a j)) p) l)) ⋯)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p)) (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (abs (b j)) q) l)) ⋯)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 q)))

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

  ∀ (n : Nat) (p : Real), GE.ge p 1 → ∀ (a b : Fin n → Real), Real.instLE.le (instHPow.hPow (Finset.univ.sum fun j => instHPow.hPow (abs (instHAdd.hAdd (a j) (b j))) p) (instHDiv.hDiv 1 p)) (instHAdd.hAdd (instHPow.hPow (Finset.univ.sum fun j => instHPow.hPow (abs (a j)) p) (instHDiv.hDiv 1 p)) (instHPow.hPow (Finset.univ.sum fun j => instHPow.hPow (abs (b j)) p) (instHDiv.hDiv 1 p)))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    p : ℝ
    hp : p ≥ 1
    a b : Fin n → ℝ
  Prove
    Real.instLE.le 1 p → ∀ (a b : Fin n → Real), Real.instLE.le (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (abs (instHAdd.hAdd (a j) (b j))) p) l)) ⋯)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p)) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (abs (a j)) p) l)) ⋯)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p)) (instHPow.1 (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun j => instHPow.hPow (abs (b j)) p) l)) ⋯)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p)))

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

  ∀ (x : Real) (n : Nat), GE.ge x (-1) → GE.ge (instHPow.hPow (instHAdd.hAdd 1 x) n) (instHAdd.hAdd 1 (instHMul.hMul n.cast x))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x : ℝ
    n : ℕ
    hx : x ≥ -1
  Prove
    Real.instLE.le (-1) x → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd 1 ({ hMul := fun a b => Real.instMul.mul a b }.hMul (Real.instNatCast.1 n) x)) (instHPow.1 ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd 1 x) n)

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
