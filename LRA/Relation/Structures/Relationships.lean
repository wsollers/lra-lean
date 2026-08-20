import LRA.Relation.Structures.Definition

namespace LRA.Relation
universe u

/-- Every equivalence relation is a partial equivalence relation. -/
theorem EquivalenceImpliesPartialEquivalence {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : PartialEquivalenceRelation R := by
  sorry

/-- Every equivalence relation is a tolerance relation. -/
theorem EquivalenceImpliesTolerance {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : ToleranceRelation R := by
  sorry

end LRA.Relation
