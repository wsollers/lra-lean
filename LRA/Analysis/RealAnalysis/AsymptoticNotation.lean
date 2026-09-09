
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

/--
`IsLittleOAt` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))

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

  ∀ (f g : Real → Real) (ε : Real), GT.gt ε 0 → Exists fun R => (GT.gt R 0 ∧ (∀ (x : Real), GT.gt x R → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun R => (Real.instLT.lt 0 R ∧ (∀ (x : Real), Real.instLT.lt R x → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))

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

  ∀ (r : Real → Real) (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (h : Real), Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLE.le (abs (r h)) (instHMul.hMul ε (abs h))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLE.le (abs (r h)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs h))))

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

  ∀ (f g : Real → Real) (a : Real), Filter.Eventually (fun x => Ne (g x) 0) (nhdsWithin a (Set.instCompl.compl (Set.instSingletonSet.singleton a))) → LRA.Analysis.RealAnalysis.IsLittleOAt f g a ↔ Filter.Tendsto (fun x => instHDiv.hDiv (f x) (g x)) (nhdsWithin a (Set.instCompl.compl (Set.instSingletonSet.singleton a))) (nhds 0)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a : ℝ
    hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)
  Prove
    Filter.Eventually (fun x => Ne (g x) 0) (nhdsWithin a (Set.instCompl.compl (Set.instSingletonSet.singleton a))) → LRA.Analysis.RealAnalysis.IsLittleOAt f g a ↔ Filter.Tendsto (fun x => instHDiv.hDiv (f x) (g x)) (nhdsWithin a (Set.instCompl.compl (Set.instSingletonSet.singleton a))) (nhds 0)

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

  ∀ (f1 f2 g : Real → Real) (a : Real), (LRA.Analysis.RealAnalysis.IsLittleOAt f1 g a ∧ LRA.Analysis.RealAnalysis.IsLittleOAt f2 g a) → LRA.Analysis.RealAnalysis.IsLittleOAt (fun x => instHAdd.hAdd (f1 x) (f2 x)) g a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f1 f2 g : ℝ → ℝ
    a : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f1 x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f2 x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x))))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f1 x) (f2 x)) x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))

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

  ∀ (f g m : Real → Real) (a : Real), (LRA.Analysis.RealAnalysis.IsLittleOAt f g a ∧ (Exists fun M => (GT.gt M 0 ∧ (Exists fun η => (GT.gt η 0 ∧ (∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) η → Real.instLE.le (abs (m x)) M)))))) → LRA.Analysis.RealAnalysis.IsLittleOAt (fun x => instHMul.hMul (m x) (f x)) g a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g m : ℝ → ℝ
    a : ℝ
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))) ∧ (Exists fun M => (Real.instLT.lt 0 M ∧ (Exists fun η => (Real.instLT.lt 0 η ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) η → Real.instLE.le (abs (m x)) M)))))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (m x) (f x)) x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))

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
