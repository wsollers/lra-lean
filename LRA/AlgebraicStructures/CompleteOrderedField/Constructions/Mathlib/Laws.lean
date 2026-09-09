import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.OrderedField.Constructions.Mathlib.Laws
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

universe u

/--
`ofConditionallyCompleteLinearOrder` TODO

Predicate logic:

  ∀ {R : Type u} [inst : Field R] [inst_1 : ConditionallyCompleteLinearOrder R], IsStrictOrderedRing R → ∀ [inst_2 : Nonempty R], LRA.AlgebraicStructures.CompleteOrderedFieldLaws R (Set R)

Predicate logic (unfolded):

  Ambient
    (R)
  Objects
    (none)
  Prove
    IsStrictOrderedRing R → ∀ [inst_2 : Nonempty R], (LRA.AlgebraicStructures.OrderedFieldLaws R ∧ (LRA.Order.OrderCompletenessLaws R (R → Prop)))

Logical form (Lean):

```lean
theorem ofConditionallyCompleteLinearOrder {R : Type u} [_root_.Field R]
    [_root_.ConditionallyCompleteLinearOrder R]
    [_root_.IsStrictOrderedRing R] [Nonempty R] :
    CompleteOrderedFieldLaws R (Set R)
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
theorem ofConditionallyCompleteLinearOrder {R : Type u} [_root_.Field R]
    [_root_.ConditionallyCompleteLinearOrder R]
    [_root_.IsStrictOrderedRing R] [Nonempty R] :
    CompleteOrderedFieldLaws R (Set R) := by
  sorry
end LRA.AlgebraicStructures
