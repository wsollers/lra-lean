import LRA.Foundation.Products

namespace LRA.Foundation

universe u v w

/--
A relation represented as a set of ordered pairs.
-/
abbrev RelationSet (α β : LRACarrier) := LRASet (Product α β)

/--
A heterogeneous binary relation represented as a curried predicate.
-/
abbrev BinaryRelation (α β : LRACarrier) := α → β → Prop

/--
A binary relation whose two inputs come from the same carrier.
-/
abbrev Endorelation (α : LRACarrier) := BinaryRelation α α

namespace Relation

def toSet {α β : LRACarrier} (relation : BinaryRelation α β) : RelationSet α β :=
  fun pair => relation pair.1 pair.2

def fromSet {α β : LRACarrier} (relationSet : RelationSet α β) : BinaryRelation α β :=
  fun left right => LRASet.member (left, right) relationSet

def domain {α β : LRACarrier} (relation : BinaryRelation α β) : LRASet α :=
  fun left => ∃ right, relation left right

def range {α β : LRACarrier} (relation : BinaryRelation α β) : LRASet β :=
  fun right => ∃ left, relation left right

def inverse {α β : LRACarrier} (relation : BinaryRelation α β) : BinaryRelation β α :=
  fun right left => relation left right

def compose {α β γ : LRACarrier}
    (right : BinaryRelation β γ) (left : BinaryRelation α β) :
    BinaryRelation α γ :=
  fun first third => ∃ middle, left first middle ∧ right middle third

def reflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ element, relation element element

def irreflexive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ element, ¬ relation element element

def symmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ first second, relation first second → relation second first

def antisymmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ first second, relation first second → relation second first → first = second

def asymmetric {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ first second, relation first second → ¬ relation second first

def transitive {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ first second third,
    relation first second → relation second third → relation first third

def total {α : LRACarrier} (relation : Endorelation α) : Prop :=
  ∀ first second, relation first second ∨ relation second first

def equivalence {α : LRACarrier} (relation : Endorelation α) : Prop :=
  reflexive relation ∧ symmetric relation ∧ transitive relation

def preorder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  reflexive relation ∧ transitive relation

def partialOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  preorder relation ∧ antisymmetric relation

def totalOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  partialOrder relation ∧ total relation

def strictOrder {α : LRACarrier} (relation : Endorelation α) : Prop :=
  irreflexive relation ∧ transitive relation

theorem asymmetric_is_irreflexive {α : LRACarrier} {relation : Endorelation α}
    (relationIsAsymmetric : asymmetric relation) :
    irreflexive relation :=
  fun element selfRelated => relationIsAsymmetric element element selfRelated selfRelated

theorem equality_is_reflexive {α : LRACarrier} :
    reflexive (@Eq α) :=
  fun _ => rfl

theorem equality_is_symmetric {α : LRACarrier} :
    symmetric (@Eq α) :=
  fun _ _ equality => equality.symm

theorem equality_is_transitive {α : LRACarrier} :
    transitive (@Eq α) :=
  fun _ _ _ firstEquality secondEquality => firstEquality.trans secondEquality

theorem equality_is_equivalence {α : LRACarrier} :
    equivalence (@Eq α) :=
  ⟨equality_is_reflexive, equality_is_symmetric, equality_is_transitive⟩

end Relation

end LRA.Foundation
