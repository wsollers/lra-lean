import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

namespace LRA.Analysis.Bounds.Algebra

/--
`Displace` TODO

Predicate logic:

  ∀ (A : Set Real) (c a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (fun a => instHAdd.hAdd a c) a_1 = a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (fun a => { hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) a_1 = a)

Logical form (Lean):

```lean
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A
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
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A

/--
`Dilate` TODO

Predicate logic:

  ∀ (A : Set Real) (scale a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (fun a => instHMul.hMul scale a) a_1 = a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a_1 = a)

Logical form (Lean):

```lean
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A
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
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

/--
`Reflect` TODO

Predicate logic:

  ∀ (A : Set Real) (a : Real), Exists fun a_1 => (a_1 ∈ A ∧ (fun a => Real.instNeg.neg a) a_1 = a)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a_1 => (a_1 ∈ A ∧ (fun a => Real.instNeg.neg a) a_1 = a)

Logical form (Lean):

```lean
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A
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
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A

/--
`TranslationPreservesUpperBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {c u : Real}, LRA.Analysis.Bounds.IsUpperBound u A → LRA.Analysis.Bounds.IsUpperBound (instHAdd.hAdd u c) (LRA.Analysis.Bounds.Algebra.Displace A c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    c u : ℝ
    upperBoundHypothesis : LRA.Analysis.Bounds.IsUpperBound u A
  Prove
    (∀ (x : Real), x ∈ A → Real.instLE.le x u) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) a = x) → Real.instLE.le x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd u c)

Logical form (Lean):

```lean
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound (u + c) (Displace A c)
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
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound (u + c) (Displace A c) := by
  sorry
/--
`TranslationPreservesLowerBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {c l : Real}, LRA.Analysis.Bounds.IsLowerBound l A → LRA.Analysis.Bounds.IsLowerBound (instHAdd.hAdd l c) (LRA.Analysis.Bounds.Algebra.Displace A c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    c l : ℝ
    lowerBoundHypothesis : LRA.Analysis.Bounds.IsLowerBound l A
  Prove
    (∀ (x : Real), x ∈ A → Real.instLE.le l x) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hAdd := fun a b => Real.instAdd.add a b }.hAdd a c) a = x) → Real.instLE.le ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd l c) x

Logical form (Lean):

```lean
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound (l + c) (Displace A c)
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
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound (l + c) (Displace A c) := by
  sorry
/--
`PositiveDilationPreservesUpperBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {scale u : Real}, (Real.instLT.lt 0 scale ∧ LRA.Analysis.Bounds.IsUpperBound u A) → LRA.Analysis.Bounds.IsUpperBound (instHMul.hMul scale u) (LRA.Analysis.Bounds.Algebra.Dilate A scale)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    scale u : ℝ
    upperBoundHypothesis : LRA.Analysis.Bounds.IsUpperBound u A
  Prove
    (Real.instLT.lt 0 scale ∧ (∀ (x : Real), x ∈ A → Real.instLE.le x u)) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a = x) → Real.instLE.le x ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale u)

Logical form (Lean):

```lean
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * u) (Dilate A scale)
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
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * u) (Dilate A scale) := by
  sorry
/--
`PositiveDilationPreservesLowerBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {scale l : Real}, (Real.instLT.lt 0 scale ∧ LRA.Analysis.Bounds.IsLowerBound l A) → LRA.Analysis.Bounds.IsLowerBound (instHMul.hMul scale l) (LRA.Analysis.Bounds.Algebra.Dilate A scale)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    scale l : ℝ
    lowerBoundHypothesis : LRA.Analysis.Bounds.IsLowerBound l A
  Prove
    (Real.instLT.lt 0 scale ∧ (∀ (x : Real), x ∈ A → Real.instLE.le l x)) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a = x) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale l) x

Logical form (Lean):

```lean
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * l) (Dilate A scale)
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
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * l) (Dilate A scale) := by
  sorry
/--
`NegativeDilationSendsLowerToUpperBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {scale l : Real}, (Real.instLT.lt scale 0 ∧ LRA.Analysis.Bounds.IsLowerBound l A) → LRA.Analysis.Bounds.IsUpperBound (instHMul.hMul scale l) (LRA.Analysis.Bounds.Algebra.Dilate A scale)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    scale l : ℝ
    lowerBoundHypothesis : LRA.Analysis.Bounds.IsLowerBound l A
  Prove
    (Real.instLT.lt scale 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le l x)) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a = x) → Real.instLE.le x ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale l)

Logical form (Lean):

```lean
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * l) (Dilate A scale)
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
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * l) (Dilate A scale) := by
  sorry
/--
`NegativeDilationSendsUpperToLowerBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {scale u : Real}, (Real.instLT.lt scale 0 ∧ LRA.Analysis.Bounds.IsUpperBound u A) → LRA.Analysis.Bounds.IsLowerBound (instHMul.hMul scale u) (LRA.Analysis.Bounds.Algebra.Dilate A scale)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    scale u : ℝ
    upperBoundHypothesis : LRA.Analysis.Bounds.IsUpperBound u A
  Prove
    (Real.instLT.lt scale 0 ∧ (∀ (x : Real), x ∈ A → Real.instLE.le x u)) → ∀ (x : Real), x ∈ fun x => Exists fun a => (a ∈ A ∧ (fun a => { hMul := fun a b => Real.instMul.mul a b }.hMul scale a) a = x) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul scale u) x

Logical form (Lean):

```lean
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * u) (Dilate A scale)
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
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * u) (Dilate A scale) := by
  sorry
/--
`ReflectionSwapsUpperBoundsToLowerBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {b : Real}, LRA.Analysis.Bounds.IsUpperBound b A ↔ LRA.Analysis.Bounds.IsLowerBound (Real.instNeg.neg b) (LRA.Analysis.Bounds.Algebra.Reflect A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    b : ℝ
  Prove
    LRA.Analysis.Bounds.IsUpperBound b A ↔ LRA.Analysis.Bounds.IsLowerBound (Real.instNeg.neg b) (LRA.Analysis.Bounds.Algebra.Reflect A)

Logical form (Lean):

```lean
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsUpperBound b A ↔
      LRA.Analysis.Bounds.IsLowerBound (-b) (Reflect A)
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
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsUpperBound b A ↔
      LRA.Analysis.Bounds.IsLowerBound (-b) (Reflect A) := by
  sorry
/--
`ReflectionSwapsLowerBoundsToUpperBounds` TODO

Predicate logic:

  ∀ {A : Set Real} {b : Real}, LRA.Analysis.Bounds.IsLowerBound b A ↔ LRA.Analysis.Bounds.IsUpperBound (Real.instNeg.neg b) (LRA.Analysis.Bounds.Algebra.Reflect A)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    b : ℝ
  Prove
    LRA.Analysis.Bounds.IsLowerBound b A ↔ LRA.Analysis.Bounds.IsUpperBound (Real.instNeg.neg b) (LRA.Analysis.Bounds.Algebra.Reflect A)

Logical form (Lean):

```lean
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsLowerBound b A ↔
      LRA.Analysis.Bounds.IsUpperBound (-b) (Reflect A)
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
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsLowerBound b A ↔
      LRA.Analysis.Bounds.IsUpperBound (-b) (Reflect A) := by
  sorry
end LRA.Analysis.Bounds.Algebra
