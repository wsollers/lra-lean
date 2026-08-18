import LRA.Relation.Properties

namespace LRA.Relation
universe u

/-- An equivalence relation is reflexive, symmetric, and transitive. -/
def EquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R ∧ Transitive R

/-- A partial equivalence relation (PER) is symmetric and transitive. -/
def PartialEquivalenceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Symmetric R ∧ Transitive R

/-- A tolerance relation is reflexive and symmetric. -/
def ToleranceRelation {α : Type u} (R : Endorelation α) : Prop :=
  Reflexive R ∧ Symmetric R

/-- `CompatibilityRelation` is the standard alternative name for a tolerance
relation: reflexive and symmetric, but not assumed transitive. -/
abbrev CompatibilityRelation {α : Type u} (R : Endorelation α) : Prop := ToleranceRelation R

end LRA.Relation
