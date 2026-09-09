import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples

/-! The open interval `(0, ∞)` under addition — `(ℝ_{>0}, +)`. Associative and
commutative (`ℝ`'s own `AddCommSemigroup` instance, via the Mathlib bridge) and
closed (sum of two positive reals is positive), but has no identity: `0 ∉
ℝ_{>0}`. Uses `ℝ`'s native `Add` directly, same as the `Nat`-based examples —
no wrapper structure needed since addition is already the operation this
subject is about. -/

/--
`PositiveReals` TODO

Predicate logic:

  ∀ (a : Real), Real.lt✝ 0 a

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.lt✝ 0 a

Logical form (Lean):

```lean
def PositiveReals : LRA.Set.LRA_Set Real := {x | 0 < x}
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
def PositiveReals : LRA.Set.LRA_Set Real := {x | 0 < x}

/--
`positiveRealsClosedUnderAddition` TODO

Predicate logic:

  ∀ (a b : Real), (a ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals ∧ b ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals) → instHAdd.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (a ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals ∧ b ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals) → { hAdd := fun a b => Real.instAdd.add a b }.hAdd a b ∈ LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples.PositiveReals

Logical form (Lean):

```lean
theorem positiveRealsClosedUnderAddition :
    ∀ a b, a ∈ PositiveReals → b ∈ PositiveReals → a + b ∈ PositiveReals
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
theorem positiveRealsClosedUnderAddition :
    ∀ a b, a ∈ PositiveReals → b ∈ PositiveReals → a + b ∈ PositiveReals := by
  sorry
noncomputable instance : Add {x // x ∈ PositiveReals} :=
  LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.ClosedSubsetAdd
    positiveRealsClosedUnderAddition

noncomputable instance : Nonempty {x // x ∈ PositiveReals} := by
  sorry

noncomputable instance :
    LRA.AlgebraicStructures.AdditiveCommutativeSemigroupLaws {x // x ∈ PositiveReals} := by
  sorry
end LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Examples
