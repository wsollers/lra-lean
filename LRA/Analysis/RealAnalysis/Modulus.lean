
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

  AbsR a ≥ 0

Predicate logic (unfolded):

  ∀ (a : Real), Real.instLE.1 Zero.toOfNat0.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) inferInstance)

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

  AbsR a = 0 ↔ a = 0

Predicate logic (unfolded):

  ∀ (a : Real), Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a) = Zero.toOfNat0.1 ↔ a = Zero.toOfNat0.1

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

  AbsR a = a ∨ AbsR a = -a

Predicate logic (unfolded):

  ∀ (a : Real), Or (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a) = a) (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a) = Real.instNeg.1 a)

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

  AbsR (-a) = AbsR a

Predicate logic (unfolded):

  ∀ (a : Real), Decidable.rec (fun h => (fun x => Real.instNeg.1 (Real.instNeg.1 a)) h) (fun h => (fun x => Real.instNeg.1 a) h) (Real.linearOrder.6 0 (Real.instNeg.neg a)) = Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.6 0 a)

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

  AbsR (a * b) = AbsR a * AbsR b

Predicate logic (unfolded):

  ∀ (a b : Real), Decidable.rec (fun h => (fun x => Real.instNeg.1 (instHMul.1 a b)) h) (fun h => (fun x => instHMul.1 a b) h) (Real.linearOrder.6 0 (instHMul.hMul a b)) = instHMul.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.1 b) h) (fun h => (fun x => b) h) (Real.linearOrder.toDecidableLE 0 b))

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

  AbsR (a / b) = AbsR a / AbsR b

Predicate logic (unfolded):

  ∀ (a b : Real), (b = Zero.toOfNat0.1 → False) → Decidable.rec (fun h => (fun x => Real.instNeg.1 (instHDiv.1 a b)) h) (fun h => (fun x => instHDiv.1 a b) h) (Real.linearOrder.6 0 (instHDiv.hDiv a b)) = instHDiv.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a)) (Decidable.rec (fun h => (fun x => Real.instNeg.1 b) h) (fun h => (fun x => b) h) (Real.linearOrder.toDecidableLE 0 b))

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

  -AbsR a ≤ a ∧ a ≤ AbsR a

Predicate logic (unfolded):

  ∀ (a : Real), (Real.instLE.1 (Real.instNeg.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) inferInstance)) a ∧ Real.instLE.1 a (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a)))

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

  AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r

Predicate logic (unfolded):

  ∀ (a r : Real), Real.instLE.1 Zero.toOfNat0.1 r → Real.instLE.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a)) r ↔ (Real.instLE.1 (Real.instNeg.1 r) a ∧ Real.instLE.1 a r)

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

  AbsR a < r ↔ -r < a ∧ a < r

Predicate logic (unfolded):

  ∀ (a r : Real), Real.instLT.1 Zero.toOfNat0.1 r → Real.instLT.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 a) h) (fun h => (fun x => a) h) (Real.linearOrder.toDecidableLE 0 a)) r ↔ (Real.instLT.1 (Real.instNeg.1 r) a ∧ Real.instLT.1 a r)

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

  AbsR (AbsR a - AbsR b) ≤ AbsR (a - b)

Predicate logic (unfolded):

  ∀ (a b : Real), Real.instLE.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 (instHSub.1 (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b))) h) (fun h => (fun x => instHSub.1 (ite (GE.ge a 0) a (Real.instNeg.neg a)) (ite (GE.ge b 0) b (Real.instNeg.neg b))) h) (Real.linearOrder.toDecidableLE 0 (instHSub.hSub (LRA.Analysis.RealAnalysis.AbsR a) (LRA.Analysis.RealAnalysis.AbsR b)))) (Decidable.rec (fun h => (fun x => Real.instNeg.1 (instHSub.1 a b)) h) (fun h => (fun x => instHSub.1 a b) h) (Real.linearOrder.toDecidableLE 0 (instHSub.hSub a b)))

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

  (Fin n → ℝ) → AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR (a i))

Predicate logic (unfolded):

  ∀ (n : Nat) (a : Fin n → Real), Real.instLE.1 (Decidable.rec (fun h => (fun x => Real.instNeg.1 (Multiset.map a Finset.univ.val).sum) h) (fun h => (fun x => Multiset.foldr (fun x1 x2 => instHAdd.hAdd x1 x2) 0 (Multiset.map a Finset.univ.val)) h) (Real.linearOrder.toDecidableLE 0 (Finset.univ.sum a))) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => LRA.Analysis.RealAnalysis.AbsR (a i)) l)) ⋯))

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
