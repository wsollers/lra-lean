import LRA.Relation.Structures.Definition

namespace LRA.Relation
universe u

/-- Every equivalence relation is a partial equivalence relation. -/
theorem EquivalenceImpliesPartialEquivalence {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : PartialEquivalenceRelation R := ⟨h.2.1, h.2.2⟩

/-- Every equivalence relation is a tolerance relation. -/
theorem EquivalenceImpliesTolerance {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : ToleranceRelation R := ⟨h.1, h.2.1⟩

end LRA.Relation
