import LRA.Relation.Interface.ModelTheory.LStructure
import LRA.Logic.Model.Model

namespace LRA.Relation.ModelTheory

open LRA.Logic

universe u

def relationModel (structure_ : RelationStructure.{u}) :
    FirstOrder.Model RelationSignature where
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

def RelationStructure.toFirstOrderModel
    (structure_ : RelationStructure.{u}) :
    FirstOrder.Model RelationSignature :=
  relationModel structure_

end LRA.Relation.ModelTheory
