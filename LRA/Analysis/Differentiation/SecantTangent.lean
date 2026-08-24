
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Differentiation

/--
`SecantLine` TODO

Predicate logic:

  noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁)

Predicate logic (unfolded):

  noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁)
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
noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁)

/--
`DifferenceQuotient` TODO

Predicate logic:

  noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h

Predicate logic (unfolded):

  noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h
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
noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h

/--
`TangentLine` TODO

Predicate logic:

  def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c)

Predicate logic (unfolded):

  def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c)
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
def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c)

end LRA.Analysis.Differentiation
