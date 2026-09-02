import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

namespace LRA.Analysis.Bounds.Algebra

/--
`Displace` TODO

Predicate logic:

  ∀ (A : Set Real) (c a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ (fun a => instHAdd.hAdd a c) a_1 = a)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (c a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ (fun a => instHAdd.1 a c) a_1 = a)

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

  ∀ (A : Set Real) (scale a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ (fun a => instHMul.hMul scale a) a_1 = a)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (scale a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ (fun a => instHMul.1 scale a) a_1 = a)

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

  ∀ (A : Set Real) (a : Real), Exists fun a_1 => (Set.instMembership.mem A a_1 ∧ (fun a => Real.instNeg.neg a) a_1 = a)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (a : Real), Exists fun a_1 => (Set.instMembership.1 A a_1 ∧ (fun a => Real.instNeg.1 a) a_1 = a)

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

  LRA.Analysis.Bounds.IsUpperBound (u + c) (Displace A c)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {c u : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHAdd.1 a c) a = x)) x → Real.instLE.1 x (instHAdd.1 u c)

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

  LRA.Analysis.Bounds.IsLowerBound (l + c) (Displace A c)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {c l : Real}, (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHAdd.1 a c) a = x)) x → Real.instLE.1 (instHAdd.1 l c) x

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

  (0 < scale) → LRA.Analysis.Bounds.IsUpperBound (scale * u) (Dilate A scale)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {scale u : Real}, (Real.instLT.1 Zero.toOfNat0.1 scale ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHMul.1 scale a) a = x)) x → Real.instLE.1 x (instHMul.1 scale u)

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

  (0 < scale) → LRA.Analysis.Bounds.IsLowerBound (scale * l) (Dilate A scale)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {scale l : Real}, (Real.instLT.1 Zero.toOfNat0.1 scale ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHMul.1 scale a) a = x)) x → Real.instLE.1 (instHMul.1 scale l) x

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

  (scale < 0) → LRA.Analysis.Bounds.IsUpperBound (scale * l) (Dilate A scale)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {scale l : Real}, (Real.instLT.1 scale Zero.toOfNat0.1 ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 l x) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHMul.1 scale a) a = x)) x → Real.instLE.1 x (instHMul.1 scale l)

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

  (scale < 0) → LRA.Analysis.Bounds.IsLowerBound (scale * u) (Dilate A scale)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {scale u : Real}, (Real.instLT.1 scale Zero.toOfNat0.1 ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u) → ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => instHMul.1 scale a) a = x)) x → Real.instLE.1 (instHMul.1 scale u) x

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

  LRA.Analysis.Bounds.IsUpperBound b A ↔ LRA.Analysis.Bounds.IsLowerBound (-b) (Reflect A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {b : Real}, ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x b ↔ ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => Real.instNeg.1 a) a = x)) x → Real.instLE.1 (Real.instNeg.1 b) x

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

  LRA.Analysis.Bounds.IsLowerBound b A ↔ LRA.Analysis.Bounds.IsUpperBound (-b) (Reflect A)

Predicate logic (unfolded):

  ∀ {A : Real → Prop} {b : Real}, ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 b x ↔ ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ (fun a => Real.instNeg.1 a) a = x)) x → Real.instLE.1 x (Real.instNeg.1 b)

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
