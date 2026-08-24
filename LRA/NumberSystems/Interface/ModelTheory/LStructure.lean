
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model
import LRA.AlgebraicStructures
import LRA.Order
namespace LRA.NumberSystems.Interface.ModelTheory

open LRA.AlgebraicStructures
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory
open LRA.Order

universe u

/--
`DiscretelyOrderedIntegralDomainModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
  [discreteCert : OrderDiscretenessLaw Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

/--
`DiscretelyOrderedIntegralDomainModel.ofCarrier` TODO

Predicate logic:

  def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }

Predicate logic (unfolded):

  def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def DiscretelyOrderedIntegralDomainModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [IntegralDomainLaws R] [LinearOrderLaws R]
    [StrictOrderCompatibilityLaw R]
    [AdditionRespectsOrderLaws R] [MultiplicationRespectsOrderLaws R]
    [OrderDiscretenessLaw R] : DiscretelyOrderedIntegralDomainModel :=
  { Carrier := R }

/--
`DiscretelyOrderedIntegralDomainModel.signature` TODO

Predicate logic:

  def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

Predicate logic (unfolded):

  def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def DiscretelyOrderedIntegralDomainModel.signature (M : DiscretelyOrderedIntegralDomainModel) : OrderedRingSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  le := (· ≤ ·)
  StrictOrder := (· < ·)

/--
`DenselyOrderedFieldModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
  [denseCert : DenseOrderLaw Carrier] (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

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

/--
`DenselyOrderedFieldModel.ofCarrier` TODO

Predicate logic:

  def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }

Predicate logic (unfolded):

  def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def DenselyOrderedFieldModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] : DenselyOrderedFieldModel :=
  { Carrier := R }

/--
`DenselyOrderedFieldModel.signature` TODO

Predicate logic:

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

Predicate logic (unfolded):

  def DenselyOrderedFieldModel.signature (M : DenselyOrderedFieldModel) : OrderedFieldSignature where
  carrier := M.Carrier
  zero := 0
  one := 1
  add := (· + ·)
  neg := (- ·)
  multiply := (· * ·)
  inv := (·⁻¹)
  le := (· ≤ ·)
  StrictOrder := (· < ·) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
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

/--
`RealModel` TODO

Predicate logic:

  structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]

Predicate logic (unfolded):

  structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)] (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure RealModel extends DenselyOrderedFieldModel where
  [completeCert :
    OrderCompletenessLaws Carrier (Set Carrier)]

attribute [instance] RealModel.completeCert

/--
`RealModel.ofCarrier` TODO

Predicate logic:

  def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

Predicate logic (unfolded):

  def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R } (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def RealModel.ofCarrier (R : Type u)
    [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LT R] [LE R]
    [OrderedFieldLaws R] [StrictOrderCompatibilityLaw R]
    [DenseOrderLaw R] [OrderCompletenessLaws R (Set R)] : RealModel :=
  { Carrier := R }

/--
`RealModel.signature` TODO

Predicate logic:

  def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature

Predicate logic (unfolded):

  def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def RealModel.signature (M : RealModel) : OrderedFieldSignature :=
  M.toDenselyOrderedFieldModel.signature

/--
`mathlibDiscretelyOrderedIntegralDomainModel` TODO

Predicate logic:

  def mathlibDiscretelyOrderedIntegralDomainModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int

Predicate logic (unfolded):

  def mathlibDiscretelyOrderedIntegralDomainModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibDiscretelyOrderedIntegralDomainModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def mathlibDiscretelyOrderedIntegralDomainModel : DiscretelyOrderedIntegralDomainModel := DiscretelyOrderedIntegralDomainModel.ofCarrier Int

/--
`mathlibDenselyOrderedFieldModel` TODO

Predicate logic:

  def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat

Predicate logic (unfolded):

  def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def mathlibDenselyOrderedFieldModel : DenselyOrderedFieldModel :=
  DenselyOrderedFieldModel.ofCarrier Rat

/--
`mathlibRealModel` TODO

Predicate logic:

  noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real

Predicate logic (unfolded):

  noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
noncomputable def mathlibRealModel : RealModel := RealModel.ofCarrier Real

/--
`OrderedRingEmbeddingIntoDenseOrderedField` TODO

Predicate logic:

  structure OrderedRingEmbeddingIntoDenseOrderedField
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToField :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToField first = ToField second → first = second
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition :
    ∀ first second,
      ToField (first + second) = ToField first + ToField second
  PreservesNegation :
    ∀ value, ToField (-value) = -(ToField value)
  PreservesMultiplication :
    ∀ first second,
      ToField (first * second) = ToField first * ToField second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToField first ≤ ToField second ↔ first ≤ second

Predicate logic (unfolded):

  structure OrderedRingEmbeddingIntoDenseOrderedField
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToField :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToField first = ToField second → first = second
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition :
    ∀ first second,
      ToField (first + second) = ToField first + ToField second
  PreservesNegation :
    ∀ value, ToField (-value) = -(ToField value)
  PreservesMultiplication :
    ∀ first second,
      ToField (first * second) = ToField first * ToField second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToField first ≤ ToField second ↔ first ≤ second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure OrderedRingEmbeddingIntoDenseOrderedField
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToField :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToField first = ToField second → first = second
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition :
    ∀ first second,
      ToField (first + second) = ToField first + ToField second
  PreservesNegation :
    ∀ value, ToField (-value) = -(ToField value)
  PreservesMultiplication :
    ∀ first second,
      ToField (first * second) = ToField first * ToField second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToField first ≤ ToField second ↔ first ≤ second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure OrderedRingEmbeddingIntoDenseOrderedField
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel)
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel) where
  ToField :
    SelectedIntegerModel.Carrier → SelectedDenselyOrderedFieldModel.Carrier
  injective :
    ∀ first second,
      ToField first = ToField second → first = second
  PreservesZero : ToField 0 = 0
  PreservesOne : ToField 1 = 1
  PreservesAddition :
    ∀ first second,
      ToField (first + second) = ToField first + ToField second
  PreservesNegation :
    ∀ value, ToField (-value) = -(ToField value)
  PreservesMultiplication :
    ∀ first second,
      ToField (first * second) = ToField first * ToField second
  PreservesAndReflectsOrder :
    ∀ first second,
      ToField first ≤ ToField second ↔ first ≤ second

