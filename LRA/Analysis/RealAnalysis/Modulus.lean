
import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.Analysis.RealAnalysis

/--
`AbsR` TODO

Predicate logic:

  noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a

Predicate logic (unfolded):

  noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a

/--
`AbsoluteValueNonneg` TODO

Predicate logic:

  ∀ (a : Real), GE.ge (LRA.Analysis.RealAnalysis.AbsR a) 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Real.instLE.le 0 (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a))

Logical form (Lean):

```lean
theorem AbsoluteValueNonneg (a : ℝ) : AbsR a ≥ 0
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
theorem AbsoluteValueNonneg (a : ℝ) : AbsR a ≥ 0 := by
  sorry
/--
`AbsoluteValueZeroIffZero` TODO

Predicate logic:

  ∀ (a : Real), LRA.Analysis.RealAnalysis.AbsR a = 0 ↔ a = 0

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    LRA.Analysis.RealAnalysis.AbsR a = 0 ↔ a = 0

Logical form (Lean):

```lean
theorem AbsoluteValueZeroIffZero (a : ℝ) : AbsR a = 0 ↔ a = 0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem AbsoluteValueZeroIffZero (a : ℝ) : AbsR a = 0 ↔ a = 0 := by
  sorry
/--
`AbsoluteValueSelfOrNeg` TODO

Predicate logic:

  ∀ (a : Real), Or (LRA.Analysis.RealAnalysis.AbsR a = a)(LRA.Analysis.RealAnalysis.AbsR a = Real.instNeg.neg a)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Or (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a) = a) (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a) = Real.instNeg.neg a)

Logical form (Lean):

```lean
theorem AbsoluteValueSelfOrNeg (a : ℝ) : AbsR a = a ∨ AbsR a = -a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases

-/
theorem AbsoluteValueSelfOrNeg (a : ℝ) : AbsR a = a ∨ AbsR a = -a := by
  sorry
/--
`AbsoluteValueSymmetric` TODO

Predicate logic:

  ∀ (a : Real), LRA.Analysis.RealAnalysis.AbsR (Real.instNeg.neg a) = LRA.Analysis.RealAnalysis.AbsR a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    Decidable.rec (fun h => (fun x => Real.instNeg.neg (Real.instNeg.neg a)) h) (fun h => (fun x => Real.instNeg.neg a) h) (Real.linearOrder.6 0 (Real.instNeg.neg a)) = Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a)

Logical form (Lean):

```lean
theorem AbsoluteValueSymmetric (a : ℝ) : AbsR (-a) = AbsR a
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
theorem AbsoluteValueSymmetric (a : ℝ) : AbsR (-a) = AbsR a := by
  sorry
/--
`AbsoluteValueProduct` TODO

Predicate logic:

  ∀ (a b : Real), LRA.Analysis.RealAnalysis.AbsR (instHMul.hMul a b) = instHMul.hMul (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Decidable.rec (fun h => (fun x => Real.instNeg.neg ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b)) h) (fun h => (fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul a b) h) (Real.linearOrder.6 0 (instHMul.hMul a b)) = { hMul := fun a b => Real.instMul.mul a b }.hMul (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.neg b) h) (fun h => (fun x => b) h) (Real.linearOrder.6 0 b))

Logical form (Lean):

```lean
theorem AbsoluteValueProduct (a b : ℝ) : AbsR (a * b) = AbsR a * AbsR b
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
theorem AbsoluteValueProduct (a b : ℝ) : AbsR (a * b) = AbsR a * AbsR b := by
  sorry
/--
`AbsoluteValueQuotient` TODO

Predicate logic:

  ∀ (a b : Real), Ne b 0 → LRA.Analysis.RealAnalysis.AbsR (instHDiv.hDiv a b) = instHDiv.hDiv (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    hb : b ≠ 0
  Prove
    (b = 0 → False) → Decidable.rec (fun h => (fun x => Real.instNeg.neg ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a b)) h) (fun h => (fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv a b) h) (Real.linearOrder.6 0 (instHDiv.hDiv a b)) = { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.neg b) h) (fun h => (fun x => b) h) (Real.linearOrder.6 0 b))

Logical form (Lean):

```lean
theorem AbsoluteValueQuotient (a b : ℝ) (hb : b ≠ 0) :
    AbsR (a / b) = AbsR a / AbsR b
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
theorem AbsoluteValueQuotient (a b : ℝ) (hb : b ≠ 0) :
    AbsR (a / b) = AbsR a / AbsR b := by
  sorry
/--
`AbsoluteValueBounds` TODO

Predicate logic:

  ∀ (a : Real), (Real.instLE.le (Real.instNeg.neg (LRA.Analysis.RealAnalysis.AbsR a)) a ∧ Real.instLE.le a (LRA.Analysis.RealAnalysis.AbsR a))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a : ℝ
  Prove
    (Real.instLE.le (Real.instNeg.neg (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a))) a ∧ Real.instLE.le a (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a)))

