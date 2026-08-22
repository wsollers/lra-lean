-- LRA/VolumeII/NumberSystems/Models.lean
-- Thin number-system model packages for Z, Q, and R.

import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures
import LRA.Order
namespace LRA.NumberSystems.Models

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
open LRA.Order

universe u

/-!
Volume II label: configurable-number-system-models
Lean module: LRA.NumberSystems.Models.Models
Verification status: checked interface module

The number-system models exist FOR QUANTIFICATION: universal properties
("every integer model embeds…", "any two complete ordered fields are
isomorphic") legitimately range over models, so a bundled package is the
right shape there. But the packages are now *thin* Σ-packages over the
Volume I algebraic-structures layer: a carrier, its operation instances,
and its certificate instances — nothing else. The old parallel law
vocabulary (`SemiringLaws`… over operation bundles) is retired; a model's
laws ARE the mixin certificates, so every fluent theorem
(`AddCommutative`, `MulSucc`, `ExistsBetween`, `Completeness`) applies to
a model's carrier directly, and any certified carrier — project or
Mathlib — becomes a model in one line via `ofCarrier`.

The instance fields are registered as instances, so for `M : RealModel`
the notations `+ * - ⁻¹ 0 1 < ≤` all elaborate on `M.Carrier`, and the
certificates resolve by instance search — no `letI`, no projections.

The derived `.signature` projections rebuild the operation bundles for
the first-order layer (`BuildOrderedFieldModel M.signature`) and for
signature-level consumers; they are definitionally transparent.
-/

/-! ## The integer model: a discretely ordered integral domain -/

/--
`DiscretelyOrderedIntegralDomainModel` packages the data and laws for integer model.

Logical form:

```lean
structure DiscretelyOrderedIntegralDomainModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [domainCert : IntegralDomainLaws Carrier]
  [orderCert : LinearOrderLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [addOrderCert : AdditionRespectsOrderLaws Carrier]
  [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
  [discreteCert : OrderDiscretenessLaw Carrier]
```
-/
structure DiscretelyOrderedIntegralDomainModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [domainCert : IntegralDomainLaws Carrier]
  [orderCert : LinearOrderLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [addOrderCert : AdditionRespectsOrderLaws Carrier]
  [mulOrderCert : MultiplicationRespectsOrderLaws Carrier]
  [discreteCert : OrderDiscretenessLaw Carrier]

attribute [instance] DiscretelyOrderedIntegralDomainModel.addInst DiscretelyOrderedIntegralDomainModel.mulInst
  DiscretelyOrderedIntegralDomainModel.negInst DiscretelyOrderedIntegralDomainModel.zeroInst DiscretelyOrderedIntegralDomainModel.oneInst
  DiscretelyOrderedIntegralDomainModel.ltInst DiscretelyOrderedIntegralDomainModel.leInst DiscretelyOrderedIntegralDomainModel.domainCert
  DiscretelyOrderedIntegralDomainModel.orderCert DiscretelyOrderedIntegralDomainModel.strictCert
  DiscretelyOrderedIntegralDomainModel.addOrderCert DiscretelyOrderedIntegralDomainModel.mulOrderCert
  DiscretelyOrderedIntegralDomainModel.discreteCert

/-- Package any certified carrier as an integer model.

Logical form:

```lean
def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }
```
-/
def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }

/-- The derived operation bundle, for the first-order layer and
signature-level consumers. -/
def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

/-! ## The densely ordered field model -/

/--
`DenselyOrderedFieldModel` packages the data and laws of a densely ordered field.
It is a structural model class; it does not characterize the rational numbers.

Logical form:

```lean
structure DenselyOrderedFieldModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [fieldCert : OrderedFieldLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [denseCert : DenseOrderLaw Carrier]
```
-/
structure DenselyOrderedFieldModel : Type (u + 1) where
  Carrier : Type u
  [addInst : Add Carrier]
  [mulInst : Mul Carrier]
  [negInst : Neg Carrier]
  [invInst : Inv Carrier]
  [zeroInst : OfNat Carrier 0]
  [oneInst : OfNat Carrier 1]
  [ltInst : LT Carrier]
  [leInst : LE Carrier]
  [fieldCert : OrderedFieldLaws Carrier]
  [strictCert : StrictOrderCompatibilityLaw Carrier]
  [denseCert : DenseOrderLaw Carrier]

attribute [instance] DenselyOrderedFieldModel.addInst DenselyOrderedFieldModel.mulInst
  DenselyOrderedFieldModel.negInst DenselyOrderedFieldModel.invInst DenselyOrderedFieldModel.zeroInst
  DenselyOrderedFieldModel.oneInst DenselyOrderedFieldModel.ltInst DenselyOrderedFieldModel.leInst
  DenselyOrderedFieldModel.fieldCert DenselyOrderedFieldModel.strictCert
  DenselyOrderedFieldModel.denseCert

/-- Package any certified carrier as a densely ordered field model.

Logical form:

```lean
def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }
```
-/
def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }

/-- The derived operation bundle. -/
def DenselyOrderedFieldModel.signature (M : DenselyOrderedFieldModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

/-! ## The real model: a complete densely ordered field -/

/-- A real model is a densely ordered field model whose order is complete
relative to the classical subset backend `Set Carrier`.

Logical form:

```lean
structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]
```
-/
structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]

