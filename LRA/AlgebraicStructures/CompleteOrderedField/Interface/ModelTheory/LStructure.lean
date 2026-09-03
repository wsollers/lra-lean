import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Definitions.Signature

namespace LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature

/--
`CompleteOrderedFieldSignature` TODO

Predicate logic:

  abbrev CompleteOrderedFieldSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature

Predicate logic (unfolded):

  abbrev CompleteOrderedFieldSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CompleteOrderedFieldSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev CompleteOrderedFieldSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldSignature

/--
`BuildCompleteOrderedFieldFirstOrderReduct` TODO

Predicate logic:

  def BuildCompleteOrderedFieldFirstOrderReduct
    (signature : CompleteOrderedFieldSignature) :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.BuildOrderedFieldModel signature

Predicate logic (unfolded):

  def BuildCompleteOrderedFieldFirstOrderReduct
    (signature : CompleteOrderedFieldSignature) :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.BuildOrderedFieldModel signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def BuildCompleteOrderedFieldFirstOrderReduct
    (signature : CompleteOrderedFieldSignature) :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.BuildOrderedFieldModel signature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def BuildCompleteOrderedFieldFirstOrderReduct
    (signature : CompleteOrderedFieldSignature) :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.BuildOrderedFieldModel signature

/--
`completeOrderedFieldFirstOrderReduct` TODO

Predicate logic:

  def completeOrderedFieldFirstOrderReduct (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.orderedFieldFirstOrderModel R

Predicate logic (unfolded):

  def completeOrderedFieldFirstOrderReduct (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.orderedFieldFirstOrderModel R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def completeOrderedFieldFirstOrderReduct (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.orderedFieldFirstOrderModel R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def completeOrderedFieldFirstOrderReduct (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R] :
    LRA.ModelTheory.FirstOrder.Model CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.orderedFieldFirstOrderModel R

end LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory
