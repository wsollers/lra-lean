import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Magma.Interface.Laws.Definition
import LRA.AlgebraicStructures.Magma.Constructions.Set.ClosedSubset

namespace LRA.AlgebraicStructures.Magma.Examples

/-! Nonzero reals under division — exercises the generic closed-subset builder:
division isn't total on all of `ℝ` (division by zero), but it is closed on `ℝ \ {0}`,
and that closure is the nontrivial fact this example is actually about. -/

/--
`RealsUnderDivision` TODO

Predicate logic:

  structure RealsUnderDivision where
    val : ℝ

Predicate logic (unfolded):

  structure RealsUnderDivision where
    val : ℝ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RealsUnderDivision where
  val : ℝ
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
structure RealsUnderDivision where
  val : ℝ

noncomputable instance : Mul RealsUnderDivision := ⟨fun a b => ⟨a.val / b.val⟩⟩

/--
`NonzeroReals` TODO

Predicate logic:

  ∀ (a : LRA.AlgebraicStructures.Magma.Examples.RealsUnderDivision), a.val = 0 → False

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    a.1 = 0 → False

Logical form (Lean):

```lean
def NonzeroReals : LRA.Set.LRA_Set RealsUnderDivision := {x | x.val ≠ 0}
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
def NonzeroReals : LRA.Set.LRA_Set RealsUnderDivision := {x | x.val ≠ 0}

/--
`nonzeroRealsClosedUnderDivision` TODO

Predicate logic:

  ∀ (a b : LRA.AlgebraicStructures.Magma.Examples.RealsUnderDivision), (a ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals ∧ b ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals) → instHMul.hMul a b ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals ∧ b ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals) → { hMul := fun a b => LRA.AlgebraicStructures.Magma.Examples.instMulRealsUnderDivision.mul a b }.hMul a b ∈ LRA.AlgebraicStructures.Magma.Examples.NonzeroReals

Logical form (Lean):

```lean
theorem nonzeroRealsClosedUnderDivision :
    ∀ a b, a ∈ NonzeroReals → b ∈ NonzeroReals → a * b ∈ NonzeroReals
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
theorem nonzeroRealsClosedUnderDivision :
    ∀ a b, a ∈ NonzeroReals → b ∈ NonzeroReals → a * b ∈ NonzeroReals := by
  sorry
noncomputable instance : Mul {x // x ∈ NonzeroReals} :=
  Magma.Constructions.ClosedSubsetMul nonzeroRealsClosedUnderDivision

noncomputable instance : Nonempty {x // x ∈ NonzeroReals} :=
  ⟨(⟨1⟩ : RealsUnderDivision), one_ne_zero⟩

noncomputable instance : MagmaLaws {x // x ∈ NonzeroReals} := by
  sorry
end LRA.AlgebraicStructures.Magma.Examples
