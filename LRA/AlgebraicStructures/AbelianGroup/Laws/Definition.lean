import LRA.AlgebraicStructures.AdditiveCommutativeSemigroup.Laws.Definition
import LRA.AlgebraicStructures.AdditiveGroup.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`AbelianGroupLaws` TODO

Predicate logic:

  class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R

Predicate logic (unfolded):

  class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R
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
class abbrev AbelianGroupLaws (R : Type u)
    [Add R] [Neg R] [OfNat R 0] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R, AdditiveInverseLaws R,
  AdditiveCommutativeLaws R

end LRA.AlgebraicStructures