/--
`ArchimedeanDenseOrderedFieldExtension` TODO

Predicate logic:

  structure ArchimedeanDenseOrderedFieldExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToField IntegerValue

Predicate logic (unfolded):

  structure ArchimedeanDenseOrderedFieldExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToField IntegerValue (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure ArchimedeanDenseOrderedFieldExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToField IntegerValue
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
structure ArchimedeanDenseOrderedFieldExtension
    (SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  DenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}
  IntegerEmbedding :
    OrderedRingEmbeddingIntoDenseOrderedField SelectedIntegerModel DenselyOrderedFieldModel
  ArchimedeanProperty :
    ∀ RationalValue : DenselyOrderedFieldModel.Carrier,
      ∃ IntegerValue : SelectedIntegerModel.Carrier,
        RationalValue < IntegerEmbedding.ToField IntegerValue

/--
`ArchimedeanDenseOrderedFieldExtensionImpliesArchimedeanLaw` TODO

Predicate logic:

  LRA.AlgebraicStructures.ArchimedeanLaw extension.DenselyOrderedFieldModel.Carrier

Predicate logic (unfolded):

  ∀ {SelectedIntegerModel : LRA.NumberSystems.Interface.ModelTheory.DiscretelyOrderedIntegralDomainModel} (extension : LRA.NumberSystems.Interface.ModelTheory.ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel), LRA.AlgebraicStructures.ArchimedeanLaw extension.DenselyOrderedFieldModel.1

Logical form (Lean):

```lean
theorem ArchimedeanDenseOrderedFieldExtensionImpliesArchimedeanLaw
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (extension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel) :
    LRA.AlgebraicStructures.ArchimedeanLaw extension.DenselyOrderedFieldModel.Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ArchimedeanDenseOrderedFieldExtensionImpliesArchimedeanLaw
    {SelectedIntegerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (extension : ArchimedeanDenseOrderedFieldExtension SelectedIntegerModel) :
    LRA.AlgebraicStructures.ArchimedeanLaw extension.DenselyOrderedFieldModel.Carrier := by
  sorry

/--
`DenseOrderedFieldEmbeddingIntoReal` TODO

Predicate logic:

  structure DenseOrderedFieldEmbeddingIntoReal
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

Predicate logic (unfolded):

  structure DenseOrderedFieldEmbeddingIntoReal
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
    ∀ first second, ToReal first ≤ ToReal second ↔ first ≤ second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure DenseOrderedFieldEmbeddingIntoReal
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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
structure DenseOrderedFieldEmbeddingIntoReal
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

/--
`CofinalRealExtension` TODO

Predicate logic:

  structure CofinalRealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < DenseOrderedFieldEmbedding.ToReal RationalValue

Predicate logic (unfolded):

  structure CofinalRealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < DenseOrderedFieldEmbedding.ToReal RationalValue (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CofinalRealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < DenseOrderedFieldEmbedding.ToReal RationalValue
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
structure CofinalRealExtension
    (SelectedDenselyOrderedFieldModel : DenselyOrderedFieldModel.{u}) where
  RealModel : RealModel.{u}
  DenseOrderedFieldEmbedding :
    DenseOrderedFieldEmbeddingIntoReal SelectedDenselyOrderedFieldModel RealModel
  DenseOrderedFieldEmbeddingIsCofinal :
    ∀ RealValue : RealModel.Carrier,
      ∃ RationalValue : SelectedDenselyOrderedFieldModel.Carrier,
        RealValue < DenseOrderedFieldEmbedding.ToReal RationalValue

example (M : DiscretelyOrderedIntegralDomainModel) (a b : M.Carrier) : a + b = b + a :=
  AddCommutative a b

example (M : DenselyOrderedFieldModel) (a b : M.Carrier) (h : a < b) :
    ∃ middle, a < middle ∧ middle < b :=
  ExistsBetween a b h

example (M : RealModel) :
    LRA.Order.LeastUpperBoundProperty
      (Set M.Carrier) (fun a b : M.Carrier => a ≤ b) :=
  Completeness

example (a b : mathlibDiscretelyOrderedIntegralDomainModel.Carrier) : a * b = b * a :=
  MulCommutative a b

end LRA.NumberSystems.Interface.ModelTheory
