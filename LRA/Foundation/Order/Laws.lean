import LRA.Foundation.Operations
import LRA.Foundation.Relations

namespace LRA.Foundation
namespace Order

universe u

def reflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.reflexive relation

def irreflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.irreflexive relation

def antisymmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.antisymmetric relation

def transitive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.transitive relation

def total {α : LRACarrier} (relation : Endorelation α) : Prop :=
  Relation.total relation

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

end Order
end LRA.Foundation