attribute [instance] RealModel.completeCert

/-- Package any certified carrier as a real model.

Logical form:

```lean
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }
```
-/
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

/-- The derived operation bundle.

Logical form:

```lean
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature
```
-/
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature

/-! ## Mathlib carriers as models, one line each -/

/--
`mathlibIntegerModel` defines the displayed object for mathlib integer model.

Logical form:

```lean
def mathlibIntegerModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int
```
-/
def mathlibIntegerModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int

/-- The Mathlib rational carrier packaged as a densely ordered field model.

Logical form:

```lean
def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat
```
-/
def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat

/--
`mathlibRealModel` defines the displayed object for mathlib real model.

Logical form:

```lean
noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real
```
-/
noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real

/-! ## Embeddings and extensions between adjacent number systems

The maps are stated in the instance notation of the two carriers; the
Archimedean/cofinality clauses record how each system sits inside the
next. -/

/--
`IntegerEmbeddingIntoRational` packages the data and laws for integer embedding into rational.

Logical form:

```lean
structure IntegerEmbeddingIntoRational
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToRational :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToRational first = ToRational second → first = second
  PreservesZero : ToRational 0 = 0
  PreservesOne : ToRational 1 = 1
  PreservesAddition :
    ∀ first second,
      ToRational (first + second) = ToRational first + ToRational second
  PreservesNegation :
    ∀ value, ToRational (-value) = -(ToRational value)
  PreservesMultiplication :
    ∀ first second,
      ToRational (first * second) = ToRational first * ToRational second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToRational first ≤ ToRational second ↔ first ≤ second
```
-/
structure IntegerEmbeddingIntoRational
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToRational :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToRational first = ToRational second → first = second
  PreservesZero : ToRational 0 = 0
  PreservesOne : ToRational 1 = 1
  PreservesAddition :
    ∀ first second,
      ToRational (first + second) = ToRational first + ToRational second
  PreservesNegation :
    ∀ value, ToRational (-value) = -(ToRational value)
  PreservesMultiplication :
    ∀ first second,
      ToRational (first * second) = ToRational first * ToRational second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToRational first ≤ ToRational second ↔ first ≤ second

/-- A rational extension of an integer model: a densely ordered field model
together with an embedding whose image is cofinal (the Archimedean property).

Logical form:

```lean
structure RationalExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToRational IntegerValue
```
-/
structure RationalExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToRational IntegerValue

/--
`RationalEmbeddingIntoReal` packages the data and laws for rational embedding into real.

Logical form:

```lean
structure RationalEmbeddingIntoReal
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedDenselyOrderedFieldModel.Carrier → SelectedRealModel.Carrier
  injective :
    ∀ first second, ToReal first = ToReal second → first = second
  PreservesZero : ToReal 0 = 0
  PreservesOne : ToReal 1 = 1
  PreservesAddition :
    ∀ first second,
      ToReal (first + second) = ToReal first + ToReal second
  PreservesNegation :
    ∀ value, ToReal (-value) = -(ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal (first * second) = ToReal first * ToReal second
  PreservesInverse :
    ∀ value, value ≠ 0 → ToReal value⁻¹ = (ToReal value)⁻¹
  PreservesAndReflectsOrder :
    ∀ first second, ToReal first ≤ ToReal second ↔ first ≤ second
```
-/
structure RationalEmbeddingIntoReal
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedDenselyOrderedFieldModel.Carrier → SelectedRealModel.Carrier
  injective :
    ∀ first second, ToReal first = ToReal second → first = second
  PreservesZero : ToReal 0 = 0
  PreservesOne : ToReal 1 = 1
  PreservesAddition :
    ∀ first second,
      ToReal (first + second) = ToReal first + ToReal second
  PreservesNegation :
    ∀ value, ToReal (-value) = -(ToReal value)
  PreservesMultiplication :
    ∀ first second,
      ToReal (first * second) = ToReal first * ToReal second
  PreservesInverse :
    ∀ value, value ≠ 0 → ToReal value⁻¹ = (ToReal value)⁻¹
  PreservesAndReflectsOrder :
    ∀ first second, ToReal first ≤ ToReal second ↔ first ≤ second

/-- A real extension of a densely ordered field model: a real model together
with an embedding whose image is cofinal.

Logical form:

```lean
structure RealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < RationalEmbedding.ToReal RationalValue
```
-/
structure RealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < RationalEmbedding.ToReal RationalValue

/-! ## Smoke tests: fluent mixin theorems land on model carriers -/

example (M : DiscretelyOrderedIntegralDomainModel) (a b : M.Carrier) : a + b = b + a :=
  AddCommutative a b

example (M : DenselyOrderedFieldModel) (a b : M.Carrier) (h : a < b) :
    ∃ middle, a < middle ∧ middle < b :=
  ExistsBetween a b h

example (M : RealModel) :
    LRA.Order.LeastUpperBoundProperty
      (Set M.Carrier) (fun a b : M.Carrier => a ≤ b) :=
  Completeness

example (a b : mathlibIntegerModel.Carrier) : a * b = b * a :=
  MulCommutative a b

end LRA.NumberSystems.Models
