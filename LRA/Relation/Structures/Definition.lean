import LRA.Relation.Properties

namespace LRA.Relation
universe u

/-- An equivalence relation is reflexive, symmetric, and transitive. -/
def EquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R ∧ Transitive R

/-- Legacy short name for `EquivalenceRelation`. -/
abbrev Equivalence {α : Type u} (R : Endorelation α) : Prop := EquivalenceRelation R

/-- A partial equivalence relation (PER) is symmetric and transitive. -/
def PartialEquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Symmetric R ∧ Transitive R

/-- A tolerance relation is reflexive and symmetric. -/
def ToleranceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R

/-- Compatibility relation is a standard synonym for tolerance relation. -/
abbrev CompatibilityRelation {α : Type u} (R : Endorelation α) : Prop := ToleranceRelation R

end LRA.Relation
