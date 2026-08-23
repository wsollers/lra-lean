import LRA.Relation.Structures.Definition

namespace LRA.Relation
universe u

                                                                    
theorem EquivalenceImpliesPartialEquivalence {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : PartialEquivalenceRelation R := by
  sorry

                                                          
theorem EquivalenceImpliesTolerance {α : Type u} {R : Endorelation α}
    (h : EquivalenceRelation R) : ToleranceRelation R := by
  sorry

end LRA.Relation
