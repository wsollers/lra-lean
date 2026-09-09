import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.Model
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`IntegralDomainModel` Promoted integral-domain model packaging the additive and multiplicative operator interfaces together with the integral-domain law bundle.

Predicate logic:

  structure IntegralDomainModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.IntegralDomainLaws Carrier]

Predicate logic (unfolded):

  structure IntegralDomainModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.IntegralDomainLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure IntegralDomainModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.IntegralDomainLaws Carrier]
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
structure IntegralDomainModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.IntegralDomainLaws Carrier]

/--
`IntegralDomainModel.signature` The integral-domain signature induced by a promoted model.

Predicate logic:

  def IntegralDomainModel.signature {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      IntegralDomainSignature

Predicate logic (unfolded):

  def IntegralDomainModel.signature {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      IntegralDomainSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegralDomainModel.signature {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    IntegralDomainSignature
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
def IntegralDomainModel.signature {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    IntegralDomainSignature :=
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
`IntegralDomainModel.firstOrderModel` The first-order model induced by a promoted integral-domain model.

Predicate logic:

  def IntegralDomainModel.firstOrderModel {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature :=
    BuildIntegralDomainModel model.signature

Predicate logic (unfolded):

  def IntegralDomainModel.firstOrderModel {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature :=
    BuildIntegralDomainModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegralDomainModel.firstOrderModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature :=
  BuildIntegralDomainModel model.signature
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
def IntegralDomainModel.firstOrderModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.IntegralDomain.Interface.Signature.IntegralDomainFirstOrderSignature :=
  BuildIntegralDomainModel model.signature

/--
`IntegralDomainModel.toCommutativeRingModel` Forget an integral-domain model down to its commutative-ring reduct.

Predicate logic:

  def IntegralDomainModel.toCommutativeRingModel {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingModel Carrier

Predicate logic (unfolded):

  def IntegralDomainModel.toCommutativeRingModel {Carrier : Type u}
      (model : IntegralDomainModel Carrier) :
      LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingModel Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegralDomainModel.toCommutativeRingModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingModel Carrier
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
def IntegralDomainModel.toCommutativeRingModel {Carrier : Type u}
    (model : IntegralDomainModel Carrier) :
    LRA.AlgebraicStructures.CommutativeRing.Interface.ModelTheory.CommutativeRingModel Carrier :=
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

end LRA.AlgebraicStructures.IntegralDomain.Interface.ModelTheory
