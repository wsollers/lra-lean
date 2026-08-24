
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

  AbsoluteError (x + y) (xTilde + yTilde) ≤ AbsoluteError x xTilde + AbsoluteError y yTilde

Predicate logic (unfolded):

  ∀ (x y xTilde yTilde : Real), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHAdd.1 x y) (instHAdd.1 xTilde yTilde)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHAdd.hAdd x y) (instHAdd.hAdd xTilde yTilde)))) (instHAdd.1 (SemilatticeSup.toMax.1 (instHSub.1 x xTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x xTilde))) (SemilatticeSup.toMax.1 (instHSub.1 y yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub y yTilde))))

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

  AbsoluteError (x * y) (xTilde * yTilde) ≤ |xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde + AbsoluteError x xTilde * AbsoluteError y yTilde

Predicate logic (unfolded):

  ∀ (x y xTilde yTilde : Real), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHMul.1 x y) (instHMul.1 xTilde yTilde)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHMul.hMul x y) (instHMul.hMul xTilde yTilde)))) (instHAdd.1 (instHAdd.1 (instHMul.1 (SemilatticeSup.toMax.1 xTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg xTilde)) (SemilatticeSup.toMax.max (instHSub.hSub y yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y yTilde)))) (instHMul.1 (SemilatticeSup.toMax.1 yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)) (SemilatticeSup.toMax.max (instHSub.hSub x xTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x xTilde))))) (instHMul.1 (SemilatticeSup.toMax.1 (instHSub.hSub x xTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x xTilde))) (SemilatticeSup.toMax.1 (instHSub.hSub y yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y yTilde)))))

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

  (RelativeError y yTilde < 1) → AbsoluteError (x / y) (xTilde / yTilde) ≤ (|xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde) / yTilde ^ 2 * (1 / (1 - RelativeError y yTilde))

Predicate logic (unfolded):

  ∀ (x y xTilde yTilde : Real), (y = Zero.toOfNat0.1 → False ∧ (yTilde = Zero.toOfNat0.1 → False ∧ Real.instLT.1 (instHDiv.1 (SemilatticeSup.toMax.1 (instHSub.hSub y yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y yTilde))) (SemilatticeSup.toMax.1 yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 yTilde))) One.toOfNat1.1)) → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 x y) (instHDiv.1 xTilde yTilde)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv x y) (instHDiv.hDiv xTilde yTilde)))) (instHMul.1 (instHDiv.1 (instHAdd.1 (instHMul.1 (SemilatticeSup.toMax.max xTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg xTilde)) (abs (instHSub.hSub y yTilde))) (instHMul.1 (SemilatticeSup.toMax.max yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)) (abs (instHSub.hSub x xTilde)))) (instHPow.1 yTilde (instOfNatNat 2).1)) (instHDiv.1 One.toOfNat1.1 (instHSub.1 One.toOfNat1.1 (instHDiv.1 (LRA.Analysis.RealAnalysis.AbsoluteError y yTilde) (abs yTilde)))))

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

  RelativeError (x * y) (xTilde * yTilde) ≤ RelativeError x xTilde + RelativeError y yTilde + RelativeError x xTilde * RelativeError y yTilde

Predicate logic (unfolded):

  ∀ (x y xTilde yTilde : Real), (xTilde = Zero.toOfNat0.1 → False ∧ yTilde = Zero.toOfNat0.1 → False) → Real.instLE.1 (instHDiv.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHMul.hMul x y) (instHMul.hMul xTilde yTilde)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHMul.hMul x y) (instHMul.hMul xTilde yTilde)))) (SemilatticeSup.toMax.1 (instHMul.1 xTilde yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHMul.hMul xTilde yTilde)))) (instHAdd.1 (instHAdd.1 (instHDiv.1 (abs (instHSub.hSub x xTilde)) (SemilatticeSup.toMax.max xTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg xTilde))) (instHDiv.1 (abs (instHSub.hSub y yTilde)) (SemilatticeSup.toMax.max yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)))) (instHMul.1 (instHDiv.1 (abs (instHSub.hSub x xTilde)) (SemilatticeSup.toMax.max xTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg xTilde))) (instHDiv.1 (abs (instHSub.hSub y yTilde)) (SemilatticeSup.toMax.max yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)))))

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

  (RelativeError y yTilde < 1) → RelativeError (x / y) (xTilde / yTilde) ≤ (RelativeError x xTilde + RelativeError y yTilde) / (1 - RelativeError y yTilde)

Predicate logic (unfolded):

  ∀ (x y xTilde yTilde : Real), (xTilde = Zero.toOfNat0.1 → False ∧ (yTilde = Zero.toOfNat0.1 → False ∧ Real.instLT.1 (instHDiv.1 (SemilatticeSup.toMax.1 (instHSub.hSub y yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub y yTilde))) (SemilatticeSup.toMax.1 yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 yTilde))) One.toOfNat1.1)) → Real.instLE.1 (instHDiv.1 (SemilatticeSup.toMax.1 (instHSub.hSub (instHDiv.hDiv x y) (instHDiv.hDiv xTilde yTilde)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub (instHDiv.hDiv x y) (instHDiv.hDiv xTilde yTilde)))) (SemilatticeSup.toMax.1 (instHDiv.1 xTilde yTilde) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHDiv.hDiv xTilde yTilde)))) (instHDiv.1 (instHAdd.1 (instHDiv.1 (abs (instHSub.hSub x xTilde)) (SemilatticeSup.toMax.max xTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg xTilde))) (instHDiv.1 (abs (instHSub.hSub y yTilde)) (SemilatticeSup.toMax.max yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)))) (instHSub.1 One.toOfNat1.1 (instHDiv.1 (abs (instHSub.hSub y yTilde)) (SemilatticeSup.toMax.max yTilde (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg yTilde)))))

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
