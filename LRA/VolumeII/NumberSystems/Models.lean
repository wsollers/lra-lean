-- LRA/VolumeII/NumberSystems/Models.lean
-- Shared model and extension interfaces for Z, Q, and R.

import LRA.VolumeII.NumberSystems.Signatures

namespace LRA
namespace VolumeII
namespace NumberSystems

/-!
Volume II label: configurable-number-system-models
Lean module: LRA.VolumeII.NumberSystems.Models
Blueprint label: configurable-number-system-models
Verification status: statement-accepted-proof-pending

The law hierarchy separates properties shared by ordered domains from the
properties that distinguish the integers, rationals, and reals. In particular,
discreteness belongs only to integer models, while Archimedean and cofinality
obligations belong to the extension maps between adjacent number systems.
-/

/--
**[Definition — Ordered Ring Laws]**

These are the additive, multiplicative, distributive, and order-compatibility
laws shared by the ordered number systems.
-/
structure OrderedRingLaws
    (signature : OrderedRingSignature) : Prop where
  addition_is_associative :
    ∀ first second third : signature.carrier,
      signature.addition
          (signature.addition first second)
          third =
        signature.addition
          first
          (signature.addition second third)
  addition_is_commutative :
    ∀ first second : signature.carrier,
      signature.addition first second =
        signature.addition second first
  zero_is_additive_identity :
    ∀ value : signature.carrier,
      signature.addition signature.zero value = value ∧
      signature.addition value signature.zero = value
  negation_is_additive_inverse :
    ∀ value : signature.carrier,
      signature.addition (signature.negation value) value =
        signature.zero ∧
      signature.addition value (signature.negation value) =
        signature.zero
  multiplication_is_associative :
    ∀ first second third : signature.carrier,
      signature.multiplication
          (signature.multiplication first second)
          third =
        signature.multiplication
          first
          (signature.multiplication second third)
  multiplication_is_commutative :
    ∀ first second : signature.carrier,
      signature.multiplication first second =
        signature.multiplication second first
  one_is_multiplicative_identity :
    ∀ value : signature.carrier,
      signature.multiplication signature.one value = value ∧
      signature.multiplication value signature.one = value
  multiplication_distributes_over_addition :
    ∀ first second third : signature.carrier,
      signature.multiplication
          first
          (signature.addition second third) =
        signature.addition
          (signature.multiplication first second)
          (signature.multiplication first third)
  strict_order_is_irreflexive :
    ∀ value : signature.carrier,
      ¬ signature.strict_order value value
  strict_order_is_transitive :
    ∀ first second third : signature.carrier,
      signature.strict_order first second →
      signature.strict_order second third →
      signature.strict_order first third
  strict_order_is_trichotomous :
    ∀ first second : signature.carrier,
      signature.strict_order first second ∨
      first = second ∨
      signature.strict_order second first
  nonstrict_order_agrees_with_strict_order :
    ∀ first second : signature.carrier,
      signature.nonstrict_order first second ↔
        signature.strict_order first second ∨ first = second
  addition_preserves_strict_order :
    ∀ first second translation : signature.carrier,
      signature.strict_order first second →
      signature.strict_order
        (signature.addition first translation)
        (signature.addition second translation)
  positive_multiplication_preserves_strict_order :
    ∀ first second positive_factor : signature.carrier,
      signature.strict_order first second →
      signature.strict_order signature.zero positive_factor →
      signature.strict_order
        (signature.multiplication first positive_factor)
        (signature.multiplication second positive_factor)

/--
**[Definition — Ordered Integral-Domain Laws]**
-/
structure OrderedIntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends OrderedRingLaws signature where
  zero_is_not_one : signature.zero ≠ signature.one
  has_no_zero_divisors :
    ∀ first second : signature.carrier,
      signature.multiplication first second = signature.zero →
      first = signature.zero ∨ second = signature.zero

/--
**[Definition — Integer Laws]**

The integer laws add discrete order to the ordered integral-domain laws.
-/
structure IntegerLaws
    (signature : OrderedRingSignature) : Prop
    extends OrderedIntegralDomainLaws signature where
  order_is_discrete :
    ∀ value : signature.carrier,
      ¬ ∃ middle : signature.carrier,
        signature.strict_order value middle ∧
        signature.strict_order
          middle
          (signature.addition value signature.one)

/-- **[Definition — Integer Model]** -/
structure IntegerModel where
  signature : OrderedRingSignature
  laws : IntegerLaws signature

/--
**[Definition — Rational Laws]**

A rational model is a densely ordered field. Its Archimedean relationship to the
selected integer model is recorded in `RationalExtension`, where the embedding
needed to state that property is available.
-/
structure RationalLaws
    (signature : OrderedFieldSignature) : Prop where
  ordered_integral_domain_laws :
    OrderedIntegralDomainLaws signature.toOrderedRingSignature
  inverse_is_multiplicative_inverse :
    ∀ value : signature.carrier,
      value ≠ signature.zero →
      signature.multiplication
          (signature.inverse value)
          value =
        signature.one
  order_is_dense :
    ∀ first second : signature.carrier,
      signature.strict_order first second →
      ∃ middle : signature.carrier,
        signature.strict_order first middle ∧
        signature.strict_order middle second

/-- **[Definition — Rational Model]** -/
structure RationalModel where
  signature : OrderedFieldSignature
  laws : RationalLaws signature

