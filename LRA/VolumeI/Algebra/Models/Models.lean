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
Laws for a semiring. Addition is commutative; multiplication need not be.

Logical form:

```lean
structure SemiringLaws
    (signature : SemiringSignature) : Prop where
  AdditionIsAssociative :
    LRA.VolumeI.Operations.Associative signature.addition
  AdditionIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.addition
  ZeroIsAdditiveIdentity :
    LRA.VolumeI.Operations.Identity signature.addition signature.zero
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
```
-/
structure SemiringLaws
    (signature : SemiringSignature) : Prop where
  AdditionIsAssociative :
    LRA.VolumeI.Operations.Associative signature.addition
  AdditionIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.addition
  ZeroIsAdditiveIdentity :
    LRA.VolumeI.Operations.Identity signature.addition signature.zero
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
Laws for a semiring whose multiplication is also commutative.

Logical form:

```lean
structure CommutativeSemiringLaws
    (signature : SemiringSignature) : Prop where
  toSemiringLaws : SemiringLaws signature
  MultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.multiplication
```
-/
structure CommutativeSemiringLaws
    (signature : SemiringSignature) : Prop where
  toSemiringLaws : SemiringLaws signature
  MultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.multiplication

/--
A bundled semiring: operations together with their laws.

Logical form:

```lean
structure Semiring where
  signature : SemiringSignature
  laws : SemiringLaws signature
```
-/
structure Semiring where
  signature : SemiringSignature
  laws : SemiringLaws signature

/--
A bundled commutative semiring: operations together with their laws.

Logical form:

```lean
structure CommutativeSemiring where
  signature : SemiringSignature
  laws : CommutativeSemiringLaws signature
```
-/
structure CommutativeSemiring where
  signature : SemiringSignature
  laws : CommutativeSemiringLaws signature

/--
Laws for a ring.

Logical form:

```lean
structure RingLawsCore
    (signature : RingSignature) : Prop where
  toSemiringLaws :
    SemiringLaws signature.toSemiringSignature
  NegationIsAdditiveInverse :
    LRA.VolumeI.Operations.LeftInverse
        signature.addition signature.zero signature.negation ∧
      LRA.VolumeI.Operations.RightInverse
        signature.addition signature.zero signature.negation
```
-/
structure RingLawsCore
    (signature : RingSignature) : Prop where
  toSemiringLaws :
    SemiringLaws signature.toSemiringSignature
  NegationIsAdditiveInverse :
    LRA.VolumeI.Operations.LeftInverse
        signature.addition signature.zero signature.negation ∧
      LRA.VolumeI.Operations.RightInverse
        signature.addition signature.zero signature.negation

/-- Laws for a commutative ring.  Multiplication commutativity is inherited
from the semiring law bundle.

Logical form:

```lean
structure CommutativeRingLaws
    (signature : RingSignature) : Prop where
  toRingLawsCore : RingLawsCore signature
  MultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.multiplication
```
-/
structure CommutativeRingLaws
    (signature : RingSignature) : Prop where
  toRingLawsCore : RingLawsCore signature
  MultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative signature.multiplication

/--
A bundled ring.

Logical form:

```lean
structure Ring where
  signature : RingSignature
  laws : RingLawsCore signature
```
-/
structure Ring where
  signature : RingSignature
  laws : RingLawsCore signature

/--
A bundled commutative ring.

Logical form:

```lean
structure CommutativeRing where
  signature : RingSignature
  laws : CommutativeRingLaws signature
```
-/
structure CommutativeRing where
  signature : RingSignature
  laws : CommutativeRingLaws signature

/--
**[Definition — Ring Laws]**

These are the additive, multiplicative, and distributive laws shared by the
number systems with ring operations.

Logical form:

```lean
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
```
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

Logical form:

```lean
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
```
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

Logical form:

```lean
structure OrderedRingCompatibilityLaws
    (signature : OrderedRingSignature) : Prop where
  AdditionPreservesStrictOrder :
    LRA.VolumeI.Relations.Order.StrictlyPreservesRightTranslation
      signature.StrictOrder signature.addition
  PositiveMultiplicationPreservesStrictOrder :
    LRA.VolumeI.Relations.Order.PreservesPositiveRightMultiplication
      signature.StrictOrder signature.multiplication signature.zero
```
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

Logical form:

