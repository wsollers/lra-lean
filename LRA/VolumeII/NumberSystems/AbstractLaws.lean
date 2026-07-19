-- LRA/VolumeII/NumberSystems/AbstractLaws.lean
-- Generic algebraic, order, completeness, embedding, and quotient laws.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace NumberSystems
namespace AbstractLaws

/-!
Volume II label: abstract-algebraic-and-order-laws
Lean module: LRA.VolumeII.NumberSystems.AbstractLaws
Source: docs/number-systems/gpt-00-abstract-laws.md
Verification status: statement-accepted-proof-pending

This module records the reusable law interfaces that the construction chapters
instantiate.  The fields are propositions over explicit operations and
relations; concrete construction modules supply witnesses later.
-/

structure MagmaLaws {α : Type u} (operation : α → α → α) : Prop where
  closed : ∀ first second : α, ∃ result : α, result = operation first second

structure SemigroupLaws {α : Type u} (operation : α → α → α) : Prop
    extends MagmaLaws operation where
  associative :
    ∀ first second third : α,
      operation (operation first second) third =
        operation first (operation second third)

structure CommutativeSemigroupLaws {α : Type u} (operation : α → α → α) : Prop
    extends SemigroupLaws operation where
  commutative :
    ∀ first second : α, operation first second = operation second first

structure MonoidLaws {α : Type u} (operation : α → α → α) (identity : α) : Prop
    extends SemigroupLaws operation where
  identity_law :
    ∀ value : α, operation identity value = value ∧ operation value identity = value

structure GroupLaws {α : Type u}
    (operation : α → α → α) (identity : α) (inverse : α → α) : Prop
    extends MonoidLaws operation identity where
  inverse_law :
    ∀ value : α,
      operation (inverse value) value = identity ∧
        operation value (inverse value) = identity

structure AbelianGroupLaws {α : Type u}
    (operation : α → α → α) (identity : α) (inverse : α → α) : Prop
    extends GroupLaws operation identity inverse where
  commutative :
    ∀ first second : α, operation first second = operation second first

structure RingLikeLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α) (negation : α → α) : Prop where
  additive_laws : AbelianGroupLaws addition zero negation
  multiplicative_laws : MonoidLaws multiplication one
  left_distributive :
    ∀ first second third : α,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
  right_distributive :
    ∀ first second third : α,
      multiplication (addition first second) third =
        addition (multiplication first third) (multiplication second third)

structure IntegralDomainLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α) (negation : α → α) : Prop
    extends RingLikeLaws zero one addition multiplication negation where
  zero_ne_one : zero ≠ one
  no_zero_divisors :
    ∀ first second : α,
      multiplication first second = zero → first = zero ∨ second = zero

structure FieldLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α)
    (negation inverse : α → α) : Prop
    extends IntegralDomainLaws zero one addition multiplication negation where
  inverse_law :
    ∀ value : α,
      value ≠ zero →
        multiplication (inverse value) value = one ∧
          multiplication value (inverse value) = one

structure StrictOrderLaws {α : Type u} (lt : α → α → Prop) : Prop where
  irreflexive : ∀ value : α, ¬ lt value value
  transitive : ∀ first second third : α, lt first second → lt second third → lt first third
  trichotomous : ∀ first second : α, lt first second ∨ first = second ∨ lt second first

structure OrderedRingLikeLaws {α : Type u}
    (zero one : α) (addition multiplication : α → α → α)
    (negation : α → α) (lt le : α → α → Prop) : Prop
    extends RingLikeLaws zero one addition multiplication negation where
  strict_order_laws : StrictOrderLaws lt
  nonstrict_order_agrees : ∀ first second : α, le first second ↔ lt first second ∨ first = second
  addition_preserves_order :
    ∀ first second translation : α,
      lt first second → lt (addition first translation) (addition second translation)
  positive_multiplication_preserves_order :
    ∀ first second positive_factor : α,
      lt first second → lt zero positive_factor →
        lt (multiplication first positive_factor) (multiplication second positive_factor)

structure LeastUpperBoundProperty {α : Type u} (le : α → α → Prop) : Prop where
  every_nonempty_bounded_subset_has_supremum :
    ∀ subset : α → Prop,
      (∃ member, subset member) →
      (∃ upper_bound, ∀ member, subset member → le member upper_bound) →
      ∃ supremum,
        (∀ member, subset member → le member supremum) ∧
          ∀ upper_bound,
            (∀ member, subset member → le member upper_bound) →
              le supremum upper_bound

structure HomomorphismPreserves {α β : Type u}
    (source_zero source_one : α)
    (target_zero target_one : β)
    (source_add source_mul : α → α → α)
    (target_add target_mul : β → β → β)
    (map : α → β) : Prop where
  preserves_zero : map source_zero = target_zero
  preserves_one : map source_one = target_one
  preserves_addition :
    ∀ first second : α,
      map (source_add first second) = target_add (map first) (map second)
  preserves_multiplication :
    ∀ first second : α,
      map (source_mul first second) = target_mul (map first) (map second)

structure Embedding {α β : Type u} (map : α → β) : Prop where
  injective : ∀ first second : α, map first = map second → first = second

structure OrderEmbedding {α β : Type u}
    (source_le : α → α → Prop) (target_le : β → β → Prop) (map : α → β) : Prop
    extends Embedding map where
  preserves_and_reflects_order :
    ∀ first second : α, target_le (map first) (map second) ↔ source_le first second

structure QuotientOperationDescent {α β : Type u}
    (rel : α → α → Prop) (project : α → β)
    (representative_operation : α → α → α) (quotient_operation : β → β → β) : Prop where
  respects_equivalence :
    ∀ left₁ left₂ right₁ right₂ : α,
      rel left₁ left₂ → rel right₁ right₂ →
        rel (representative_operation left₁ right₁)
          (representative_operation left₂ right₂)
  descends :
    ∀ left right : α,
      quotient_operation (project left) (project right) =
        project (representative_operation left right)

end AbstractLaws
end NumberSystems
end VolumeII
end LRA
