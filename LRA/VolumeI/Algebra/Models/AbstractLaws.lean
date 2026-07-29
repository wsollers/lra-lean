-- LRA/VolumeI/Algebra/Models/AbstractLaws.lean
-- Generic algebraic, order, completeness, embedding, and quotient laws.

import LRA.VolumeI.Algebra.Models.Models

namespace LRA.VolumeI.Algebra.Models.AbstractLaws

/-!
Volume II label: abstract-algebraic-and-order-laws
Lean module: LRA.VolumeI.Algebra.Models.AbstractLaws
Source: docs/number-systems/gpt-00-abstract-laws.md
Verification status: statement-accepted-proof-pending

This module records the reusable law interfaces that the construction chapters
instantiate.  The fields are propositions over explicit operations and
relations; concrete construction modules supply witnesses later.
-/

structure MagmaLaws {α : Type u} (operation : α → α → α) : Prop where
  Closed : ∀ first second : α, ∃ result : α, result = operation first second

structure SemigroupLaws {α : Type u} (operation : α → α → α) : Prop
    extends MagmaLaws operation where
  Associative : LRA.VolumeI.Operations.Associative operation

structure CommutativeSemigroupLaws {α : Type u} (operation : α → α → α) : Prop
    extends SemigroupLaws operation where
  Commutative : LRA.VolumeI.Operations.Commutative operation

structure MonoidLaws {α : Type u} (operation : α → α → α) (identity : α) : Prop
    extends SemigroupLaws operation where
  IdentityLaw : LRA.VolumeI.Operations.Identity operation identity

structure GroupLaws {α : Type u}
    (operation : α → α → α) (identity : α) (inverse : α → α) : Prop
    extends MonoidLaws operation identity where
  InverseLaw :
    LRA.VolumeI.Operations.LeftInverse operation identity inverse ∧
      LRA.VolumeI.Operations.RightInverse operation identity inverse

structure AbelianGroupLaws {α : Type u}
    (operation : α → α → α) (identity : α) (inverse : α → α) : Prop
    extends GroupLaws operation identity inverse where
  Commutative : LRA.VolumeI.Operations.Commutative operation

structure RingLikeLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α) (negation : α → α) : Prop where
  AdditiveLaws : AbelianGroupLaws addition zero negation
  MultiplicativeLaws : MonoidLaws multiplication one
  LeftDistributive : LRA.VolumeI.Operations.LeftDistributive multiplication addition
  RightDistributive : LRA.VolumeI.Operations.RightDistributive multiplication addition

structure IntegralDomainLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α) (negation : α → α) : Prop
    extends RingLikeLaws zero one addition multiplication negation where
  ZeroNeOne : zero ≠ one
  NoZeroDivisors :
    ∀ first second : α,
      multiplication first second = zero → first = zero ∨ second = zero

structure FieldLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α)
    (negation inverse : α → α) : Prop
    extends IntegralDomainLaws zero one addition multiplication negation where
  InverseLaw :
    ∀ value : α,
      value ≠ zero →
        multiplication (inverse value) value = one ∧
          multiplication value (inverse value) = one

structure StrictOrderLaws {α : Type u} (lt : α → α → Prop) : Prop where
  Irreflexive : LRA.VolumeI.Relations.Irreflexive lt
  Transitive : LRA.VolumeI.Relations.Transitive lt
  Trichotomous : ∀ first second : α, lt first second ∨ first = second ∨ lt second first

structure OrderLaws {α : Type u} (lt le : α → α → Prop) : Prop where
  StrictOrderLaws : StrictOrderLaws lt
  NonstrictOrderAgrees : ∀ first second : α, le first second ↔ lt first second ∨ first = second

structure OrderedRingCompatibilityLaws {α : Type u}
    (zero : α) (addition multiplication : α → α → α)
    (lt : α → α → Prop) : Prop where
  AdditionPreservesOrder :
    LRA.VolumeI.Relations.Order.StrictlyPreservesRightTranslation lt addition
  PositiveMultiplicationPreservesOrder :
    LRA.VolumeI.Relations.Order.PreservesPositiveRightMultiplication lt multiplication zero

structure OrderedRingLikeLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α)
    (negation : α → α) (lt le : α → α → Prop) : Prop
    extends RingLikeLaws zero one addition multiplication negation,
      OrderLaws lt le,
      OrderedRingCompatibilityLaws zero addition multiplication lt where

structure LeastUpperBoundProperty {α : Type u} (le : α → α → Prop) : Prop where
  EveryNonemptyBoundedSubsetHasSupremum :
    ∀ subset : α → Prop,
      (∃ member, subset member) →
      (∃ UpperBound, ∀ member, subset member → le member UpperBound) →
      ∃ supremum,
        (∀ member, subset member → le member supremum) ∧
          ∀ UpperBound,
            (∀ member, subset member → le member UpperBound) →
              le supremum UpperBound

structure HomomorphismPreserves {α β : Type u}
    (SourceZero SourceOne : α)
    (TargetZero TargetOne : β)
    (SourceAdd SourceMul : α → α → α)
    (TargetAdd TargetMul : β → β → β)
    (map : α → β) : Prop where
  PreservesZero : map SourceZero = TargetZero
  PreservesOne : map SourceOne = TargetOne
  PreservesAddition :
    ∀ first second : α,
      map (SourceAdd first second) = TargetAdd (map first) (map second)
  PreservesMultiplication :
    ∀ first second : α,
      map (SourceMul first second) = TargetMul (map first) (map second)

structure Embedding {α β : Type u} (map : α → β) : Prop where
  Injective : ∀ first second : α, map first = map second → first = second

structure OrderEmbedding {α β : Type u}
    (SourceLe : α → α → Prop) (TargetLe : β → β → Prop) (map : α → β) : Prop
    extends Embedding map where
  PreservesAndReflectsOrder :
    ∀ first second : α, TargetLe (map first) (map second) ↔ SourceLe first second

structure QuotientOperationDescent {α β : Type u}
    (rel : α → α → Prop) (project : α → β)
    (RepresentativeOperation : α → α → α) (QuotientOperation : β → β → β) : Prop where
  RespectsEquivalence :
    ∀ left₁ left₂ right₁ right₂ : α,
      rel left₁ left₂ → rel right₁ right₂ →
        rel (RepresentativeOperation left₁ right₁)
          (RepresentativeOperation left₂ right₂)
  Descends :
    ∀ left right : α,
      QuotientOperation (project left) (project right) =
        project (RepresentativeOperation left right)

end LRA.VolumeI.Algebra.Models.AbstractLaws
