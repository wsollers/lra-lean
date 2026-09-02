import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

namespace LRA.Analysis.Limits

/--
`ZeroOverZeroIsIndeterminate` TODO

Predicate logic:

  ∃ f g f' g' ∈ ℝ → ℝ c L L' ∈ ℝ, L ≠ L' ∧ TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧ TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧ TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧ TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L'

Predicate logic (unfolded):

  Exists fun f => Exists fun g => Exists fun f' => Exists fun g' => Exists fun c => Exists fun L => Exists fun L' => (L = L' → False ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) 0))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) 0))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f' x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f' x) 0))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g' x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g' x) 0))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f x) (g x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f x) (g x)) x) L))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => x = c → False) x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f' x) (g' x)) x) L') (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f' x) (g' x)) x) L'))) ε)))))))

Logical form (Lean):

```lean
theorem ZeroOverZeroIsIndeterminate :
    ∃ (f g f' g' : ℝ → ℝ) (c L L' : ℝ), L ≠ L' ∧
      TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧
      TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧
      TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧
      TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L'
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
theorem ZeroOverZeroIsIndeterminate :
    ∃ (f g f' g' : ℝ → ℝ) (c L L' : ℝ), L ≠ L' ∧
      TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧
      TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧
      TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧
      TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L' := by
  sorry
/--
`OneToTheInftyIsIndeterminate` TODO

Predicate logic:

  ∃ f f' ∈ ℝ → ℝ X ∈ Set ℝ L L' ∈ ℝ, L ≠ L' ∧ TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧ TendsToInfty (fun x => (f x) ^ x) X L ∧ TendsToInfty (fun x => (f' x) ^ x) X L'

Predicate logic (unfolded):

  Exists fun f => Exists fun f' => Exists fun X => Exists fun L => Exists fun L' => (L = L' → False ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) One.toOfNat1.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) 1))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f' x) One.toOfNat1.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f' x) 1))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHPow.1 (f x) x) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHPow.hPow (f x) x) x) L))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHPow.1 (f' x) x) x) L') (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHPow.hPow (f' x) x) x) L'))) ε))))

Logical form (Lean):

```lean
theorem OneToTheInftyIsIndeterminate :
    ∃ (f f' : ℝ → ℝ) (X : Set ℝ) (L L' : ℝ), L ≠ L' ∧
      TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧
      TendsToInfty (fun x => (f x) ^ x) X L ∧
      TendsToInfty (fun x => (f' x) ^ x) X L'
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
theorem OneToTheInftyIsIndeterminate :
    ∃ (f f' : ℝ → ℝ) (X : Set ℝ) (L L' : ℝ), L ≠ L' ∧
      TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧
      TendsToInfty (fun x => (f x) ^ x) X L ∧
      TendsToInfty (fun x => (f' x) ^ x) X L' := by
  sorry
end LRA.Analysis.Limits
