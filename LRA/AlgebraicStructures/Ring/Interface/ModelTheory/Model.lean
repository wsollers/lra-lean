import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Ring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`RingModel` Promoted ring model packaging the additive and multiplicative operator interfaces together with the ring law bundle.

Predicate logic:

  structure RingModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.RingLaws Carrier]

Predicate logic (unfolded):

  structure RingModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.RingLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.RingLaws Carrier]
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
structure RingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.RingLaws Carrier]

/--
`RingModel.signature` The ring concept signature induced by a promoted ring model.

Predicate logic:

  def RingModel.signature {Carrier : Type u}
      (model : RingModel Carrier) :
      LRA.AlgebraicStructures.RingConceptSignature

Predicate logic (unfolded):

  def RingModel.signature {Carrier : Type u}
      (model : RingModel Carrier) :
      LRA.AlgebraicStructures.RingConceptSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RingModel.signature {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.AlgebraicStructures.RingConceptSignature
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
def RingModel.signature {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.AlgebraicStructures.RingConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    neg := (- ·)
    multiply := model.multiplication.realization.spec.mul }

/--
`RingModel.firstOrderModel` The first-order model induced by a promoted ring model.

Predicate logic:

  def RingModel.firstOrderModel {Carrier : Type u}
      (model : RingModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature :=
    BuildRingModel model.signature

Predicate logic (unfolded):

  def RingModel.firstOrderModel {Carrier : Type u}
      (model : RingModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature :=
    BuildRingModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RingModel.firstOrderModel {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature :=
  BuildRingModel model.signature
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
def RingModel.firstOrderModel {Carrier : Type u}
    (model : RingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Ring.Interface.Signature.RingFirstOrderSignature :=
  BuildRingModel model.signature

end LRA.AlgebraicStructures.Ring.Interface.ModelTheory
