import LRA.AlgebraicStructures.Field.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Field.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Field.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`FieldModel` Promoted field model packaging the additive and multiplicative operator interfaces together with the field law bundle.

Predicate logic:

  structure FieldModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.FieldLaws Carrier]

Predicate logic (unfolded):

  structure FieldModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [invInst : Inv Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.FieldLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure FieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.FieldLaws Carrier]
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
structure FieldModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.FieldLaws Carrier]

/--
`FieldModel.signature` The field concept signature induced by a promoted model.

Predicate logic:

  def FieldModel.signature {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.AlgebraicStructures.FieldConceptSignature

Predicate logic (unfolded):

  def FieldModel.signature {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.AlgebraicStructures.FieldConceptSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FieldModel.signature {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.FieldConceptSignature
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
def FieldModel.signature {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.FieldConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul
    inv := (·⁻¹) }

/--
`FieldModel.firstOrderModel` The first-order model induced by a promoted field model.

Predicate logic:

  def FieldModel.firstOrderModel {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature :=
    BuildFieldModel model.signature

Predicate logic (unfolded):

  def FieldModel.firstOrderModel {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature :=
    BuildFieldModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FieldModel.firstOrderModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature :=
  BuildFieldModel model.signature
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
def FieldModel.firstOrderModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Field.Interface.Signature.FieldFirstOrderSignature :=
  BuildFieldModel model.signature

/--
`FieldModel.toDivisionRingModel` Forget a field model down to its division-ring reduct.

Predicate logic:

  def FieldModel.toDivisionRingModel {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.DivisionRingModel Carrier

Predicate logic (unfolded):

  def FieldModel.toDivisionRingModel {Carrier : Type u}
      (model : FieldModel Carrier) :
      LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.DivisionRingModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FieldModel.toDivisionRingModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.DivisionRingModel Carrier
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
def FieldModel.toDivisionRingModel {Carrier : Type u}
    (model : FieldModel Carrier) :
    LRA.AlgebraicStructures.DivisionRing.Interface.ModelTheory.DivisionRingModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.invInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
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

end LRA.AlgebraicStructures.Field.Interface.ModelTheory
