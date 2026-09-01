import LRA.AlgebraicStructures.OrderedGroup.Interface.Laws.Definition
import LRA.Order.Laws.LinearOrder.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`LinearlyOrderedGroupLaws` TODO

Predicate logic:

  class abbrev LinearlyOrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.LinearOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

Predicate logic (unfolded):

  class abbrev LinearlyOrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.LinearOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev LinearlyOrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.LinearOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R
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
class abbrev LinearlyOrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.LinearOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

end LRA.AlgebraicStructures
