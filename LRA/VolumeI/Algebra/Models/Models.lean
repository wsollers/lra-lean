-- LRA/VolumeI/Algebra/Models/Models.lean
-- Shared model and extension interfaces for Z, Q, and R.

import LRA.VolumeI.Algebra.Models.Signatures
import LRA.VolumeI.Relations.Order.Relations

namespace LRA.VolumeI.Algebra.Models

/-!
Volume II label: configurable-number-system-models
Lean module: LRA.VolumeI.Algebra.Models.Models
Blueprint label: configurable-number-system-models
Verification status: statement-accepted-proof-pending

The law hierarchy separates ring algebra, pure order structure, and
compatibility between the two. Discreteness belongs only to integer models,
while Archimedean and cofinality obligations belong to the extension maps
between adjacent number systems.
-/

/--
**[Definition — Ring Laws]**

These are the additive, multiplicative, and distributive laws shared by the
number systems with ring operations.
-/
structure RingLaws
    (signature : OrderedRingSignature) : Prop where
  AdditionIsAssociative :
    LRA.VolumeI.Operations.Associative signature.addition
  AdditionIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.addition
  ZeroIsAdditiveIdentity :
    LRA.VolumeI.Operations.Identity signature.addition signature.zero
  NegationIsAdditiveInverse :
    LRA.VolumeI.Operations.LeftInverse
        signature.addition signature.zero signature.negation ∧
      LRA.VolumeI.Operations.RightInverse
        signature.addition signature.zero signature.negation
  MultiplicationIsAssociative :
    LRA.VolumeI.Operations.Associative signature.multiplication
  MultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.multiplication
  OneIsMultiplicativeIdentity :
    LRA.VolumeI.Operations.Identity signature.multiplication signature.one
  MultiplicationLeftDistributesOverAddition :
    LRA.VolumeI.Operations.LeftDistributive signature.multiplication signature.addition
  MultiplicationRightDistributesOverAddition :
    LRA.VolumeI.Operations.RightDistributive signature.multiplication signature.addition

/--
**[Definition — Order Laws]**

These are the pure order requirements for the strict and nonstrict order
relations, independent of the ring operations.
-/
structure OrderLaws
    (signature : OrderedRingSignature) : Prop where
  StrictOrderIsIrreflexive :
    LRA.VolumeI.Relations.Irreflexive signature.StrictOrder
  StrictOrderIsTransitive :
    LRA.VolumeI.Relations.Transitive signature.StrictOrder
  StrictOrderIsTrichotomous :
    ∀ first second : signature.carrier,
      signature.StrictOrder first second ∨
      first = second ∨
      signature.StrictOrder second first
  NonstrictOrderAgreesWithStrictOrder :
    ∀ first second : signature.carrier,
      signature.NonstrictOrder first second ↔
        signature.StrictOrder first second ∨ first = second

/--
**[Definition — Ordered Ring Compatibility Laws]**

These are exactly the bridge laws saying the ring operations respect the order.
-/
structure OrderedRingCompatibilityLaws
    (signature : OrderedRingSignature) : Prop where
  AdditionPreservesStrictOrder :
    LRA.VolumeI.Relations.Order.StrictlyPreservesRightTranslation
      signature.StrictOrder signature.addition
  PositiveMultiplicationPreservesStrictOrder :
    LRA.VolumeI.Relations.Order.PreservesPositiveRightMultiplication
      signature.StrictOrder signature.multiplication signature.zero

/--
**[Definition — Ordered Ring Laws]**

An ordered ring combines ring laws, order laws, and compatibility laws. The
component bundles remain separately available for clients that need only one
part of the interface.
-/
structure OrderedRingLaws
    (signature : OrderedRingSignature) : Prop
    extends RingLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where

/--
**[Definition — Integral-Domain Laws]**
-/
structure IntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends RingLaws signature where
  ZeroIsNotOne : signature.zero ≠ signature.one
  HasNoZeroDivisors :
    ∀ first second : signature.carrier,
      signature.multiplication first second = signature.zero →
      first = signature.zero ∨ second = signature.zero

/--
**[Definition — Ordered Integral-Domain Laws]**
-/
structure OrderedIntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends IntegralDomainLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where

/--
**[Definition — Integer Laws]**

