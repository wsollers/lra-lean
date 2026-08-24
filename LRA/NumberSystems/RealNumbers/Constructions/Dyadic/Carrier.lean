
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

universe u

/--
`Digit` TODO

Predicate logic:

  inductive Digit where
  | zero
  | one
  deriving DecidableEq

Predicate logic (unfolded):

  inductive Digit where
  | zero
  | one
  deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Digit where
  | zero
  | one
  deriving DecidableEq
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
inductive Digit where
  | zero
  | one
  deriving DecidableEq

/--
`FractionalDigits` TODO

Predicate logic:

  abbrev FractionalDigits := Nat → Digit

Predicate logic (unfolded):

  abbrev FractionalDigits := Nat → Digit (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev FractionalDigits := Nat → Digit
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev FractionalDigits := Nat → Digit

/--
`IsBinaryDigitSequence` TODO

Predicate logic:

  ∀ (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits) (index : Nat), Or (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero) (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one)

Predicate logic (unfolded):

  ∀ (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits) (index : Nat), Or (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero) (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one)

Logical form (Lean):

```lean
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, Or.inl, Or.inr, cases, rcases, unfold

-/
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one

/--
`IsCanonicalFractionalDigits` TODO

Predicate logic:

  ∀ (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits), (LRA.NumberSystems.RealNumbers.Dyadic.IsBinaryDigitSequence digits ∧ ¬ Exists fun threshold => ∀ (index : Nat), instLENat.le threshold index → digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one)

Predicate logic (unfolded):

  ∀ (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits), (∀ (index : Nat), Or (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero) (digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one) ∧ (Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.one) → False)

Logical form (Lean):

```lean
def IsCanonicalFractionalDigits (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def IsCanonicalFractionalDigits (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one

/--
`CanonicalFraction` TODO

Predicate logic:

  structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits

Predicate logic (unfolded):

  structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits
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
structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits

/--
`PositiveBinaryNumeral` TODO

Predicate logic:

  structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one

Predicate logic (unfolded):

  structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one

/--
`WholeBinaryNumeral` TODO

Predicate logic:

  inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral)

Predicate logic (unfolded):

  inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral)
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
inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral)

/--
`IsZeroCanonicalFraction` TODO

Predicate logic:

  ∀ (fraction : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction) (index : Nat), fraction.Digits index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero

Predicate logic (unfolded):

  ∀ (fraction : LRA.NumberSystems.RealNumbers.Dyadic.CanonicalFraction) (index : Nat), fraction.1 index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero

Logical form (Lean):

```lean
def IsZeroCanonicalFraction (fraction : CanonicalFraction) : Prop :=
  ∀ index, fraction.Digits index = Digit.zero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsZeroCanonicalFraction (fraction : CanonicalFraction) : Prop :=
  ∀ index, fraction.Digits index = Digit.zero

/--
`UnsignedExpansion` TODO

Predicate logic:

  structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction

Predicate logic (unfolded):

  structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction
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
structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction

/--
`IsZeroUnsignedExpansion` TODO

Predicate logic:

  ∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.UnsignedExpansion), (expansion.IntegerPart = LRA.NumberSystems.RealNumbers.Dyadic.WholeBinaryNumeral.zero ∧ LRA.NumberSystems.RealNumbers.Dyadic.IsZeroCanonicalFraction expansion.FractionalPart)

Predicate logic (unfolded):

  ∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.UnsignedExpansion), (expansion.1 = LRA.NumberSystems.RealNumbers.Dyadic.WholeBinaryNumeral.zero ∧ ∀ (index : Nat), expansion.FractionalPart.1 index = LRA.NumberSystems.RealNumbers.Dyadic.Digit.zero)

Logical form (Lean):

```lean
def IsZeroUnsignedExpansion (expansion : UnsignedExpansion) : Prop :=
  expansion.IntegerPart = WholeBinaryNumeral.zero ∧
    IsZeroCanonicalFraction expansion.FractionalPart
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def IsZeroUnsignedExpansion (expansion : UnsignedExpansion) : Prop :=
  expansion.IntegerPart = WholeBinaryNumeral.zero ∧
    IsZeroCanonicalFraction expansion.FractionalPart

/--
`NonzeroUnsignedExpansion` TODO

Predicate logic:

  structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude

Predicate logic (unfolded):

  structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude
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
structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude

/--
`Sign` TODO

Predicate logic:

  inductive Sign where
  | negative
  | positive
  deriving DecidableEq

Predicate logic (unfolded):

  inductive Sign where
  | negative
  | positive
  deriving DecidableEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Sign where
  | negative
  | positive
  deriving DecidableEq
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
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

/--
`Expansion` TODO

Predicate logic:

  inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion)

Predicate logic (unfolded):

  inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion)
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
inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion)

