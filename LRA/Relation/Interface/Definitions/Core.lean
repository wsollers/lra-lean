namespace LRA.Relation

universe u v

abbrev UnaryRelation (α : Type u) := α → Prop

abbrev HeterogeneousBinaryRelation (α : Type u) (β : Type v) := α → β → Prop

abbrev HomogeneousBinaryRelation (α : Type u) := HeterogeneousBinaryRelation α α

abbrev BinaryRelation (α : Type u) := HomogeneousBinaryRelation α

abbrev Endorelation (α : Type u) := HomogeneousBinaryRelation α

def RelationIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  ∀ x y, R x y → S x y

def RelationProperlyIncluded {α : Type u} (R S : Endorelation α) : Prop :=
  RelationIncluded R S ∧ R ≠ S

end LRA.Relation
