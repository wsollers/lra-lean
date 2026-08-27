import LRA.AlgebraicStructures.OrderedField.Laws.Definition
import LRA.Order.Bounds.LeastUpperBoundProperty.CompletenessLaws
namespace LRA.AlgebraicStructures

open LRA.Order

universe u v

/--
`CompleteOrderedFieldLaws` TODO

Predicate logic:

  ∀ (R : Type u) (SetObject : Type v) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R 0] [inst_5 : OfNat R 1] [inst_6 : LE R] [inst_7 : Membership R SetObject] [inst_8 : Nonempty R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ LRA.Order.OrderCompletenessLaws R SetObject)

Predicate logic (unfolded):

  ∀ (R : Type u) (SetObject : Type v) [inst : Add R] [inst_1 : Mul R] [inst_2 : Neg R] [inst_3 : Inv R] [inst_4 : OfNat R (instOfNatNat 0).1] [inst_5 : OfNat R (instOfNatNat 1).1] [inst_6 : LE R] [inst_7 : Membership R SetObject] [inst_8 : Nonempty R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ LRA.Order.OrderCompletenessLaws R SetObject)

Logical form (Lean):

```lean
abbrev CompleteOrderedFieldLaws
    (R : Type u) (SetObject : Type v)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [Membership R SetObject] [Nonempty R] : Prop :=
  OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
abbrev CompleteOrderedFieldLaws
    (R : Type u) (SetObject : Type v)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
    [Membership R SetObject] [Nonempty R] : Prop :=
  OrderedFieldLaws R ∧ OrderCompletenessLaws R SetObject

end LRA.AlgebraicStructures