The integer laws add discrete order to the ordered integral-domain laws.
-/
structure IntegerLaws
    (signature : OrderedRingSignature) : Prop
    extends OrderedIntegralDomainLaws signature where
  OrderIsDiscrete :
    ∀ value : signature.carrier,
      ¬ ∃ middle : signature.carrier,
        signature.StrictOrder value middle ∧
        signature.StrictOrder
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
  OrderedIntegralDomainLaws :
    OrderedIntegralDomainLaws signature.toOrderedRingSignature
  InverseIsMultiplicativeInverse :
    ∀ value : signature.carrier,
      value ≠ signature.zero →
      signature.multiplication
          (signature.inverse value)
          value =
        signature.one ∧
      signature.multiplication
          value
          (signature.inverse value) =
        signature.one
  OrderIsDense :
    ∀ first second : signature.carrier,
      signature.StrictOrder first second →
      ∃ middle : signature.carrier,
        signature.StrictOrder first middle ∧
        signature.StrictOrder middle second

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
  RationalLikeLaws : RationalLaws signature
  LeastUpperBoundProperty :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          signature.NonstrictOrder member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          signature.NonstrictOrder member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            signature.NonstrictOrder member upper_bound) →
          signature.NonstrictOrder supremum upper_bound)

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
  ToRational :
    integer_model.signature.carrier →
      rational_model.signature.carrier
  injective :
    ∀ first second,
      ToRational first = ToRational second →
      first = second
  PreservesZero :
    ToRational integer_model.signature.zero =
      rational_model.signature.zero
  PreservesOne :
    ToRational integer_model.signature.one =
      rational_model.signature.one
  PreservesAddition :
    ∀ first second,
      ToRational
          (integer_model.signature.addition first second) =
        rational_model.signature.addition
          (ToRational first)
          (ToRational second)
  PreservesNegation :
    ∀ value,
      ToRational
          (integer_model.signature.negation value) =
        rational_model.signature.negation
          (ToRational value)
  PreservesMultiplication :
    ∀ first second,
      ToRational
          (integer_model.signature.multiplication first second) =
        rational_model.signature.multiplication
          (ToRational first)
          (ToRational second)
  PreservesAndReflectsOrder :
    ∀ first second,
      rational_model.signature.NonstrictOrder
          (ToRational first)
          (ToRational second) ↔
        integer_model.signature.NonstrictOrder first second

/--
**[Definition — Rational Extension of an Integer Model]**

The Archimedean clause says that the embedded integers are cofinal in the
rational order.
-/
structure RationalExtension
    (integer_model : IntegerModel) where
  RationalModel : RationalModel
  IntegerEmbedding :
    IntegerEmbeddingIntoRational integer_model RationalModel
  ArchimedeanProperty :
    ∀ rational_value : RationalModel.signature.carrier,
      ∃ integer_value : integer_model.signature.carrier,
        RationalModel.signature.StrictOrder
          rational_value
          (IntegerEmbedding.ToRational integer_value)

/--
**[Definition — Rational Embedding into a Real Model]**
-/
structure RationalEmbeddingIntoReal
    (rational_model : RationalModel)
    (real_model : RealModel) where
  ToReal :
    rational_model.signature.carrier →
      real_model.signature.carrier
  injective :
    ∀ first second,
      ToReal first = ToReal second →
      first = second
  PreservesZero :
    ToReal rational_model.signature.zero =
      real_model.signature.zero
  PreservesOne :
    ToReal rational_model.signature.one =
      real_model.signature.one
  PreservesAddition :
    ∀ first second,
      ToReal
          (rational_model.signature.addition first second) =
        real_model.signature.addition
          (ToReal first)
          (ToReal second)
  PreservesNegation :
    ∀ value,
      ToReal
          (rational_model.signature.negation value) =
        real_model.signature.negation
          (ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal
          (rational_model.signature.multiplication first second) =
        real_model.signature.multiplication
          (ToReal first)
          (ToReal second)
  PreservesInverse :
    ∀ value,
      value ≠ rational_model.signature.zero →
      ToReal
          (rational_model.signature.inverse value) =
        real_model.signature.inverse (ToReal value)
  PreservesAndReflectsOrder :
    ∀ first second,
      real_model.signature.NonstrictOrder
          (ToReal first)
          (ToReal second) ↔
        rational_model.signature.NonstrictOrder first second

/--
**[Definition — Real Extension of a Rational Model]**

The cofinality clause records that every real lies below an embedded rational.
Together with the rational extension, this exposes the Archimedean tower
explicitly.
-/
structure RealExtension
    (rational_model : RationalModel) where
  RealModel : RealModel
  RationalEmbedding :
    RationalEmbeddingIntoReal rational_model RealModel
  RationalEmbeddingIsCofinal :
    ∀ real_value : RealModel.signature.carrier,
      ∃ rational_value : rational_model.signature.carrier,
        RealModel.signature.StrictOrder
          real_value
          (RationalEmbedding.ToReal rational_value)

/--
**[Proposition — Every Integer Model Has Zero Absorption]**
-/
theorem IntegerZeroIsAbsorbing
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
theorem IntegerMultiplicativeCancellation
    (integer_model : IntegerModel)
    (first second factor : integer_model.signature.carrier)
    (factor_is_nonzero : factor ≠ integer_model.signature.zero)
    (products_are_equal :
      integer_model.signature.multiplication first factor =
        integer_model.signature.multiplication second factor) :
    first = second := by
  sorry

end LRA.VolumeI.Algebra.Models
