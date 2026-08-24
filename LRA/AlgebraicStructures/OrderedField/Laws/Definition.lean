import LRA.AlgebraicStructures.Field.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/--
`OrderedFieldLaws` TODO

Predicate logic:

  class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

Predicate logic (unfolded):

  class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  LinearOrderLaws R,
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
class abbrev OrderedFieldLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, MultiplicativeInverseLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