/--
`DigitValue` TODO

Predicate logic:

  def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1

Predicate logic (unfolded):

  def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1

/--
`PowerOfTwo` TODO

Predicate logic:

  def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1)

Predicate logic (unfolded):

  def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1)

/--
`PositiveBinaryNumeralPartialValue` TODO

Predicate logic:

  def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count

Predicate logic (unfolded):

  def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count

/--
`PositiveBinaryNumeralValue` TODO

Predicate logic:

  def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1)

Predicate logic (unfolded):

  def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1)
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
def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1)

/--
`RationalDyadicApproximationData` TODO

Predicate logic:

  structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData

Predicate logic (unfolded):

  structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData
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
structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData

variable (dyadicData : RationalDyadicApproximationData.{u})

/--
`Rational` TODO

Predicate logic:

  abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier

Predicate logic (unfolded):

  abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier
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
abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier

/--
`Integer` TODO

Predicate logic:

  abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier

Predicate logic (unfolded):

  abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier
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
abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier

/--
`CauchyCarrier` TODO

Predicate logic:

  abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData

Predicate logic (unfolded):

  abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData
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
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData

/--
`RationalDyadicApproximationData.SelectedRealCarrier` TODO

Predicate logic:

  abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier

Predicate logic (unfolded):

  abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier
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
abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier

/--
`RationalDyadicApproximationData.ToCauchyCarrier` TODO

Predicate logic:

  def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq

Predicate logic (unfolded):

  def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq

/--
`RationalDyadicApproximationData.FromCauchyCarrier` TODO

Predicate logic:

  def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm

Predicate logic (unfolded):

  def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm

/--
`RationalDyadicApproximationData.RationalToCauchy` TODO

Predicate logic:

  def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value)

/--
`RationalDyadicApproximationData.CauchyZero` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier)
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
def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier)

/--
`RationalDyadicApproximationData.CauchyOne` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier)
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
def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier)

/--
`RationalDyadicApproximationData.CauchyAddition` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second)

/--
`RationalDyadicApproximationData.CauchyNegation` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value)

/--
`RationalDyadicApproximationData.CauchyMultiplication` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second)

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second)

/--
`RationalDyadicApproximationData.CauchyInverse` TODO

Predicate logic:

  def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹

Predicate logic (unfolded):

  def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹

/--
`RationalDyadicApproximationData.CauchyStrictOrder` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (a a_1 : LRA.NumberSystems.RealNumbers.Dyadic.CauchyCarrier dyadicData), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (dyadicData.FromCauchyCarrier a) (dyadicData.FromCauchyCarrier a_1)

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (a a_1 : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1), dyadicData.CauchyRealExtension.RealModel.ltInst.1 (.rec = a⋯) (.rec = a_1⋯)

Logical form (Lean):

```lean
def RationalDyadicApproximationData.CauchyStrictOrder
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData → Prop :=
  fun first second =>
    dyadicData.FromCauchyCarrier first <
      dyadicData.FromCauchyCarrier second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def RationalDyadicApproximationData.CauchyStrictOrder
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData → Prop :=
  fun first second =>
    dyadicData.FromCauchyCarrier first <
      dyadicData.FromCauchyCarrier second

/--
`IsDyadicRational` TODO

Predicate logic:

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (value : LRA.NumberSystems.RealNumbers.Dyadic.Rational dyadicData), Exists fun numerator => Exists fun exponent => value = instHMul.hMul (dyadicData.RationalSystem.IntegerEmbedding.ToField numerator) (dyadicData.RationalSystem.FieldModel.invInst.inv (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadicData.RationalSystem exponent))

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (value : dyadicData.RationalSystem.FieldModel.1), Exists fun numerator => Exists fun exponent => value = instHMul.1 (dyadicData.RationalSystem.IntegerEmbedding.1 numerator) (dyadicData.RationalSystem.FieldModel.invInst.1 (LRA.NumberSystems.RealNumbers.Dyadic.PowerOfTwo dyadicData.1 exponent))

Logical form (Lean):

```lean
def IsDyadicRational (value : Rational dyadicData) : Prop :=
  ∃ numerator : Integer dyadicData,
    ∃ exponent : Nat,
      value =
        dyadicData.RationalSystem.IntegerEmbedding.ToField numerator *
          (PowerOfTwo dyadicData.RationalSystem exponent)⁻¹
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def IsDyadicRational (value : Rational dyadicData) : Prop :=
  ∃ numerator : Integer dyadicData,
    ∃ exponent : Nat,
      value =
        dyadicData.RationalSystem.IntegerEmbedding.ToField numerator *
          (PowerOfTwo dyadicData.RationalSystem exponent)⁻¹

end LRA.NumberSystems.RealNumbers.Dyadic