Logical form (Lean):

```lean
theorem AbsoluteValueBounds (a : ℝ) : -AbsR a ≤ a ∧ a ≤ AbsR a
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases

-/
theorem AbsoluteValueBounds (a : ℝ) : -AbsR a ≤ a ∧ a ≤ AbsR a := by
  sorry
/--
`AbsoluteValueLeIff` TODO

Predicate logic:

  ∀ (a r : Real), GE.ge r 0 → Real.instLE.le (LRA.Analysis.RealAnalysis.AbsR a) r ↔ (Real.instLE.le (Real.instNeg.neg r) a ∧ Real.instLE.le a r)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a r : ℝ
    hr : r ≥ 0
  Prove
    GE.ge r 0 → Real.instLE.le (LRA.Analysis.RealAnalysis.AbsR a) r ↔ (Real.instLE.le (Real.instNeg.neg r) a ∧ Real.instLE.le a r)

Logical form (Lean):

```lean
theorem AbsoluteValueLeIff (a r : ℝ) (hr : r ≥ 0) :
    AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r
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
theorem AbsoluteValueLeIff (a r : ℝ) (hr : r ≥ 0) :
    AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r := by
  sorry
/--
`AbsoluteValueLtIff` TODO

Predicate logic:

  ∀ (a r : Real), GT.gt r 0 → Real.instLT.lt (LRA.Analysis.RealAnalysis.AbsR a) r ↔ (Real.instLT.lt (Real.instNeg.neg r) a ∧ Real.instLT.lt a r)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a r : ℝ
    hr : r > 0
  Prove
    GT.gt r 0 → Real.instLT.lt (LRA.Analysis.RealAnalysis.AbsR a) r ↔ (Real.instLT.lt (Real.instNeg.neg r) a ∧ Real.instLT.lt a r)

Logical form (Lean):

```lean
theorem AbsoluteValueLtIff (a r : ℝ) (hr : r > 0) :
    AbsR a < r ↔ -r < a ∧ a < r
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
theorem AbsoluteValueLtIff (a r : ℝ) (hr : r > 0) :
    AbsR a < r ↔ -r < a ∧ a < r := by
  sorry
/--
`ReverseTriangleInequality` TODO

Predicate logic:

  ∀ (a b : Real), Real.instLE.le (LRA.Analysis.RealAnalysis.AbsR (instHSub.hSub (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b))) (LRA.Analysis.RealAnalysis.AbsR (instHSub.hSub a b))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
  Prove
    Real.instLE.le (Decidable.rec (fun h => (fun x => Real.instNeg.neg ({ hSub := fun a b => Real.instSub.sub a b }.hSub (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.decidableLE 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.neg b) h) (fun h => (fun x => b) h) (Real.decidableLE 0 b)))) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (Decidable.rec (fun h => (fun x => Real.instNeg.neg a) h) (fun h => (fun x => a) h) (Real.decidableLE 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.neg b) h) (fun h => (fun x => b) h) (Real.decidableLE 0 b))) h) (Real.linearOrder.6 0 (instHSub.hSub (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b)))) (Decidable.rec (fun h => (fun x => Real.instNeg.neg ({ hSub := fun a b => Real.instSub.sub a b }.hSub a b)) h) (fun h => (fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub a b) h) (Real.linearOrder.6 0 (instHSub.hSub a b)))

Logical form (Lean):

```lean
theorem ReverseTriangleInequality (a b : ℝ) :
    AbsR (AbsR a - AbsR b) ≤ AbsR (a - b)
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
theorem ReverseTriangleInequality (a b : ℝ) :
    AbsR (AbsR a - AbsR b) ≤ AbsR (a - b) := by
  sorry
/--
`AbsoluteValueSumBound` TODO

Predicate logic:

  ∀ (n : Nat) (a : Fin n → Real), Real.instLE.le (LRA.Analysis.RealAnalysis.AbsR (Finset.univ.sum a)) (Finset.univ.sum fun i => LRA.Analysis.RealAnalysis.AbsR (a i))

Predicate logic (unfolded):

  Ambient
    (ℕ)
  Objects
    n : ℕ
    a : Fin n → ℝ
  Prove
    Real.instLE.le (Decidable.rec (fun h => (fun x => Real.instNeg.neg (Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯)) h) (fun h => (fun x => Quot.liftOn (Multiset.map a Finset.univ.val) (fun l => List.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 l) ⋯) h) (Real.linearOrder.6 0 (Finset.univ.sum a))) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => LRA.Analysis.RealAnalysis.AbsR (a i)) l)) ⋯ Finset.univ.val))

Logical form (Lean):

```lean
theorem AbsoluteValueSumBound (n : ℕ) (a : Fin n → ℝ) :
    AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR (a i))
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
theorem AbsoluteValueSumBound (n : ℕ) (a : Fin n → ℝ) :
    AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR (a i)) := by
  sorry
end LRA.Analysis.RealAnalysis
