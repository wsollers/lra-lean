import LRA.AlgebraicStructures.OrderedRing.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition
namespace LRA.AlgebraicStructures

universe u

/--
`LinearlyOrderedRingLaws` TODO

Predicate logic:

  class abbrev LinearlyOrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  RingLaws R, LRA.Order.LinearOrderLaws R,
  LRA.Order.AdditionRespectsOrderLaws R,
  LRA.Order.MultiplicationRespectsOrderLaws R

Predicate logic (unfolded):

  class abbrev LinearlyOrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  RingLaws R, LRA.Order.LinearOrderLaws R,
  LRA.Order.AdditionRespectsOrderLaws R,
  LRA.Order.MultiplicationRespectsOrderLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev LinearlyOrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  RingLaws R, LRA.Order.LinearOrderLaws R,
  LRA.Order.AdditionRespectsOrderLaws R,
  LRA.Order.MultiplicationRespectsOrderLaws R
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
class abbrev LinearlyOrderedRingLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LE R] : Prop :=
  RingLaws R, LRA.Order.LinearOrderLaws R,
  LRA.Order.AdditionRespectsOrderLaws R,
  LRA.Order.MultiplicationRespectsOrderLaws R

end LRA.AlgebraicStructures
