
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

/--
`AbsoluteError` TODO

Predicate logic:

  def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde|

Predicate logic (unfolded):

  def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde| (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde|
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
def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde|

/--
`RelativeError` TODO

Predicate logic:

  noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde|

Predicate logic (unfolded):

  noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde| (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde|
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
noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde|

/--
`AbsoluteErrorSum` TODO

Predicate logic:

  ∀ (x y xTilde yTilde : Real), Real.instLE.le (LRA.Analysis.RealAnalysis.AbsoluteError (instHAdd.hAdd x y) (instHAdd.hAdd xTilde yTilde)) (instHAdd.hAdd (LRA.Analysis.RealAnalysis.AbsoluteError x xTilde) (LRA.Analysis.RealAnalysis.AbsoluteError y yTilde))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y xTilde yTilde : ℝ
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd x y) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd xTilde yTilde))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)))

Logical form (Lean):

```lean
theorem AbsoluteErrorSum (x y xTilde yTilde : ℝ) :
    AbsoluteError (x + y) (xTilde + yTilde) ≤
      AbsoluteError x xTilde + AbsoluteError y yTilde
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
theorem AbsoluteErrorSum (x y xTilde yTilde : ℝ) :
    AbsoluteError (x + y) (xTilde + yTilde) ≤
      AbsoluteError x xTilde + AbsoluteError y yTilde := by
  sorry
/--
`AbsoluteErrorProduct` TODO

Predicate logic:

  ∀ (x y xTilde yTilde : Real), Real.instLE.le (LRA.Analysis.RealAnalysis.AbsoluteError (instHMul.hMul x y) (instHMul.hMul xTilde yTilde)) (instHAdd.hAdd (instHAdd.hAdd (instHMul.hMul (abs xTilde) (LRA.Analysis.RealAnalysis.AbsoluteError y yTilde)) (instHMul.hMul (abs yTilde) (LRA.Analysis.RealAnalysis.AbsoluteError x xTilde))) (instHMul.hMul (LRA.Analysis.RealAnalysis.AbsoluteError x xTilde) (LRA.Analysis.RealAnalysis.AbsoluteError y yTilde)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y xTilde yTilde : ℝ
  Prove
    Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul x y) ({ hMul := fun a b => Real.instMul.mul a b }.hMul xTilde yTilde))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul (abs xTilde) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (abs yTilde) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde))))

Logical form (Lean):

```lean
theorem AbsoluteErrorProduct (x y xTilde yTilde : ℝ) :
    AbsoluteError (x * y) (xTilde * yTilde) ≤
      |xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde +
      AbsoluteError x xTilde * AbsoluteError y yTilde
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
theorem AbsoluteErrorProduct (x y xTilde yTilde : ℝ) :
    AbsoluteError (x * y) (xTilde * yTilde) ≤
      |xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde +
      AbsoluteError x xTilde * AbsoluteError y yTilde := by
  sorry
/--
`AbsoluteErrorQuotient` TODO

Predicate logic:

  ∀ (x y xTilde yTilde : Real), (Ne y 0 ∧ (Ne yTilde 0 ∧ Real.instLT.lt (LRA.Analysis.RealAnalysis.RelativeError y yTilde) 1)) → Real.instLE.le (LRA.Analysis.RealAnalysis.AbsoluteError (instHDiv.hDiv x y) (instHDiv.hDiv xTilde yTilde)) (instHMul.hMul (instHDiv.hDiv (instHAdd.hAdd (instHMul.hMul (abs xTilde) (LRA.Analysis.RealAnalysis.AbsoluteError y yTilde)) (instHMul.hMul (abs yTilde) (LRA.Analysis.RealAnalysis.AbsoluteError x xTilde))) (instHPow.hPow yTilde 2)) (instHDiv.hDiv 1 (instHSub.hSub 1 (LRA.Analysis.RealAnalysis.RelativeError y yTilde))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y xTilde yTilde : ℝ
    hy : y ≠ 0
    hyTilde : yTilde ≠ 0
  Prove
    ((y = 0 → False) ∧ ((yTilde = 0 → False) ∧ Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde)) 1)) → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv x y) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv xTilde yTilde))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul (abs xTilde) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (abs yTilde) (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)))) (instHPow.1 yTilde 2)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde)))))