/--
**[Definition — Real Laws]**

The real laws add the least-upper-bound property to the densely ordered field
laws. Archimedean cofinality of the selected rational copy is recorded by the
adjacent extension structure.
-/
structure RealLaws
    (signature : OrderedFieldSignature) : Prop where
  rational_like_laws : RationalLaws signature
  least_upper_bound_property :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          signature.nonstrict_order member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          signature.nonstrict_order member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            signature.nonstrict_order member upper_bound) →
          signature.nonstrict_order supremum upper_bound)

/-- **[Definition — Real Model]** -/
structure RealModel where
  signature : OrderedFieldSignature
  laws : RealLaws signature

/--
**[Definition — Integer Embedding into a Rational Model]**
-/
structure IntegerEmbeddingIntoRational
    (integer_model : IntegerModel)
    (rational_model : RationalModel) where
  to_rational :
    integer_model.signature.carrier →
      rational_model.signature.carrier
  injective :
    ∀ first second,
      to_rational first = to_rational second →
      first = second
  preserves_zero :
    to_rational integer_model.signature.zero =
      rational_model.signature.zero
  preserves_one :
    to_rational integer_model.signature.one =
      rational_model.signature.one
  preserves_addition :
    ∀ first second,
      to_rational
          (integer_model.signature.addition first second) =
        rational_model.signature.addition
          (to_rational first)
          (to_rational second)
  preserves_negation :
    ∀ value,
      to_rational
          (integer_model.signature.negation value) =
        rational_model.signature.negation
          (to_rational value)
  preserves_multiplication :
    ∀ first second,
      to_rational
          (integer_model.signature.multiplication first second) =
        rational_model.signature.multiplication
          (to_rational first)
          (to_rational second)
  preserves_and_reflects_order :
    ∀ first second,
      rational_model.signature.nonstrict_order
          (to_rational first)
          (to_rational second) ↔
        integer_model.signature.nonstrict_order first second

/--
**[Definition — Rational Extension of an Integer Model]**

The Archimedean clause says that the embedded integers are cofinal in the
rational order.
-/
structure RationalExtension
    (integer_model : IntegerModel) where
  rational_model : RationalModel
  integer_embedding :
    IntegerEmbeddingIntoRational integer_model rational_model
  archimedean_property :
    ∀ rational_value : rational_model.signature.carrier,
      ∃ integer_value : integer_model.signature.carrier,
        rational_model.signature.strict_order
          rational_value
          (integer_embedding.to_rational integer_value)

/--
**[Definition — Rational Embedding into a Real Model]**
-/
structure RationalEmbeddingIntoReal
    (rational_model : RationalModel)
    (real_model : RealModel) where
  to_real :
    rational_model.signature.carrier →
      real_model.signature.carrier
  injective :
    ∀ first second,
      to_real first = to_real second →
      first = second
  preserves_zero :
    to_real rational_model.signature.zero =
      real_model.signature.zero
  preserves_one :
    to_real rational_model.signature.one =
      real_model.signature.one
  preserves_addition :
    ∀ first second,
      to_real
          (rational_model.signature.addition first second) =
        real_model.signature.addition
          (to_real first)
          (to_real second)
  preserves_negation :
    ∀ value,
      to_real
          (rational_model.signature.negation value) =
        real_model.signature.negation
          (to_real value)
  preserves_multiplication :
    ∀ first second,
      to_real
          (rational_model.signature.multiplication first second) =
        real_model.signature.multiplication
          (to_real first)
          (to_real second)
  preserves_inverse :
    ∀ value,
      value ≠ rational_model.signature.zero →
      to_real
          (rational_model.signature.inverse value) =
        real_model.signature.inverse (to_real value)
  preserves_and_reflects_order :
    ∀ first second,
      real_model.signature.nonstrict_order
          (to_real first)
          (to_real second) ↔
        rational_model.signature.nonstrict_order first second

/--
**[Definition — Real Extension of a Rational Model]**

The cofinality clause records that every real lies below an embedded rational.
Together with the rational extension, this exposes the Archimedean tower
explicitly.
-/
structure RealExtension
    (rational_model : RationalModel) where
  real_model : RealModel
  rational_embedding :
    RationalEmbeddingIntoReal rational_model real_model
  rational_embedding_is_cofinal :
    ∀ real_value : real_model.signature.carrier,
      ∃ rational_value : rational_model.signature.carrier,
        real_model.signature.strict_order
          real_value
          (rational_embedding.to_real rational_value)

/--
**[Proposition — Every Integer Model Has Zero Absorption]**
-/
theorem integer_zero_is_absorbing
    (integer_model : IntegerModel)
    (value : integer_model.signature.carrier) :
    integer_model.signature.multiplication
        value
        integer_model.signature.zero =
      integer_model.signature.zero ∧
    integer_model.signature.multiplication
        integer_model.signature.zero
        value =
      integer_model.signature.zero := by
  sorry

/--
**[Corollary — Nonzero Multiplicative Cancellation in an Integer Model]**
-/
theorem integer_multiplicative_cancellation
    (integer_model : IntegerModel)
    (first second factor : integer_model.signature.carrier)
    (factor_is_nonzero : factor ≠ integer_model.signature.zero)
    (products_are_equal :
      integer_model.signature.multiplication first factor =
        integer_model.signature.multiplication second factor) :
    first = second := by
  sorry

end NumberSystems
end VolumeII
end LRA
