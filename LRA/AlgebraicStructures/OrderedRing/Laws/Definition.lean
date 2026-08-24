import LRA.AlgebraicStructures.Ring.Laws.Definition
import LRA.Order.Laws.PartialOrder.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/--
`OrderedRingLaws` TODO

Predicate logic:

  class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  LRA.Order.PartialOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

Predicate logic (unfolded):

  class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  LRA.Order.PartialOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  LRA.Order.PartialOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R
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
class abbrev OrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  LRA.Order.PartialOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
