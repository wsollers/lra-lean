import Mathlib.Algebra.Order.Group.Defs
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.CommutativeSemigroup.Examples

/-! Min and Max on `ℝ` — both total (no closure side-condition needed, unlike
the other examples in this file: `min`/`max` are already defined everywhere on
a linear order), associative, and commutative. Wrapped in one-field structures
since `ℝ` already carries its own `Mul` (ordinary multiplication), distinct from
either of these. -/

/--
`RealsUnderMin` TODO

Predicate logic:

  structure RealsUnderMin where
    val : Real

Predicate logic (unfolded):

  structure RealsUnderMin where
    val : Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RealsUnderMin where
  val : Real
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
structure RealsUnderMin where
  val : Real

instance : Mul RealsUnderMin := ⟨fun a b => ⟨min a.val b.val⟩⟩
instance : Nonempty RealsUnderMin := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.CommutativeSemigroupLaws RealsUnderMin where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
/--
`RealsUnderMax` TODO

Predicate logic:

  structure RealsUnderMax where
    val : Real

Predicate logic (unfolded):

  structure RealsUnderMax where
    val : Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RealsUnderMax where
  val : Real
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
structure RealsUnderMax where
  val : Real

instance : Mul RealsUnderMax := ⟨fun a b => ⟨max a.val b.val⟩⟩
instance : Nonempty RealsUnderMax := ⟨⟨0⟩⟩

instance : LRA.AlgebraicStructures.CommutativeSemigroupLaws RealsUnderMax where
  MulAssociative := by
    intro a b c
    sorry
  MulCommutative := by
    intro a b
    sorry
end LRA.AlgebraicStructures.CommutativeSemigroup.Examples
