-- LRA/VolumeI/UniversalAlgebra/Models/Models.lean
-- Thin number-system model packages for Z, Q, and R.

import LRA.VolumeI.AlgebraicStructures.OrderedRing.ModelTheory.ModelBuilder
import LRA.VolumeI.AlgebraicStructures.OrderedField.ModelTheory.ModelBuilder
import LRA.VolumeI.AlgebraicStructures
import LRA.VolumeI.Order

namespace LRA.UniversalAlgebra.Models

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedRing.ModelTheory
open LRA.AlgebraicStructures.OrderedField.ModelTheory
open LRA.Order

universe u

/-!
Volume II label: configurable-number-system-models
Lean module: LRA.UniversalAlgebra.Models.Models
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
`IntegerModel` packages the data and laws for integer model.

Logical form:

```lean
structure IntegerModel : Type (u + 1) where
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
structure IntegerModel : Type (u + 1) where
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

attribute [instance] IntegerModel.addInst IntegerModel.mulInst
  IntegerModel.negInst IntegerModel.zeroInst IntegerModel.oneInst
  IntegerModel.ltInst IntegerModel.leInst IntegerModel.domainCert
  IntegerModel.orderCert IntegerModel.strictCert
  IntegerModel.addOrderCert IntegerModel.mulOrderCert
  IntegerModel.discreteCert

/-- Package any certified carrier as an integer model.

Logical form:

```lean
def IntegerModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : IntegerModel :=
  { Carrier := R }
```
-/
def IntegerModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : IntegerModel :=
  { Carrier := R }

/-- The derived operation bundle, for the first-order layer and
signature-level consumers.

Logical form:

```lean
def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  addition := (· + ·)
  negation := (- ·)
  multiplication := (· * ·)
  StrictOrder := (· < ·)
  NonstrictOrder := (· ≤ ·)
```
-/
def IntegerModel.signature (M : IntegerModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  addition := (· + ·)
  negation := (- ·)
  multiplication := (· * ·)
  StrictOrder := (· < ·)
  NonstrictOrder := (· ≤ ·)

/-! ## The rational model: a densely ordered field -/

/--
`RationalModel` packages the data and laws for rational model.

Logical form:

```lean
structure RationalModel : Type (u + 1) where
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
structure RationalModel : Type (u + 1) where
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

attribute [instance] RationalModel.addInst RationalModel.mulInst
  RationalModel.negInst RationalModel.invInst RationalModel.zeroInst
  RationalModel.oneInst RationalModel.ltInst RationalModel.leInst
  RationalModel.fieldCert RationalModel.strictCert
  RationalModel.denseCert

/-- Package any certified carrier as a rational model.

Logical form:

```lean
def RationalModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : RationalModel :=
  { Carrier := R }
```
-/
def RationalModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : RationalModel :=
  { Carrier := R }

/-- The derived operation bundle.

Logical form:

```lean
def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  addition := (· + ·)
  negation := (- ·)
  multiplication := (· * ·)
  inverse := (·⁻¹)
  StrictOrder := (· < ·)
  NonstrictOrder := (· ≤ ·)
```
-/
def RationalModel.signature (M : RationalModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  addition := (· + ·)
  negation := (- ·)
  multiplication := (· * ·)
  inverse := (·⁻¹)
  StrictOrder := (· < ·)
  NonstrictOrder := (· ≤ ·)

/-! ## The real model: a complete densely ordered field -/

/-- A real model is a rational-style model (densely ordered field) whose
order is complete relative to the classical subset backend
`Set Carrier`.

Logical form:

```lean
structure RealModel extends RationalModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]
```
-/
structure RealModel extends RationalModel where
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
  M.toRationalModel.signature
```
-/
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toRationalModel.signature

/-! ## Mathlib carriers as models, one line each -/

/--
`mathlibIntegerModel` defines the displayed object for mathlib integer model.

Logical form:

```lean
def mathlibIntegerModel : IntegerModel := IntegerModel.ofCarrier Int
```
-/
def mathlibIntegerModel : IntegerModel := IntegerModel.ofCarrier Int

/--
`mathlibRationalModel` defines the displayed object for mathlib rational model.

Logical form:

```lean
def mathlibRationalModel : RationalModel := RationalModel.ofCarrier Rat
```
-/
def mathlibRationalModel : RationalModel := RationalModel.ofCarrier Rat

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
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel) where
  ToRational :
    SelectedIntegerModel.Carrier → SelectedRationalModel.Carrier
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
    (SelectedIntegerModel : IntegerModel)
    (SelectedRationalModel : RationalModel) where
  ToRational :
    SelectedIntegerModel.Carrier → SelectedRationalModel.Carrier
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

/-- A rational extension of an integer model: a rational model together
with an embedding whose image is cofinal (the Archimedean property).

Logical form:

```lean
structure RationalExtension
    (SelectedIntegerModel : IntegerModel.{u}) where
  RationalModel : RationalModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel RationalModel
  ArchimedeanProperty :
    ∀ RationalValue : RationalModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToRational IntegerValue
```
-/
structure RationalExtension
    (SelectedIntegerModel : IntegerModel.{u}) where
  RationalModel : RationalModel.{u}
  IntegerEmbedding :
    IntegerEmbeddingIntoRational SelectedIntegerModel RationalModel
  ArchimedeanProperty :
    ∀ RationalValue : RationalModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToRational IntegerValue

/--
`RationalEmbeddingIntoReal` packages the data and laws for rational embedding into real.

Logical form:

```lean
structure RationalEmbeddingIntoReal
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedRationalModel.Carrier → SelectedRealModel.Carrier
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
    (SelectedRationalModel : RationalModel)
    (SelectedRealModel : RealModel) where
  ToReal :
    SelectedRationalModel.Carrier → SelectedRealModel.Carrier
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

/-- A real extension of a rational model: a real model together with an
embedding whose image is cofinal.

Logical form:

```lean
structure RealExtension
    (SelectedRationalModel : RationalModel.{u}) where
  RealModel : RealModel.{u}
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedRationalModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedRationalModel.Carrier,
        RealValue < RationalEmbedding.ToReal RationalValue
```
-/
structure RealExtension
    (SelectedRationalModel : RationalModel.{u}) where
  RealModel : RealModel.{u}
  RationalEmbedding :
    RationalEmbeddingIntoReal SelectedRationalModel RealModel
  RationalEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedRationalModel.Carrier,
        RealValue < RationalEmbedding.ToReal RationalValue

/-! ## Smoke tests: fluent mixin theorems land on model carriers -/

example (M : IntegerModel) (a b : M.Carrier) : a + b = b + a :=
  AddCommutative a b

example (M : RationalModel) (a b : M.Carrier) (h : a < b) :
    ∃ middle, a < middle ∧ middle < b :=
  ExistsBetween a b h

example (M : RealModel) :
    LRA.Order.LeastUpperBoundProperty
      (Set M.Carrier) (fun a b : M.Carrier => a ≤ b) :=
  Completeness

example (a b : mathlibIntegerModel.Carrier) : a * b = b * a :=
  MulCommutative a b

end LRA.UniversalAlgebra.Models
