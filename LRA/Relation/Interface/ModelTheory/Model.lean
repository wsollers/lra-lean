import LRA.Relation.Interface.ModelTheory.LStructure
import LRA.ModelTheory.Model

namespace LRA.Relation.ModelTheory

open LRA.Logic

universe u

/--
`relationModel` TODO

Predicate logic:

  def relationModel (structure_ : RelationStructure.{u}) :
      ModelTheory.FirstOrder.Model RelationSignature where
    Domain := structure_.Carrier
    domainNonempty := structure_.carrierNonempty
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .rel =>
          let left : structure_.Carrier := arguments ⟨0, by decide⟩
          let right : structure_.Carrier := arguments ⟨1, by decide⟩
          structure_.relationInterpretation left right
    interpretConstant := fun constantSymbol => nomatch constantSymbol

Predicate logic (unfolded):

  def relationModel (structure_ : RelationStructure.{u}) :
      ModelTheory.FirstOrder.Model RelationSignature where
    Domain := structure_.Carrier
    domainNonempty := structure_.carrierNonempty
    interpretFunction := fun functionSymbol => Empty.elim functionSymbol
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .rel =>
          let left : structure_.Carrier := arguments ⟨0, by decide⟩
          let right : structure_.Carrier := arguments ⟨1, by decide⟩
          structure_.relationInterpretation left right
    interpretConstant := fun constantSymbol => nomatch constantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def relationModel (structure_ : RelationStructure.{u}) :
    ModelTheory.FirstOrder.Model RelationSignature where
  Domain := structure_.Carrier
  domainNonempty := structure_.carrierNonempty
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .rel =>
        let left : structure_.Carrier := arguments ⟨0, by decide⟩
        let right : structure_.Carrier := arguments ⟨1, by decide⟩
        structure_.relationInterpretation left right
  interpretConstant := fun constantSymbol => nomatch constantSymbol
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
def relationModel (structure_ : RelationStructure.{u}) :
    ModelTheory.FirstOrder.Model RelationSignature where
  Domain := structure_.Carrier
  domainNonempty := structure_.carrierNonempty
  interpretFunction := fun functionSymbol => Empty.elim functionSymbol
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .rel =>
        let left : structure_.Carrier := arguments ⟨0, by decide⟩
        let right : structure_.Carrier := arguments ⟨1, by decide⟩
        structure_.relationInterpretation left right
  interpretConstant := fun constantSymbol => nomatch constantSymbol

/--
`RelationStructure.toFirstOrderModel` TODO

Predicate logic:

  def RelationStructure.toFirstOrderModel
      (structure_ : RelationStructure.{u}) :
      ModelTheory.FirstOrder.Model RelationSignature :=
    relationModel structure_

Predicate logic (unfolded):

  def RelationStructure.toFirstOrderModel
      (structure_ : RelationStructure.{u}) :
      ModelTheory.FirstOrder.Model RelationSignature :=
    relationModel structure_ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RelationStructure.toFirstOrderModel
    (structure_ : RelationStructure.{u}) :
    ModelTheory.FirstOrder.Model RelationSignature :=
  relationModel structure_
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
def RelationStructure.toFirstOrderModel
    (structure_ : RelationStructure.{u}) :
    ModelTheory.FirstOrder.Model RelationSignature :=
  relationModel structure_

end LRA.Relation.ModelTheory
