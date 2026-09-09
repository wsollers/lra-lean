import LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory.LStructure
import LRA.AlgebraicStructures.AbelianGroup.Interface.Definitions.ConceptSignature
import LRA.Operation.Addition.Interface.ModelTheory.Model

namespace LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory

open LRA.Operation.Addition.Interface.ModelTheory (AdditionModel)

universe u

/--
`AbelianGroupModel` Promoted abelian-group model packaging the additive operator interface together with the abelian-group law bundle.

Predicate logic:

  structure AbelianGroupModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    [laws : LRA.AlgebraicStructures.AbelianGroupLaws Carrier]

Predicate logic (unfolded):

  structure AbelianGroupModel (Carrier : Type u) where
    [addInst : Add Carrier]
    [negInst : Neg Carrier]
    [zeroInst : OfNat Carrier 0]
    [carrierNonempty : Nonempty Carrier]
    addition : AdditionModel Carrier
    [laws : LRA.AlgebraicStructures.AbelianGroupLaws Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure AbelianGroupModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  [laws : LRA.AlgebraicStructures.AbelianGroupLaws Carrier]
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
structure AbelianGroupModel (Carrier : Type u) where
  [addInst : Add Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [carrierNonempty : Nonempty Carrier]
  addition : AdditionModel Carrier
  [laws : LRA.AlgebraicStructures.AbelianGroupLaws Carrier]

/--
`AbelianGroupModel.signature` The abelian-group concept signature induced by a promoted model.

Predicate logic:

  def AbelianGroupModel.signature {Carrier : Type u}
      (model : AbelianGroupModel Carrier) :
      LRA.AlgebraicStructures.AbelianGroupConceptSignature :=
    letI := model.addInst
    letI := model.negInst
    letI := model.zeroInst
    letI := model.carrierNonempty
    { carrier := Carrier
      zero := 0
      add := model.addition.realization.spec.add
      neg := (- ·) }

Predicate logic (unfolded):

  def AbelianGroupModel.signature {Carrier : Type u}
      (model : AbelianGroupModel Carrier) :
      LRA.AlgebraicStructures.AbelianGroupConceptSignature :=
    letI := model.addInst
    letI := model.negInst
    letI := model.zeroInst
    letI := model.carrierNonempty
    { carrier := Carrier
      zero := 0
      add := model.addition.realization.spec.add
      neg := (- ·) } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AbelianGroupModel.signature {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.AlgebraicStructures.AbelianGroupConceptSignature :=
  letI := model.addInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    add := model.addition.realization.spec.add
    neg := (- ·) }
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
def AbelianGroupModel.signature {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.AlgebraicStructures.AbelianGroupConceptSignature :=
  letI := model.addInst
  letI := model.negInst
  letI := model.zeroInst
  letI := model.carrierNonempty
  { carrier := Carrier
    zero := 0
    add := model.addition.realization.spec.add
    neg := (- ·) }

/--
`AbelianGroupModel.firstOrderModel` The first-order model induced by a promoted abelian-group model.

Predicate logic:

  def AbelianGroupModel.firstOrderModel {Carrier : Type u}
      (model : AbelianGroupModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.AbelianGroupFirstOrderSignature :=
    BuildAbelianGroupModel model.signature

Predicate logic (unfolded):

  def AbelianGroupModel.firstOrderModel {Carrier : Type u}
      (model : AbelianGroupModel Carrier) :
      LRA.ModelTheory.FirstOrder.Model
        LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.AbelianGroupFirstOrderSignature :=
    BuildAbelianGroupModel model.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def AbelianGroupModel.firstOrderModel {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel model.signature
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
def AbelianGroupModel.firstOrderModel {Carrier : Type u}
    (model : AbelianGroupModel Carrier) :
    LRA.ModelTheory.FirstOrder.Model
      LRA.AlgebraicStructures.AbelianGroup.Interface.Signature.AbelianGroupFirstOrderSignature :=
  BuildAbelianGroupModel model.signature

end LRA.AlgebraicStructures.AbelianGroup.Interface.ModelTheory
