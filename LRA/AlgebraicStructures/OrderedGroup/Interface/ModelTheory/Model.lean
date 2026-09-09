import LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.OrderedGroup.Interface.Laws.Definition
import LRA.Operation.Multiplication.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory

open LRA.Operation.Multiplication.Interface.ModelTheory (MultiplicationModel)

universe u

/--
`OrderedGroupModel` Promoted ordered-group model packaging the multiplicative operator interface, order surface, and ordered-group law bundle.

Predicate logic:

  structure OrderedGroupModel (Carrier : Type u) where
    [mulInst : Mul Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedGroupLaws Carrier]

Predicate logic (unfolded):

  structure OrderedGroupModel (Carrier : Type u) where
    [mulInst : Mul Carrier]
    [invInst : Inv Carrier]
    [ltInst : LT Carrier]
    [leInst : LE Carrier]
    [oneInst : OfNat Carrier 1]
    [carrierNonempty : Nonempty Carrier]
    multiplication : MultiplicationModel Carrier
    [laws : LRA.AlgebraicStructures.OrderedGroupLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedGroupModel (Carrier : Type u) where
  [mulInst : Mul Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedGroupLaws Carrier]
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
structure OrderedGroupModel (Carrier : Type u) where
  [mulInst : Mul Carrier]
  [invInst : Inv Carrier]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [oneInst : OfNat Carrier 1]
  [carrierNonempty : Nonempty Carrier]
  multiplication : MultiplicationModel Carrier
  [laws : LRA.AlgebraicStructures.OrderedGroupLaws Carrier]

/--
`OrderedGroupModel.signature` The ordered-group signature induced by a promoted ordered-group model.

Predicate logic:

  def OrderedGroupModel.signature {Carrier : Type u}
      (model : OrderedGroupModel Carrier) :
      OrderedGroupSignature

Predicate logic (unfolded):

  def OrderedGroupModel.signature {Carrier : Type u}
      (model : OrderedGroupModel Carrier) :
      OrderedGroupSignature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedGroupModel.signature {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    OrderedGroupSignature
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
def OrderedGroupModel.signature {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    OrderedGroupSignature :=
  letI := model.mulInst
  letI := model.invInst
  letI := model.ltInst
  letI := model.leInst
  letI := model.oneInst
  letI := model.carrierNonempty
  { carrier := Carrier
    one := 1
    multiply := model.multiplication.realization.spec.mul
    inverse := (·⁻¹)
    StrictOrder := (· < ·)
    NonstrictOrder := (· ≤ ·) }

/--
`OrderedGroupModel.firstOrderModel` The first-order model induced by a promoted ordered-group model.

Predicate logic:

  def OrderedGroupModel.firstOrderModel {Carrier : Type u}
      (model : OrderedGroupModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.OrderedGroupFirstOrderSignature :=
    BuildOrderedGroupModel model.signature

Predicate logic (unfolded):

  def OrderedGroupModel.firstOrderModel {Carrier : Type u}
      (model : OrderedGroupModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.OrderedGroupFirstOrderSignature :=
    BuildOrderedGroupModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def OrderedGroupModel.firstOrderModel {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel model.signature
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
def OrderedGroupModel.firstOrderModel {Carrier : Type u}
    (model : OrderedGroupModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.OrderedGroup.Interface.Signature.OrderedGroupFirstOrderSignature :=
  BuildOrderedGroupModel model.signature

end LRA.AlgebraicStructures.OrderedGroup.Interface.ModelTheory
