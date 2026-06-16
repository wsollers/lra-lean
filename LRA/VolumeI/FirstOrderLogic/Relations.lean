namespace LRA.VolumeI.FirstOrderLogic.Relations

abbrev BinaryRelation (α : Type) : Type := α → α → Prop

variable {α : Type} (relation : BinaryRelation α)

def RelationIsReflexive : Prop :=
  ∀ element : α, relation element element

def RelationIsIrreflexive : Prop :=
  ∀ element : α, ¬ relation element element

def RelationIsSymmetric : Prop :=
  ∀ first second : α, relation first second → relation second first

def RelationIsAntisymmetric : Prop :=
  ∀ first second : α, relation first second → relation second first → first = second

def RelationIsAsymmetric : Prop :=
  ∀ first second : α, relation first second → ¬ relation second first

def RelationIsTransitive : Prop :=
  ∀ first second third : α,
    relation first second → relation second third → relation first third

def RelationIsTotal : Prop :=
  ∀ first second : α, relation first second ∨ relation second first

def RelationIsEquivalence : Prop :=
  RelationIsReflexive relation ∧
    RelationIsSymmetric relation ∧
    RelationIsTransitive relation

def RelationIsPreorder : Prop :=
  RelationIsReflexive relation ∧ RelationIsTransitive relation

def RelationIsPartialOrder : Prop :=
  RelationIsPreorder relation ∧ RelationIsAntisymmetric relation

def RelationIsTotalOrder : Prop :=
  RelationIsPartialOrder relation ∧ RelationIsTotal relation

def RelationIsStrictOrder : Prop :=
  RelationIsIrreflexive relation ∧ RelationIsTransitive relation

theorem asymmetricRelationIsIrreflexive
    (asymmetry : RelationIsAsymmetric relation) :
    RelationIsIrreflexive relation :=
  fun element selfRelated => asymmetry element element selfRelated selfRelated

theorem partialOrderIsReflexive
    (partialOrder : RelationIsPartialOrder relation) :
    RelationIsReflexive relation :=
  partialOrder.left.left

theorem partialOrderIsTransitive
    (partialOrder : RelationIsPartialOrder relation) :
    RelationIsTransitive relation :=
  partialOrder.left.right

theorem equalityIsReflexive : RelationIsReflexive (@Eq α) :=
  fun _ => rfl

theorem equalityIsSymmetric : RelationIsSymmetric (@Eq α) :=
  fun _ _ proofOfEquality => proofOfEquality.symm

theorem equalityIsTransitive : RelationIsTransitive (@Eq α) :=
  fun _ _ _ firstEquality secondEquality => firstEquality.trans secondEquality

theorem equalityIsEquivalence : RelationIsEquivalence (@Eq α) :=
  ⟨equalityIsReflexive, equalityIsSymmetric, equalityIsTransitive⟩

end LRA.VolumeI.FirstOrderLogic.Relations
