import LRA.Relation.Properties

namespace LRA.Relation
universe u

                                                                       
def EquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R ∧ Transitive R

                                                                        
def PartialEquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Symmetric R ∧ Transitive R

                                                       
def ToleranceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R

                                                                            
                                                                 
abbrev CompatibilityRelation {α : Type u} (R : Endorelation α) : Prop := ToleranceRelation R

end LRA.Relation
