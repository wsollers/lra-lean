
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

/--
`IsLittleOAt` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x))))

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))

Logical form (Lean):

```lean
def IsLittleOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|
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
def IsLittleOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|

/--
`IsLittleOAtTop` TODO

Predicate logic:

  ∀ (f g : Real → Real) (ε : Real), GT.gt ε 0 → Exists fun R => (GT.gt R 0 ∧ ∀ (x : Real), GT.gt x R → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x))))

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun R => (Real.instLT.1 Zero.toOfNat0.1 R ∧ ∀ (x : Real), Real.instLT.1 R x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))

Logical form (Lean):

```lean
def IsLittleOAtTop (f g : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|
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
def IsLittleOAtTop (f g : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|

/--
`IsIncrementLittleO` TODO

Predicate logic:

  ∀ (r : Real → Real) (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (h : Real), Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLE.le (abs (r h)) (instHMul.hMul ε (abs h)))

Predicate logic (unfolded):

  ∀ (r : Real → Real) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (r h) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (r h))) (instHMul.1 ε (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h))))

Logical form (Lean):

```lean
def IsIncrementLittleO (r : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h, 0 < |h| → |h| < δ → |r h| ≤ ε * |h|
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
def IsIncrementLittleO (r : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h, 0 < |h| → |h| < δ → |r h| ≤ ε * |h|

/--
`LittleOQuotientCharacterization` TODO

Predicate logic:

  IsLittleOAt f g a ↔ Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a : Real), (Filter.instMembership.1 (Filter.instInf.1 (nhds a) { sets := fun t => Set.instLE.le (Set.instCompl.compl (Set.instSingletonSet.singleton a)) t, univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ }) fun x => (fun x => g x = Zero.toOfNat0.1 → False) x) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))) ↔ Filter.instPartialOrder.toLE.1 { sets := fun x => Set.instMembership.1 (nhdsWithin a (Set.instCompl.compl (Set.instSingletonSet.singleton a))).sets (Set.preimage (fun x => instHDiv.hDiv (f x) (g x)) x), univ_sets := ⋯, sets_of_superset := ⋯, inter_sets := ⋯ } (nhds Zero.toOfNat0.1)

Logical form (Lean):

```lean
theorem LittleOQuotientCharacterization (f g : ℝ → ℝ) (a : ℝ)
    (hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)) :
    IsLittleOAt f g a ↔
      Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0)
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
theorem LittleOQuotientCharacterization (f g : ℝ → ℝ) (a : ℝ)
    (hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)) :
    IsLittleOAt f g a ↔
      Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0) := by
  sorry
/--
`LittleOSumRule` TODO

Predicate logic:

  (IsLittleOAt f1 g a ∧ IsLittleOAt f2 g a) → IsLittleOAt (fun x => f1 x + f2 x) g a

Predicate logic (unfolded):

  ∀ (f1 f2 g : Real → Real) (a : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f1 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f1 x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f2 x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f2 x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHAdd.1 (f1 x) (f2 x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHAdd.1 (f1 x) (f2 x)) x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))

Logical form (Lean):

```lean
theorem LittleOSumRule (f1 f2 g : ℝ → ℝ) (a : ℝ)
    (h1 : IsLittleOAt f1 g a) (h2 : IsLittleOAt f2 g a) :
    IsLittleOAt (fun x => f1 x + f2 x) g a
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
theorem LittleOSumRule (f1 f2 g : ℝ → ℝ) (a : ℝ)
    (h1 : IsLittleOAt f1 g a) (h2 : IsLittleOAt f2 g a) :
    IsLittleOAt (fun x => f1 x + f2 x) g a := by
  sorry
/--
`LittleOBoundedFactorRule` TODO

Predicate logic:

  (IsLittleOAt f g a ∧ ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) → IsLittleOAt (fun x => m x * f x) g a

Predicate logic (unfolded):

  ∀ (f g m : Real → Real) (a : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))) ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ Exists fun η => (Real.instLT.1 Zero.toOfNat0.1 η ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) η → Real.instLE.1 (SemilatticeSup.toMax.1 (m x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (m x))) M))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 ((fun x => instHMul.1 (m x) (f x)) x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 ((fun x => instHMul.1 (m x) (f x)) x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))

Logical form (Lean):

```lean
theorem LittleOBoundedFactorRule (f g m : ℝ → ℝ) (a : ℝ)
    (hf : IsLittleOAt f g a)
    (hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) :
    IsLittleOAt (fun x => m x * f x) g a
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
theorem LittleOBoundedFactorRule (f g m : ℝ → ℝ) (a : ℝ)
    (hf : IsLittleOAt f g a)
    (hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) :
    IsLittleOAt (fun x => m x * f x) g a := by
  sorry
end LRA.Analysis.RealAnalysis
