import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt

namespace LRA.Analysis.Completeness

/--
`RationalCutLowerAtSqrtTwo` TODO

Predicate logic:

  ∀ (a : Rat), Or (Rat.instLT.lt a 0) (Rat.instLT.lt (instHPow.hPow a 2) 2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Or (Rat.instLT.lt a 0) (Rat.instLT.lt (instHPow.1 a 2) 2)

Logical form (Lean):

```lean
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}

/--
`RationalCutUpperAtSqrtTwo` TODO

Predicate logic:

  ∀ (a : Rat), (Rat.instLE.le 0 a ∧ Rat.instLE.le 2 (instHPow.hPow a 2))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Rat.instLE.le 0 a ∧ Rat.instLE.le 2 (instHPow.1 a 2))

Logical form (Lean):

```lean
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}

/--
`RealCutLowerAtSqrtTwo` TODO

Predicate logic:

  ∀ (a : Real), Real.lt✝ a (Real.sqrt 2)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.lt✝ a (Real.sqrt 2)

Logical form (Lean):

```lean
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}
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
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}

/--
`RealCutUpperAtSqrtTwo` TODO

Predicate logic:

  ∀ (a : Real), Real.le✝ (Real.sqrt 2) a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.le✝ (Real.sqrt 2) a

Logical form (Lean):

```lean
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}
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
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}

end LRA.Analysis.Completeness
