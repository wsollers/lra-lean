import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.Ring.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`CommutativeRingModel` Promoted commutative-ring model packaging the additive and multiplicative operator interfaces together with the commutative-ring law bundle.

Predicate logic:

  structure CommutativeRingModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.CommutativeRingLaws Carrier]

Predicate logic (unfolded):

  structure CommutativeRingModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.CommutativeRingLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CommutativeRingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeRingLaws Carrier]
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
structure CommutativeRingModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeRingLaws Carrier]

/--
`CommutativeRingModel.signature` The commutative-ring concept signature induced by a promoted model.

Predicate logic:

  def CommutativeRingModel.signature {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      CommutativeRingSignature

Predicate logic (unfolded):

  def CommutativeRingModel.signature {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      CommutativeRingSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CommutativeRingModel.signature {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    CommutativeRingSignature
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
def CommutativeRingModel.signature {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    CommutativeRingSignature :=
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
`CommutativeRingModel.firstOrderModel` The first-order model induced by a promoted commutative-ring model.

Predicate logic:

  def CommutativeRingModel.firstOrderModel {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.CommutativeRingFirstOrderSignature :=
    BuildCommutativeRingModel model.signature

Predicate logic (unfolded):

  def CommutativeRingModel.firstOrderModel {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.CommutativeRingFirstOrderSignature :=
    BuildCommutativeRingModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CommutativeRingModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.CommutativeRingFirstOrderSignature :=
  BuildCommutativeRingModel model.signature
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
def CommutativeRingModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeRing.Interface.Signature.CommutativeRingFirstOrderSignature :=
  BuildCommutativeRingModel model.signature

/--
`CommutativeRingModel.toRingModel` Forget a commutative-ring model down to its ring reduct.

Predicate logic:

  def CommutativeRingModel.toRingModel {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      LRA.AlgebraicStructures.Ring.Interface.ModelTheory.RingModel Carrier

Predicate logic (unfolded):

  def CommutativeRingModel.toRingModel {Carrier : Type u}
      (model : CommutativeRingModel Carrier) :
      LRA.AlgebraicStructures.Ring.Interface.ModelTheory.RingModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CommutativeRingModel.toRingModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    LRA.AlgebraicStructures.Ring.Interface.ModelTheory.RingModel Carrier
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
def CommutativeRingModel.toRingModel {Carrier : Type u}
    (model : CommutativeRingModel Carrier) :
    LRA.AlgebraicStructures.Ring.Interface.ModelTheory.RingModel Carrier :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  letI := model.laws
  { addInst := model.addInst
    mulInst := model.mulInst
    negInst := model.negInst
    zeroInst := model.zeroInst
    oneInst := model.oneInst
    carrierNonempty := model.carrierNonempty
    addition := model.addition
    multiplication := model.multiplication
    laws := inferInstance }

end LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory
