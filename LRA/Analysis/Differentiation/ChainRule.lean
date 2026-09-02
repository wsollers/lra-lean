
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`CaratheodoryCharacterization` TODO

Predicate logic:

  (ℝ → ℝ) → Derivative D f A c ↔ ∃ φ ∈ ℝ → ℝ, φ c = D ∧ LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧ ∀ x ∈ A, f x - f c = (x - c) * φ x

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c D : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ Exists fun φ => (φ c = D ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (φ x) (φ c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (φ x) (φ c)))) ε) ∧ ∀ (x : Real), Set.instMembership.1 A x → instHSub.1 (f x) (f c) = instHMul.1 (instHSub.1 x c) (φ x)))

Logical form (Lean):

```lean
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x := by
  sorry
/--
`ChainRule` TODO

Predicate logic:

  (∀ x ∈ A, f x ∈ B) → Derivative (Dg * Df) (fun x => g (f x)) A c

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A B : Real → Prop) (c Df Dg : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) Df))) ε) ∧ (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 B (instHAdd.1 (f c) h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (g (instHAdd.hAdd (f c) h)) (g (f c))) h) Dg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (g (instHAdd.hAdd (f c) h)) (g (f c))) h) Dg))) ε))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub ((fun x => g (f x)) (instHAdd.hAdd c h)) ((fun x => g (f x)) c)) h) (instHMul.1 Dg Df)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub ((fun x => g (f x)) (instHAdd.hAdd c h)) ((fun x => g (f x)) c)) h) (instHMul.hMul Dg Df)))) ε)

Logical form (Lean):

```lean
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c
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
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c := by
  sorry
/--
`NthDerivativeAt` TODO

Predicate logic:

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Set Real) (n : Nat) (c : Real), (fD 0 = f ∧ ∀ (k : Nat), instLTNat.lt k n → LRA.Analysis.Differentiation.Derivative (fD (instHAdd.hAdd k 1) c) (fD k) A c)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (fD : Nat → Real → Real) (A : Real → Prop) (n : Nat) (c : Real), (fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.1 k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)))) ε))

Logical form (Lean):

```lean
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c

/--
`LeibnizRule` TODO

Predicate logic:

  hD n c = ∑ k ∈ Finset.range (n + 1), n.choose k ∈ ℝ * fD k c * gD (n - k) c

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (fD gD hD : Nat → Real → Real) (A : Real → Prop) (n : Nat) (c : Real), ((fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)))) ε)) ∧ ((gD (instOfNatNat 0).1 = g ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (gD k (instHAdd.hAdd c h)) (gD k c)) h) (gD (instHAdd.hAdd k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (gD k (instHAdd.hAdd c h)) (gD k c)) h) (gD (instHAdd.hAdd k 1) c)))) ε)) ∧ (hD (instOfNatNat 0).1 = funx => instHMul.1 (f x) (g x) ∧ ∀ (k : Nat), instLTNat.1 k n → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (hD k (instHAdd.hAdd c h)) (hD k c)) h) (hD (instHAdd.hAdd k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (hD k (instHAdd.hAdd c h)) (hD k c)) h) (hD (instHAdd.hAdd k 1) c)))) ε)))) → hD n c = Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun k => instHMul.hMul (instHMul.hMul (n.choose k).cast (fD k c)) (gD (instHSub.hSub n k) c)) l)) ⋯ (Finset.range (instHAdd.hAdd n 1)).val)

Logical form (Lean):

```lean
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c
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
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c := by
  sorry
/--
`FaaDiBrunoSecondOrder` TODO

Predicate logic:

  (∀ x ∈ A, f x ∈ B) → hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (fD gD hD : Nat → Real → Real) (A B : Real → Prop) (c : Real), ((fD (instOfNatNat 0).1 = f ∧ ∀ (k : Nat), instLTNat.1 k (instOfNatNat 2).1 → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (fD k (instHAdd.hAdd c h)) (fD k c)) h) (fD (instHAdd.hAdd k 1) c)))) ε)) ∧ (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x) ∧ ((gD (instOfNatNat 0).1 = g ∧ ∀ (k : Nat), instLTNat.1 k (instOfNatNat 2).1 → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 B (instHAdd.1 (f c) h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (gD k (instHAdd.hAdd (f c) h)) (gD k (f c))) h) (gD (instHAdd.hAdd k 1) (f c))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (gD k (instHAdd.hAdd (f c) h)) (gD k (f c))) h) (gD (instHAdd.hAdd k 1) (f c))))) ε)) ∧ (hD (instOfNatNat 0).1 = funx => g (f x) ∧ ∀ (k : Nat), instLTNat.1 k (instOfNatNat 2).1 → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (hD k (instHAdd.hAdd c h)) (hD k c)) h) (hD (instHAdd.hAdd k 1) c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (hD k (instHAdd.hAdd c h)) (hD k c)) h) (hD (instHAdd.hAdd k 1) c)))) ε))))) → hD (instOfNatNat 2).1 c = instHAdd.1 (instHMul.1 (gD (instOfNatNat 2).1 (f c)) (instHPow.1 (fD (instOfNatNat 1).1 c) (instOfNatNat 2).1)) (instHMul.1 (gD (instOfNatNat 1).1 (f c)) (fD (instOfNatNat 2).1 c))

Logical form (Lean):

```lean
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c
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
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c := by
  sorry
end LRA.Analysis.Differentiation
