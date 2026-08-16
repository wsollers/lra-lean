import LRA.VolumeI.Relations.Equivalence.EquivalenceRelation

namespace LRA.Relation

/-!
Consequences projected from the equivalence-relation contract.
-/

universe u

/-- An equivalence relation is reflexive. -/
theorem EquivalenceRelation.reflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Reflexive relation :=
  equivalence.1

/-- An equivalence relation is symmetric. -/
theorem EquivalenceRelation.symmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Symmetric relation :=
  equivalence.2.1

/-- An equivalence relation is transitive. -/
theorem EquivalenceRelation.transitive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Transitive relation :=
  equivalence.2.2

end LRA.Relation
