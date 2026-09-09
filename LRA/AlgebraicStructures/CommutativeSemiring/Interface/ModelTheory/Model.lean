import LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`CommutativeSemiringModel` Promoted commutative-semiring model packaging the operator interfaces together with the commutative-semiring law bundle.

Predicate logic:

  structure CommutativeSemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.CommutativeSemiringLaws Carrier]

Predicate logic (unfolded):

  structure CommutativeSemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.CommutativeSemiringLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CommutativeSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeSemiringLaws Carrier]
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
structure CommutativeSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.CommutativeSemiringLaws Carrier]

/--
`CommutativeSemiringModel.signature` The commutative-semiring concept signature induced by a promoted model.

Predicate logic:

  def CommutativeSemiringModel.signature {Carrier : Type u}
      (model : CommutativeSemiringModel Carrier) :
      LRA.AlgebraicStructures.CommutativeSemiringConceptSignature :=
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

  def CommutativeSemiringModel.signature {Carrier : Type u}
      (model : CommutativeSemiringModel Carrier) :
      LRA.AlgebraicStructures.CommutativeSemiringConceptSignature :=
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
def CommutativeSemiringModel.signature {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.AlgebraicStructures.CommutativeSemiringConceptSignature :=
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
def CommutativeSemiringModel.signature {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.AlgebraicStructures.CommutativeSemiringConceptSignature :=
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
`CommutativeSemiringModel.firstOrderModel` The first-order model induced by a promoted commutative-semiring model.

Predicate logic:

  def CommutativeSemiringModel.firstOrderModel {Carrier : Type u}
      (model : CommutativeSemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature :=
    BuildCommutativeSemiringModel model.signature

Predicate logic (unfolded):

  def CommutativeSemiringModel.firstOrderModel {Carrier : Type u}
      (model : CommutativeSemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature :=
    BuildCommutativeSemiringModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def CommutativeSemiringModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature :=
  BuildCommutativeSemiringModel model.signature
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
def CommutativeSemiringModel.firstOrderModel {Carrier : Type u}
    (model : CommutativeSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.CommutativeSemiring.Interface.Signature.CommutativeSemiringFirstOrderSignature :=
  BuildCommutativeSemiringModel model.signature

end LRA.AlgebraicStructures.CommutativeSemiring.Interface.ModelTheory
