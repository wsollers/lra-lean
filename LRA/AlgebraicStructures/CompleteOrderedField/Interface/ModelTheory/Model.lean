import LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CompleteOrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u v

/--
`CompleteOrderedFieldModel` Promoted complete-ordered-field model packaging the additive and multiplicative operator interfaces, order surface, and completeness witness together with the complete-ordered-field law bundle.

Predicate logic:

  structure CompleteOrderedFieldModel (Carrier : Type u) (SetObject : Type v) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [membershipInst : Membership Carrier SetObject]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    laws : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Carrier SetObject

Predicate logic (unfolded):

  structure CompleteOrderedFieldModel (Carrier : Type u) (SetObject : Type v) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [membershipInst : Membership Carrier SetObject]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    laws : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Carrier SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CompleteOrderedFieldModel (Carrier : Type u) (SetObject : Type v) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [membershipInst : Membership Carrier SetObject]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  laws : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Carrier SetObject
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
structure CompleteOrderedFieldModel (Carrier : Type u) (SetObject : Type v) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [membershipInst : Membership Carrier SetObject]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  laws : LRA.AlgebraicStructures.CompleteOrderedFieldLaws Carrier SetObject

/--
`CompleteOrderedFieldModel.signature` The complete-ordered-field signature induced by a promoted model.

Predicate logic:

  def CompleteOrderedFieldModel.signature {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      CompleteOrderedFieldSignature

Predicate logic (unfolded):

  def CompleteOrderedFieldModel.signature {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      CompleteOrderedFieldSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CompleteOrderedFieldModel.signature {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    CompleteOrderedFieldSignature
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
def CompleteOrderedFieldModel.signature {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    CompleteOrderedFieldSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.membershipInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul
    inv := (·⁻¹)
    le := (· ≤ ·)
    StrictOrder := (· < ·) }

/--
`CompleteOrderedFieldModel.firstOrderModel` The first-order model induced by a promoted complete-ordered-field model.

Predicate logic:

  def CompleteOrderedFieldModel.firstOrderModel
      {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.CompleteOrderedFieldFirstOrderSignature :=
    BuildCompleteOrderedFieldFirstOrderReduct model.signature

Predicate logic (unfolded):

  def CompleteOrderedFieldModel.firstOrderModel
      {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.CompleteOrderedFieldFirstOrderSignature :=
    BuildCompleteOrderedFieldFirstOrderReduct model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CompleteOrderedFieldModel.firstOrderModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.CompleteOrderedFieldFirstOrderSignature :=
  BuildCompleteOrderedFieldFirstOrderReduct model.signature
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
def CompleteOrderedFieldModel.firstOrderModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature.CompleteOrderedFieldFirstOrderSignature :=
  BuildCompleteOrderedFieldFirstOrderReduct model.signature

/--
`CompleteOrderedFieldModel.toOrderedFieldModel` Forget a complete-ordered-field model down to its ordered-field reduct.

Predicate logic:

  def CompleteOrderedFieldModel.toOrderedFieldModel
      {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldModel Carrier

Predicate logic (unfolded):

  def CompleteOrderedFieldModel.toOrderedFieldModel
      {Carrier : Type u} {SetObject : Type v}
      (model : CompleteOrderedFieldModel Carrier SetObject) :
      LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CompleteOrderedFieldModel.toOrderedFieldModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldModel Carrier
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
def CompleteOrderedFieldModel.toOrderedFieldModel
    {Carrier : Type u} {SetObject : Type v}
    (model : CompleteOrderedFieldModel Carrier SetObject) :
    LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.OrderedFieldModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI : LRA.AlgebraicStructures.OrderedFieldLaws Carrier := model.laws.1
  letI : LRA.AlgebraicStructures.OrderedFieldLaws Carrier := inferInstance
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    invInst := model.invInst
    ltInst := model.ltInst
    leInst := model.leInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.CompleteOrderedField.Interface.ModelTheory
