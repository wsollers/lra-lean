import LRA.Relation.Interface.Satisfy_Generic
import LRA.Relation.Interface.Laws
import LRA.Relation.Interface.ModelTheory

namespace LRA.Relation

universe u v

def genericTheory
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    (relation : RelationObject) : Prop :=
  LRA.Relation.ModelTheory.RelationTheory (interpret relation)

def toModelTheoryStructure
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.Relation.ModelTheory.RelationStructure where
  Carrier := Carrier
  carrierNonempty := inferInstance
  relationInterpretation := interpret relation

def toFirstOrderModel
    {RelationObject : Type v} {Carrier : Type u}
    [GenericSemantics RelationObject Carrier]
    [Nonempty Carrier]
    (relation : RelationObject) :
    LRA.Logic.FirstOrder.Model
      LRA.Relation.ModelTheory.RelationSignature :=
  LRA.Relation.ModelTheory.relationModel (toModelTheoryStructure relation)

theorem satisfiesModelTheory
    {Carrier : Type u}
    (relation : Endorelation Carrier)
    (reflexive : LRA.Relation.Reflexive relation)
    (symmetric : LRA.Relation.Symmetric relation)
    (transitive : LRA.Relation.Transitive relation) :
    LRA.Relation.ModelTheory.RelationTheory relation where
  reflexive := reflexive
  symmetric := symmetric
  transitive := transitive
end LRA.Relation
