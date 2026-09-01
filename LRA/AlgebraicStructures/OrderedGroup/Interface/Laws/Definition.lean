import LRA.AlgebraicStructures.Group.Interface.Laws.Definition
import LRA.Order.Laws.PartialOrder.Definition
import LRA.Order.Laws.OperationCompatibility.Definition

namespace LRA.AlgebraicStructures

universe u

/--
`MultiplicativeOrderCompatibilityLaws` TODO

Predicate logic:

  class MultiplicativeOrderCompatibilityLaws (R : Type u)
    [Mul R] [LE R] : Prop where
  MulLeMulLeft :
    LRA.Order.LeftTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
  MulLeMulRight :
    LRA.Order.RightTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)

Predicate logic (unfolded):

  class MultiplicativeOrderCompatibilityLaws (R : Type u)
    [Mul R] [LE R] : Prop where
  MulLeMulLeft :
    LRA.Order.LeftTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
  MulLeMulRight :
    LRA.Order.RightTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class MultiplicativeOrderCompatibilityLaws (R : Type u)
    [Mul R] [LE R] : Prop where
  MulLeMulLeft :
    LRA.Order.LeftTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
  MulLeMulRight :
    LRA.Order.RightTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
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
class MultiplicativeOrderCompatibilityLaws (R : Type u)
    [Mul R] [LE R] : Prop where
  MulLeMulLeft :
    LRA.Order.LeftTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)
  MulLeMulRight :
    LRA.Order.RightTranslationPreservesRelation
      (fun a b : R => a <= b) (fun a b : R => a * b)

/--
`OrderedGroupLaws` TODO

Predicate logic:

  class abbrev OrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.PartialOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

Predicate logic (unfolded):

  class abbrev OrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.PartialOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
class abbrev OrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.PartialOrderLaws R,
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
class abbrev OrderedGroupLaws (R : Type u)
    [Mul R] [Inv R] [OfNat R 1] [LE R] [Nonempty R] : Prop :=
  GroupLaws R, LRA.Order.PartialOrderLaws R,
  MultiplicativeOrderCompatibilityLaws R

end LRA.AlgebraicStructures
