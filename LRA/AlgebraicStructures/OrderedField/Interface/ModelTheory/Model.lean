import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.OrderedField.Interface.Laws.Definition
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`OrderedFieldModel` Promoted ordered-field model packaging the additive and multiplicative operator interfaces, order surface, and ordered-field law bundle.

Predicate logic:

  structure OrderedFieldModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedFieldLaws Carrier]

Predicate logic (unfolded):

  structure OrderedFieldModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedFieldLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedFieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedFieldLaws Carrier]
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
structure OrderedFieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedFieldLaws Carrier]

/--
`OrderedFieldModel.signature` The ordered-field signature induced by a promoted ordered-field model.

Predicate logic:

  def OrderedFieldModel.signature {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      OrderedFieldSignature

Predicate logic (unfolded):

  def OrderedFieldModel.signature {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      OrderedFieldSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldModel.signature {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    OrderedFieldSignature
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
def OrderedFieldModel.signature {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    OrderedFieldSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
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
`OrderedFieldModel.firstOrderModel` The first-order model induced by a promoted ordered-field model.

Predicate logic:

  def OrderedFieldModel.firstOrderModel {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature :=
    BuildOrderedFieldModel model.signature

Predicate logic (unfolded):

  def OrderedFieldModel.firstOrderModel {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature :=
    BuildOrderedFieldModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldModel.firstOrderModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel model.signature
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
def OrderedFieldModel.firstOrderModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel model.signature

/--
`OrderedFieldModel.toFieldModel` Forget an ordered-field model down to its field reduct.

Predicate logic:

  def OrderedFieldModel.toFieldModel {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      LRA.AlgebraicStructures.Field.Interface.ModelTheory.FieldModel Carrier

Predicate logic (unfolded):

  def OrderedFieldModel.toFieldModel {Carrier : Type u}
      (model : OrderedFieldModel Carrier) :
      LRA.AlgebraicStructures.Field.Interface.ModelTheory.FieldModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedFieldModel.toFieldModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.AlgebraicStructures.Field.Interface.ModelTheory.FieldModel Carrier
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
def OrderedFieldModel.toFieldModel {Carrier : Type u}
    (model : OrderedFieldModel Carrier) :
    LRA.AlgebraicStructures.Field.Interface.ModelTheory.FieldModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
  letI : LRA.AlgebraicStructures.FieldLaws Carrier := inferInstance
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    invInst := model.invInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
