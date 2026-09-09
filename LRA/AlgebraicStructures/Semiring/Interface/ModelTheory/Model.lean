import LRA.AlgebraicStructures.Semiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Semiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.Semiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`SemiringModel` Promoted semiring model packaging the additive and multiplicative operator interfaces together with the semiring law bundle.

Predicate logic:

  structure SemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.SemiringLaws Carrier]

Predicate logic (unfolded):

  structure SemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.SemiringLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure SemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.SemiringLaws Carrier]
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
structure SemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.SemiringLaws Carrier]

/--
`SemiringModel.signature` The semiring concept signature induced by a promoted semiring model.

Predicate logic:

  def SemiringModel.signature {Carrier : Type u}
      (model : SemiringModel Carrier) :
      LRA.AlgebraicStructures.SemiringConceptSignature :=
    letI := model.addInst
    letI := model.mulInst
    letI := model.zeroInst
    letI := model.oneInst
    letI := model.carrierNonempty
    { carrier := Carrier
      zero := 0
      one := 1
      add := model.addition.realization.spec.add
      multiply := model.multiplication.realization.spec.mul }

Predicate logic (unfolded):

  def SemiringModel.signature {Carrier : Type u}
      (model : SemiringModel Carrier) :
      LRA.AlgebraicStructures.SemiringConceptSignature :=
    letI := model.addInst
    letI := model.mulInst
    letI := model.zeroInst
    letI := model.oneInst
    letI := model.carrierNonempty
    { carrier := Carrier
      zero := 0
      one := 1
      add := model.addition.realization.spec.add
      multiply := model.multiplication.realization.spec.mul } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemiringModel.signature {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.AlgebraicStructures.SemiringConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    multiply := model.multiplication.realization.spec.mul }
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
def SemiringModel.signature {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.AlgebraicStructures.SemiringConceptSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    multiply := model.multiplication.realization.spec.mul }

/--
`SemiringModel.firstOrderModel` The first-order model induced by a promoted semiring model.

Predicate logic:

  def SemiringModel.firstOrderModel {Carrier : Type u}
      (model : SemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature :=
    BuildSemiringModel model.signature

Predicate logic (unfolded):

  def SemiringModel.firstOrderModel {Carrier : Type u}
      (model : SemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature :=
    BuildSemiringModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SemiringModel.firstOrderModel {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature :=
  BuildSemiringModel model.signature
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
def SemiringModel.firstOrderModel {Carrier : Type u}
    (model : SemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.Semiring.Interface.Signature.SemiringFirstOrderSignature :=
  BuildSemiringModel model.signature

end LRA.AlgebraicStructures.Semiring.Interface.ModelTheory
