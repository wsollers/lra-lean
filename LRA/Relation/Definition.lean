namespace LRA.Relation

universe u v

/-- A unary relation, or predicate, on one carrier. -/
abbrev UnaryRelation (α : Type u) := α → Prop

/-- A heterogeneous binary relation from `α` to `β`. -/
abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop

/-- A homogeneous binary relation on one carrier. -/
abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α

/-- Common short name for a homogeneous binary relation. -/
abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α

/-- Canonical short name for a binary relation on one carrier. -/
abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α

/-- Every pair related by `R` is related by `S`. -/
def RelationIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  ∀ x y, R x y → S x y

/-- Proper inclusion of endorelations. -/
def RelationProperlyIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  RelationIncluded R S ∧ R ≠ S

end LRA.Relation
