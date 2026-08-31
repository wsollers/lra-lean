import LRA.AlgebraicStructures.Semiring.Interface.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
import LRA.Order.Laws.OperationCompatibility.Definition
namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/--
`OrderedSemiringLaws` TODO

Predicate logic:

  class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  SemiringLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

Predicate logic (unfolded):

  class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  SemiringLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  SemiringLaws R,
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
class abbrev OrderedSemiringLaws (R : Type u)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  SemiringLaws R,
  LinearOrderLaws R,
  AdditionRespectsOrderLaws R, MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
