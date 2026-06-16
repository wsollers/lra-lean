import LRA.VolumeI.Foundations.Tuple
import LRA.VolumeI.Sets.SetDefinitions

namespace LRA.VolumeI.Sets.Relations

open LRA.VolumeI.Foundations
open LRA.VolumeI.Sets

abbrev Relation (α : Type) (n : Nat) : Type := Set (Tuple α n)

abbrev BinaryRelation (α : Type) : Type := Relation α 2

def BinaryRelationHolds {α : Type}
    (relation : BinaryRelation α) (first second : α) : Prop :=
  memberOf (pair first second) relation

def RelationIsReflexive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ element : α, BinaryRelationHolds relation element element

def RelationIsIrreflexive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ element : α, ¬ BinaryRelationHolds relation element element

def RelationIsSymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second first

def RelationIsAntisymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second first →
    first = second

def RelationIsAsymmetric {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second →
    ¬ BinaryRelationHolds relation second first

def RelationIsTransitive {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second third : α,
    BinaryRelationHolds relation first second →
    BinaryRelationHolds relation second third →
    BinaryRelationHolds relation first third

def RelationIsTotal {α : Type} (relation : BinaryRelation α) : Prop :=
  ∀ first second : α,
    BinaryRelationHolds relation first second ∨
    BinaryRelationHolds relation second first

def RelationIsEquivalence {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧
    RelationIsSymmetric relation ∧
    RelationIsTransitive relation

def RelationIsPreorder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧ RelationIsTransitive relation

def RelationIsPartialOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsReflexive relation ∧
    RelationIsAntisymmetric relation ∧
    RelationIsTransitive relation

def RelationIsTotalOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsPartialOrder relation ∧ RelationIsTotal relation

def RelationIsStrictOrder {α : Type} (relation : BinaryRelation α) : Prop :=
  RelationIsIrreflexive relation ∧ RelationIsTransitive relation

def EqualityRelation {α : Type} : BinaryRelation α :=
  fun tuple => tuple i₀ = tuple i₁

theorem EqualityRelationHoldsIffEqual {α : Type} (first second : α) :
    BinaryRelationHolds (@EqualityRelation α) first second ↔ first = second :=
  Iff.rfl

theorem EqualityRelationIsReflexive {α : Type} :
    RelationIsReflexive (@EqualityRelation α) :=
  fun element => (EqualityRelationHoldsIffEqual element element).mpr rfl

theorem EqualityRelationIsSymmetric {α : Type} :
    RelationIsSymmetric (@EqualityRelation α) :=
  fun first second holds =>
    (EqualityRelationHoldsIffEqual second first).mpr
      ((EqualityRelationHoldsIffEqual first second).mp holds).symm

theorem EqualityRelationIsTransitive {α : Type} :
    RelationIsTransitive (@EqualityRelation α) :=
  fun first second third firstHolds secondHolds =>
    (EqualityRelationHoldsIffEqual first third).mpr
      (((EqualityRelationHoldsIffEqual first second).mp firstHolds).trans
       ((EqualityRelationHoldsIffEqual second third).mp secondHolds))

theorem EqualityRelationIsEquivalence {α : Type} :
    RelationIsEquivalence (@EqualityRelation α) :=
  ⟨EqualityRelationIsReflexive,
   EqualityRelationIsSymmetric,
   EqualityRelationIsTransitive⟩

def SubsetRelation {α : Type} : BinaryRelation (Set α) :=
  fun tuple => ∀ x, memberOf x (tuple i₀) → memberOf x (tuple i₁)

theorem SubsetRelationHoldsIffContained {α : Type} (firstSet secondSet : Set α) :
    BinaryRelationHolds (@SubsetRelation α) firstSet secondSet ↔
      (∀ x, memberOf x firstSet → memberOf x secondSet) :=
  Iff.rfl

theorem SubsetRelationIsReflexive {α : Type} :
    RelationIsReflexive (@SubsetRelation α) :=
  fun aSet =>
    (SubsetRelationHoldsIffContained aSet aSet).mpr (fun _ membership => membership)

theorem SubsetRelationIsTransitive {α : Type} :
    RelationIsTransitive (@SubsetRelation α) :=
  fun firstSet secondSet thirdSet firstContained secondContained =>
    (SubsetRelationHoldsIffContained firstSet thirdSet).mpr
      (fun x membership =>
        (SubsetRelationHoldsIffContained secondSet thirdSet).mp secondContained x
          ((SubsetRelationHoldsIffContained firstSet secondSet).mp firstContained x
            membership))

theorem SubsetRelationIsAntisymmetric {α : Type} :
    RelationIsAntisymmetric (@SubsetRelation α) :=
  fun firstSet secondSet forwardContained backwardContained =>
    axiom_set_extension firstSet secondSet
      (fun x =>
        ⟨(SubsetRelationHoldsIffContained firstSet secondSet).mp forwardContained x,
         (SubsetRelationHoldsIffContained secondSet firstSet).mp backwardContained x⟩)

theorem SubsetRelationIsPartialOrder {α : Type} :
    RelationIsPartialOrder (@SubsetRelation α) :=
  ⟨SubsetRelationIsReflexive,
   SubsetRelationIsAntisymmetric,
   SubsetRelationIsTransitive⟩

end LRA.VolumeI.Sets.Relations
