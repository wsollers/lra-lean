/-!
TeX-facing relation and abstract order predicates for Volume II.

This file models the formal environments in
`arithmetic-operations-relations/notes/order-relations`.
-/

namespace LRA
namespace VolumeII
namespace Foundations
namespace OrderRelations

universe u

/-- TeX label: `def:reflexive-relation`. -/
def ReflexiveRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ element : Carrier, relation element element

/-- TeX label: `def:irreflexive-relation`. -/
def IrreflexiveRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ element : Carrier, ¬ relation element element

/-- TeX label: `def:symmetric-relation`. -/
def SymmetricRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ left right : Carrier, relation left right -> relation right left

/-- TeX label: `def:antisymmetric-relation`. -/
def AntisymmetricRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop) : Prop :=
  ∀ left right : Carrier, relation left right -> relation right left -> left = right

/-- TeX label: `def:asymmetric-relation`. -/
def AsymmetricRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ left right : Carrier, relation left right -> ¬ relation right left

/-- TeX label: `def:transitive-relation`. -/
def TransitiveRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ first second third : Carrier,
    relation first second -> relation second third -> relation first third

/-- TeX label: `def:total-relation`. -/
def TotalRelation {Carrier : Type u} (relation : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ left right : Carrier, relation left right ∨ relation right left

/-- Exactly one of three propositions holds. -/
def ExactlyOneOfThree (first second third : Prop) : Prop :=
  (first ∧ ¬ second ∧ ¬ third) ∨
    (second ∧ ¬ first ∧ ¬ third) ∨
      (third ∧ ¬ first ∧ ¬ second)

/-- TeX label: `def:trichotomy`. -/
def Trichotomy {Carrier : Type u} (strictOrder : Carrier -> Carrier -> Prop) :
    Prop :=
  ∀ left right : Carrier,
    ExactlyOneOfThree (strictOrder left right) (left = right) (strictOrder right left)

end OrderRelations
end Foundations
end VolumeII
end LRA
