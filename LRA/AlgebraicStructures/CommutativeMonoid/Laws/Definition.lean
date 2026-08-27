import LRA.AlgebraicStructures.CommutativeSemigroup.Interface.Laws.Definition
import LRA.AlgebraicStructures.Monoid.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`CommutativeMonoidLaws` TODO

Predicate logic:

  class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R

Predicate logic (unfolded):

  class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R
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
class abbrev CommutativeMonoidLaws (R : Type u) [Mul R] [OfNat R 1] [Nonempty R] : Prop :=
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R

end LRA.AlgebraicStructures
