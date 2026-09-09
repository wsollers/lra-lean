import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory.LStructure
import LRA.Operation.Addition.Interface.ModelTheory.Model
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)
open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`OrderedSemiringModel` Promoted ordered-semiring model packaging the operator interfaces, order surface, and ordered-semiring law bundle.

Predicate logic:

  structure OrderedSemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedSemiringLaws Carrier]

Predicate logic (unfolded):

  structure OrderedSemiringModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [mulInst : Mul Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [zeroInst : OfNat Carrier 0]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedSemiringLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedSemiringLaws Carrier]
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
structure OrderedSemiringModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedSemiringLaws Carrier]

/--
`OrderedSemiringModel.signature` The ordered-semiring signature induced by a promoted ordered-semiring model.

Predicate logic:

  def OrderedSemiringModel.signature {Carrier : Type u}
      (model : OrderedSemiringModel Carrier) :
      OrderedSemiringSignature

Predicate logic (unfolded):

  def OrderedSemiringModel.signature {Carrier : Type u}
      (model : OrderedSemiringModel Carrier) :
      OrderedSemiringSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedSemiringModel.signature {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    OrderedSemiringSignature
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
def OrderedSemiringModel.signature {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    OrderedSemiringSignature :=
  letI := model.addInst
  letI := model.mulInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.zeroInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    one := 1
    add := model.addition.realization.spec.add
    multiply := model.multiplication.realization.spec.mul
    le := (· ≤ ·)
    StrictOrder := (· < ·) }

/--
`OrderedSemiringModel.firstOrderModel` The first-order model induced by a promoted ordered-semiring model.

Predicate logic:

  def OrderedSemiringModel.firstOrderModel {Carrier : Type u}
      (model : OrderedSemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature :=
    BuildOrderedSemiringModel model.signature

Predicate logic (unfolded):

  def OrderedSemiringModel.firstOrderModel {Carrier : Type u}
      (model : OrderedSemiringModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature :=
    BuildOrderedSemiringModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedSemiringModel.firstOrderModel {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel model.signature
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
def OrderedSemiringModel.firstOrderModel {Carrier : Type u}
    (model : OrderedSemiringModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedSemiring.Interface.Signature.OrderedSemiringFirstOrderSignature :=
  BuildOrderedSemiringModel model.signature

end LRA.AlgebraicStructures.OrderedSemiring.Interface.ModelTheory