Logical form (Lean):

```lean
theorem AbsoluteErrorQuotient (x y xTilde yTilde : ℝ)
    (hy : y ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    AbsoluteError (x / y) (xTilde / yTilde) ≤
      (|xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde)
        / yTilde ^ 2 * (1 / (1 - RelativeError y yTilde))
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
theorem AbsoluteErrorQuotient (x y xTilde yTilde : ℝ)
    (hy : y ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    AbsoluteError (x / y) (xTilde / yTilde) ≤
      (|xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde)
        / yTilde ^ 2 * (1 / (1 - RelativeError y yTilde)) := by
  sorry
/--
`RelativeErrorProduct` TODO

Predicate logic:

  ∀ (x y xTilde yTilde : Real), (Ne xTilde 0 ∧ Ne yTilde 0) → Real.instLE.le (LRA.Analysis.RealAnalysis.RelativeError (instHMul.hMul x y) (instHMul.hMul xTilde yTilde)) (instHAdd.hAdd (instHAdd.hAdd (LRA.Analysis.RealAnalysis.RelativeError x xTilde) (LRA.Analysis.RealAnalysis.RelativeError y yTilde)) (instHMul.hMul (LRA.Analysis.RealAnalysis.RelativeError x xTilde) (LRA.Analysis.RealAnalysis.RelativeError y yTilde)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y xTilde yTilde : ℝ
    hxTilde : xTilde ≠ 0
    hyTilde : yTilde ≠ 0
  Prove
    ((xTilde = 0 → False) ∧ (yTilde = 0 → False)) → Real.instLE.le ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hMul := fun a b => Real.instMul.mul a b }.hMul x y) ({ hMul := fun a b => Real.instMul.mul a b }.hMul xTilde yTilde))) (abs ({ hMul := fun a b => Real.instMul.mul a b }.hMul xTilde yTilde))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)) (abs xTilde)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)) (abs xTilde)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde))))

Logical form (Lean):

```lean
theorem RelativeErrorProduct (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0) :
    RelativeError (x * y) (xTilde * yTilde) ≤
      RelativeError x xTilde + RelativeError y yTilde +
      RelativeError x xTilde * RelativeError y yTilde
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
theorem RelativeErrorProduct (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0) :
    RelativeError (x * y) (xTilde * yTilde) ≤
      RelativeError x xTilde + RelativeError y yTilde +
      RelativeError x xTilde * RelativeError y yTilde := by
  sorry
/--
`RelativeErrorQuotient` TODO

Predicate logic:

  ∀ (x y xTilde yTilde : Real), (Ne xTilde 0 ∧ (Ne yTilde 0 ∧ Real.instLT.lt (LRA.Analysis.RealAnalysis.RelativeError y yTilde) 1)) → Real.instLE.le (LRA.Analysis.RealAnalysis.RelativeError (instHDiv.hDiv x y) (instHDiv.hDiv xTilde yTilde)) (instHDiv.hDiv (instHAdd.hAdd (LRA.Analysis.RealAnalysis.RelativeError x xTilde) (LRA.Analysis.RealAnalysis.RelativeError y yTilde)) (instHSub.hSub 1 (LRA.Analysis.RealAnalysis.RelativeError y yTilde)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y xTilde yTilde : ℝ
    hxTilde : xTilde ≠ 0
    hyTilde : yTilde ≠ 0
  Prove
    ((xTilde = 0 → False) ∧ ((yTilde = 0 → False) ∧ Real.instLT.lt ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde)) 1)) → Real.instLE.le ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv x y) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv xTilde yTilde))) (abs ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv xTilde yTilde))) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x xTilde)) (abs xTilde)) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde))) ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub y yTilde)) (abs yTilde))))

Logical form (Lean):

```lean
theorem RelativeErrorQuotient (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    RelativeError (x / y) (xTilde / yTilde) ≤
      (RelativeError x xTilde + RelativeError y yTilde) /
        (1 - RelativeError y yTilde)
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
theorem RelativeErrorQuotient (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    RelativeError (x / y) (xTilde / yTilde) ≤
      (RelativeError x xTilde + RelativeError y yTilde) /
        (1 - RelativeError y yTilde) := by
  sorry
end LRA.Analysis.RealAnalysis
