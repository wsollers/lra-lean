import LRA.Foundation.Operations
import LRA.Foundation.Relations

namespace LRA.Foundation
namespace Order

universe u

def reflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.reflexive relation

def irreflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.irreflexive relation

def symmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.symmetric relation

def antisymmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.antisymmetric relation

def asymmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.asymmetric relation

def transitive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.transitive relation

def connex {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.connex relation

def total {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.total relation

def trichotomous {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.trichotomous relation

def wellFounded {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.wellFounded relation

def equivalence {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.equivalence relation

def preorder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.preorder relation

def partialOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.partialOrder relation

def totalOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.totalOrder relation

def strictOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.strictOrder relation

def strictTotalOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.strictTotalOrder relation

def wellOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.wellOrder relation

def strictlyPreservesRightTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  ∀ ⦃first second⦄, relation first second →
    ∀ translatedBy, relation (operation first translatedBy) (operation second translatedBy)

def strictlyPreservesLeftTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  ∀ ⦃first second⦄, relation first second →
    ∀ translatedBy, relation (operation translatedBy first) (operation translatedBy second)

def preservesRightTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  strictlyPreservesRightTranslation relation operation

def preservesLeftTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  strictlyPreservesLeftTranslation relation operation

def reflectsRightTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  ∀ ⦃first second⦄,
    (∀ translatedBy, relation (operation first translatedBy) (operation second translatedBy)) →
      relation first second

def reflectsLeftTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  ∀ ⦃first second⦄,
    (∀ translatedBy, relation (operation translatedBy first) (operation translatedBy second)) →
      relation first second

def preservesAndReflectsRightTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  preservesRightTranslation relation operation ∧ reflectsRightTranslation relation operation

def preservesAndReflectsLeftTranslation
    {α : LRACarrier} (relation : Endorelation α) (operation : BinaryOperation α) : Prop :=
  preservesLeftTranslation relation operation ∧ reflectsLeftTranslation relation operation

def preservesPositiveRightMultiplication
    {α : LRACarrier}
    (strictOrder : Endorelation α)
    (mul : BinaryOperation α)
    (zero : α) : Prop :=
  ∀ ⦃first second multiplier⦄,
    strictOrder first second →
      strictOrder zero multiplier →
        strictOrder (mul first multiplier) (mul second multiplier)

def multiplicationPreservesNonnegative
    {α : LRACarrier}
    (relation : Endorelation α)
    (mul : BinaryOperation α)
    (zero : α) : Prop :=
  ∀ ⦃first second⦄,
    relation zero first →
      relation zero second →
        relation zero (mul first second)

def monotone
    {α β : LRACarrier}
    (domainRelation : Endorelation α)
    (codomainRelation : Endorelation β)
    (map : α → β) : Prop :=
  ∀ ⦃first second⦄,
    domainRelation first second →
      codomainRelation (map first) (map second)

def reflects
    {α β : LRACarrier}
    (domainRelation : Endorelation α)
    (codomainRelation : Endorelation β)
    (map : α → β) : Prop :=
  ∀ ⦃first second⦄,
    codomainRelation (map first) (map second) →
      domainRelation first second

def orderEmbedding
    {α β : LRACarrier}
    (domainRelation : Endorelation α)
    (codomainRelation : Endorelation β)
    (map : α → β) : Prop :=
  monotone domainRelation codomainRelation map ∧
    reflects domainRelation codomainRelation map

end Order
end LRA.Foundation
