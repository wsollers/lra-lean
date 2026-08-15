import LRA.VolumeI.Order.Constructions.StrictNonStrictCorrespondence.Definition
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition
import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/-- Strict orders induce partial orders by adjoining equality. -/
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry

/-- Partial orders induce strict orders by removing equality. -/
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry

/-- Strict linear orders induce linear orders by adjoining equality. -/
theorem StrictLinearOrderInducesLinearOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    LinearOrder (NonStrictFromStrict strictRelation) := by
  sorry

/-- Removing equality after adjoining it recovers an irreflexive relation. -/
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsIrreflexive :
      LRA.Relation.Irreflexive strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry

/-- Adjoining equality to the strict part recovers a reflexive relation. -/
theorem NonStrictStrictInverseCorrespondence
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsReflexive :
      LRA.Relation.Reflexive nonStrictRelation) :
    NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) =
      nonStrictRelation := by
  sorry

/-- Converting a poset to strict form and back recovers it. -/
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset := by
  sorry

/-- Converting a strict poset to non-strict form and back recovers it. -/
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset := by
  sorry

/-!
The relation equalities use function and propositional extensionality. The
structure equalities additionally use proof irrelevance for law fields.
-/

end LRA.Order