```lean
structure OrderedRingLaws
    (signature : OrderedRingSignature) : Prop
    extends RingLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where
```
-/
structure OrderedRingLaws
    (signature : OrderedRingSignature) : Prop
    extends RingLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where

/--
**[Definition — Integral-Domain Laws]**

Logical form:

```lean
structure IntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends RingLaws signature where
  ZeroIsNotOne : signature.zero ≠ signature.one
  HasNoZeroDivisors :
    ∀ first second : signature.carrier,
      signature.multiplication first second = signature.zero →
      first = signature.zero ∨ second = signature.zero
```
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

Logical form:

```lean
structure OrderedIntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends IntegralDomainLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where
```
-/
structure OrderedIntegralDomainLaws
    (signature : OrderedRingSignature) : Prop
    extends IntegralDomainLaws signature,
      OrderLaws signature,
      OrderedRingCompatibilityLaws signature where

/--
**[Definition — Integer Laws]**

The integer laws add discrete order to the ordered integral-domain laws.

Logical form:

```lean
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
```
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

/--
**[Definition — Integer Model]**

Logical form:

```lean
structure IntegerModel where
  signature : OrderedRingSignature
  laws : IntegerLaws signature
```
-/
structure IntegerModel where
  signature : OrderedRingSignature
  laws : IntegerLaws signature

/--
**[Definition — Rational Laws]**

A rational model is a densely ordered field. Its Archimedean relationship to the
selected integer model is recorded in `RationalExtension`, where the embedding
needed to state that property is available.

Logical form:

```lean
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
```
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

/--
**[Definition — Rational Model]**

Logical form:

```lean
structure RationalModel where
  signature : OrderedFieldSignature
  laws : RationalLaws signature
```
-/
structure RationalModel where
  signature : OrderedFieldSignature
  laws : RationalLaws signature

/--
**[Definition — Real Laws]**

The real laws add the least-upper-bound property to the densely ordered field
laws. Archimedean cofinality of the selected rational copy is recorded by the
adjacent extension structure.

Logical form:

```lean
structure RealLaws
    (signature : OrderedFieldSignature) : Prop where
  RationalLikeLaws : RationalLaws signature
  LeastUpperBoundProperty :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ UpperBound,
        ∀ member,
          subset member →
          signature.NonstrictOrder member UpperBound) →
      ∃ supremum,
        (∀ member,
          subset member →
          signature.NonstrictOrder member supremum) ∧
        (∀ UpperBound,
          (∀ member,
            subset member →
            signature.NonstrictOrder member UpperBound) →
          signature.NonstrictOrder supremum UpperBound)
```
-/
structure RealLaws
    (signature : OrderedFieldSignature) : Prop where
  RationalLikeLaws : RationalLaws signature
  LeastUpperBoundProperty :
    ∀ subset : signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ UpperBound,
        ∀ member,
          subset member →
          signature.NonstrictOrder member UpperBound) →
      ∃ supremum,
        (∀ member,
          subset member →
          signature.NonstrictOrder member supremum) ∧
        (∀ UpperBound,
          (∀ member,
            subset member →
            signature.NonstrictOrder member UpperBound) →
          signature.NonstrictOrder supremum UpperBound)

/--
**[Definition — Real Model]**

Logical form:

```lean
structure RealModel where
  signature : OrderedFieldSignature
  laws : RealLaws signature
```
-/
structure RealModel where
  signature : OrderedFieldSignature
  laws : RealLaws signature

/--
**[Definition — Integer Embedding into a Rational Model]**

Logical form:

```lean
structure IntegerEmbeddingIntoRational
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel) where
  ToRational :
    SelectedIntegerModel.signature.carrier →
      SelectedRationalModel.signature.carrier
  injective :
    ∀ first second,
      ToRational first = ToRational second →
      first = second
  PreservesZero :
    ToRational SelectedIntegerModel.signature.zero =
      SelectedRationalModel.signature.zero
  PreservesOne :
    ToRational SelectedIntegerModel.signature.one =
      SelectedRationalModel.signature.one
  PreservesAddition :
    ∀ first second,
      ToRational
          (SelectedIntegerModel.signature.addition first second) =
        SelectedRationalModel.signature.addition
          (ToRational first)
          (ToRational second)
  PreservesNegation :
    ∀ value,
      ToRational
          (SelectedIntegerModel.signature.negation value) =
        SelectedRationalModel.signature.negation
          (ToRational value)
  PreservesMultiplication :
    ∀ first second,
      ToRational
          (SelectedIntegerModel.signature.multiplication first second) =
        SelectedRationalModel.signature.multiplication
          (ToRational first)
          (ToRational second)
  PreservesAndReflectsOrder :
    ∀ first second,
      SelectedRationalModel.signature.NonstrictOrder
          (ToRational first)
          (ToRational second) ↔
        SelectedIntegerModel.signature.NonstrictOrder first second
```
-/
structure IntegerEmbeddingIntoRational
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel) where
  ToRational :
    SelectedIntegerModel.signature.carrier →
      SelectedRationalModel.signature.carrier
  injective :
    ∀ first second,
      ToRational first = ToRational second →
      first = second
  PreservesZero :
    ToRational SelectedIntegerModel.signature.zero =
      SelectedRationalModel.signature.zero
  PreservesOne :
    ToRational SelectedIntegerModel.signature.one =
      SelectedRationalModel.signature.one
  PreservesAddition :
    ∀ first second,
      ToRational
          (SelectedIntegerModel.signature.addition first second) =
        SelectedRationalModel.signature.addition
          (ToRational first)
          (ToRational second)
  PreservesNegation :
    ∀ value,
      ToRational
          (SelectedIntegerModel.signature.negation value) =
        SelectedRationalModel.signature.negation
          (ToRational value)
  PreservesMultiplication :
    ∀ first second,
      ToRational
          (SelectedIntegerModel.signature.multiplication first second) =
        SelectedRationalModel.signature.multiplication
          (ToRational first)
          (ToRational second)
  PreservesAndReflectsOrder :
    ∀ first second,
      SelectedRationalModel.signature.NonstrictOrder
          (ToRational first)
          (ToRational second) ↔
        SelectedIntegerModel.signature.NonstrictOrder first second

/--
**[Definition — Rational Extension of an Integer Model]**

The Archimedean clause says that the embedded integers are cofinal in the
rational order.

Logical form:

```lean
structure RationalExtension
    (SelectedIntegerModel : IntegerModel) where
  RationalModel : RationalModel
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel RationalModel
  ArchimedeanProperty :
    ∀ RationalValue : RationalModel.signature.carrier,
      ∃ IntegerValue : SelectedIntegerModel.signature.carrier,
        RationalModel.signature.StrictOrder
          RationalValue
          (IntegerEmbedding.ToRational IntegerValue)
```
-/
structure RationalExtension
    (SelectedIntegerModel : IntegerModel) where
  RationalModel : RationalModel
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel RationalModel
  ArchimedeanProperty :
    ∀ RationalValue : RationalModel.signature.carrier,
      ∃ IntegerValue : SelectedIntegerModel.signature.carrier,
        RationalModel.signature.StrictOrder
          RationalValue
          (IntegerEmbedding.ToRational IntegerValue)

/--
**[Definition — Rational Embedding into a Real Model]**

Logical form:

```lean
structure RationalEmbeddingIntoReal
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedRationalModel.signature.carrier →
      SelectedRealModel.signature.carrier
  injective :
    ∀ first second,
      ToReal first = ToReal second →
      first = second
  PreservesZero :
    ToReal SelectedRationalModel.signature.zero =
      SelectedRealModel.signature.zero
  PreservesOne :
    ToReal SelectedRationalModel.signature.one =
      SelectedRealModel.signature.one
  PreservesAddition :
    ∀ first second,
      ToReal
          (SelectedRationalModel.signature.addition first second) =
        SelectedRealModel.signature.addition
          (ToReal first)
          (ToReal second)
  PreservesNegation :
    ∀ value,
      ToReal
          (SelectedRationalModel.signature.negation value) =
        SelectedRealModel.signature.negation
          (ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal
          (SelectedRationalModel.signature.multiplication first second) =
        SelectedRealModel.signature.multiplication
          (ToReal first)
          (ToReal second)
  PreservesInverse :
    ∀ value,
      value ≠ SelectedRationalModel.signature.zero →
      ToReal
          (SelectedRationalModel.signature.inverse value) =
        SelectedRealModel.signature.inverse (ToReal value)
  PreservesAndReflectsOrder :
    ∀ first second,
      SelectedRealModel.signature.NonstrictOrder
          (ToReal first)
          (ToReal second) ↔
        SelectedRationalModel.signature.NonstrictOrder first second
```
-/
structure RationalEmbeddingIntoReal
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedRationalModel.signature.carrier →
      SelectedRealModel.signature.carrier
  injective :
    ∀ first second,
      ToReal first = ToReal second →
      first = second
  PreservesZero :
    ToReal SelectedRationalModel.signature.zero =
      SelectedRealModel.signature.zero
  PreservesOne :
    ToReal SelectedRationalModel.signature.one =
      SelectedRealModel.signature.one
  PreservesAddition :
    ∀ first second,
      ToReal
          (SelectedRationalModel.signature.addition first second) =
        SelectedRealModel.signature.addition
          (ToReal first)
          (ToReal second)
  PreservesNegation :
    ∀ value,
      ToReal
          (SelectedRationalModel.signature.negation value) =
        SelectedRealModel.signature.negation
          (ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal
          (SelectedRationalModel.signature.multiplication first second) =
        SelectedRealModel.signature.multiplication
          (ToReal first)
          (ToReal second)
  PreservesInverse :
    ∀ value,
      value ≠ SelectedRationalModel.signature.zero →
      ToReal
          (SelectedRationalModel.signature.inverse value) =
        SelectedRealModel.signature.inverse (ToReal value)
  PreservesAndReflectsOrder :
    ∀ first second,
      SelectedRealModel.signature.NonstrictOrder
          (ToReal first)
          (ToReal second) ↔
        SelectedRationalModel.signature.NonstrictOrder first second

/--
**[Definition — Real Extension of a Rational Model]**

The cofinality clause records that every real lies below an embedded rational.
Together with the rational extension, this exposes the Archimedean tower
explicitly.

Logical form:

```lean
structure RealExtension
    (SelectedRationalModel : RationalModel) where
  RealModel : RealModel
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedRationalModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.signature.carrier,
      ∃ RationalValue : SelectedRationalModel.signature.carrier,
        RealModel.signature.StrictOrder
          RealValue
          (RationalEmbedding.ToReal RationalValue)
```
-/
structure RealExtension
    (SelectedRationalModel : RationalModel) where
  RealModel : RealModel
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedRationalModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.signature.carrier,
      ∃ RationalValue : SelectedRationalModel.signature.carrier,
        RealModel.signature.StrictOrder
          RealValue
          (RationalEmbedding.ToReal RationalValue)

/--
**[Proposition — Every Integer Model Has Zero Absorption]**

Logical form:

```lean
theorem IntegerZeroIsAbsorbing
    (SelectedIntegerModel : IntegerModel)
    (value : SelectedIntegerModel.signature.carrier) :
    SelectedIntegerModel.signature.multiplication
        value
        SelectedIntegerModel.signature.zero =
      SelectedIntegerModel.signature.zero ∧
    SelectedIntegerModel.signature.multiplication
        SelectedIntegerModel.signature.zero
        value =
      SelectedIntegerModel.signature.zero
```
-/
theorem IntegerZeroIsAbsorbing
    (SelectedIntegerModel : IntegerModel)
    (value : SelectedIntegerModel.signature.carrier) :
    SelectedIntegerModel.signature.multiplication
        value
        SelectedIntegerModel.signature.zero =
      SelectedIntegerModel.signature.zero ∧
    SelectedIntegerModel.signature.multiplication
        SelectedIntegerModel.signature.zero
        value =
      SelectedIntegerModel.signature.zero := by
  sorry

/--
**[Corollary — Nonzero Multiplicative Cancellation in an Integer Model]**

Logical form:

```lean
theorem IntegerMultiplicativeCancellation
    (SelectedIntegerModel : IntegerModel)
    (first second factor : SelectedIntegerModel.signature.carrier)
    (FactorIsNonzero : factor ≠ SelectedIntegerModel.signature.zero)
    (ProductsAreEqual :
      SelectedIntegerModel.signature.multiplication first factor =
        SelectedIntegerModel.signature.multiplication second factor) :
    first = second
```
-/
theorem IntegerMultiplicativeCancellation
    (SelectedIntegerModel : IntegerModel)
    (first second factor : SelectedIntegerModel.signature.carrier)
    (FactorIsNonzero : factor ≠ SelectedIntegerModel.signature.zero)
    (ProductsAreEqual :
      SelectedIntegerModel.signature.multiplication first factor =
        SelectedIntegerModel.signature.multiplication second factor) :
    first = second := by
  sorry

end LRA.VolumeI.Algebra.Models
