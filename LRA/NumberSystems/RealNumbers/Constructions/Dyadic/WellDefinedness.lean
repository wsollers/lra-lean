
import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/--
`FractionalPartialSumsAreCauchy` TODO

Predicate logic:

  (∀ digits ∈ FractionalDigits), Cauchy.is_cauchy dyadicData.RationalSystem dyadicData.AbsoluteValueData (FractionalPartialSum dyadicData digits)

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (digits : LRA.NumberSystems.RealNumbers.Dyadic.FractionalDigits) (epsilon : dyadicData.RationalSystem.FieldModel.signature.toCarrierBundle.1), dyadicData.RationalSystem.FieldModel.signature.toOrderedRingSignature.2 dyadicData.RationalSystem.FieldModel.signature.toZeroOneBundle.2 epsilon → Exists fun threshold => ∀ (first_index second_index : Nat), instLENat.1 threshold first_index → instLENat.1 threshold second_index → dyadicData.RationalSystem.FieldModel.signature.toOrderedRingSignature.2 (dyadicData.AbsoluteValueData.1 (dyadicData.RationalSystem.FieldModel.signature.toBooleanRingOperationBundle.2 (LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits first_index) (dyadicData.RationalSystem.FieldModel.signature.neg (LRA.NumberSystems.RealNumbers.Dyadic.FractionalPartialSum dyadicData digits second_index)))) epsilon

Logical form (Lean):

```lean
theorem FractionalPartialSumsAreCauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadicData.RationalSystem
      dyadicData.AbsoluteValueData
      (FractionalPartialSum dyadicData digits)
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
theorem FractionalPartialSumsAreCauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadicData.RationalSystem
      dyadicData.AbsoluteValueData
      (FractionalPartialSum dyadicData digits) := by
  sorry

/--
`FractionalValue` TODO

Predicate logic:

  def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩

Predicate logic (unfolded):

  def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩
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
def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩

/--
`WholeNumeralValue` TODO

Predicate logic:

  def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral)

Predicate logic (unfolded):

  def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral)
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
def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral)

/--
`UnsignedValue` TODO

Predicate logic:

  def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart)

Predicate logic (unfolded):

  def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart)
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
def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart)

/--
`Value` TODO

Predicate logic:

  def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude)

Predicate logic (unfolded):

  def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude)
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
def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude)

/--
`RepresentationExists` TODO

Predicate logic:

  ∃ expansion ∈ Expansion, Value dyadicData expansion = realValue

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (realValue : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1), Exists fun expansion => LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) expansion = realValue

Logical form (Lean):

```lean
theorem RepresentationExists
    (realValue : CauchyCarrier dyadicData) :
    ∃ expansion : Expansion,
      Value dyadicData expansion = realValue
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem RepresentationExists
    (realValue : CauchyCarrier dyadicData) :
    ∃ expansion : Expansion,
      Value dyadicData expansion = realValue := by
  sorry

/--
`ValueIsInjective` TODO

Predicate logic:

  ∀ first second : Expansion, Value dyadicData first = Value dyadicData second → first = second

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData) (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) first = LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) second → first = second

Logical form (Lean):

```lean
theorem ValueIsInjective :
    ∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second
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
theorem ValueIsInjective :
    ∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second := by
  sorry

/--
`ValueIsBijective` TODO

Predicate logic:

  ∀ realValue ∈ CauchyCarrier dyadicData, ∃ expansion ∈ Expansion, Value dyadicData expansion = realValue ∧ ∀ first second ∈ Expansion, Value dyadicData first = Value dyadicData second → first = second

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), (∀ (realValue : Quot (LRA.NumberSystems.RealNumbers.Cauchy.representative_setoid dyadicData.RationalSystem dyadicData.AbsoluteValueData).1), Exists fun expansion => LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) expansion = realValue ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) first = LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) second → first = second)

Logical form (Lean):

```lean
theorem ValueIsBijective :
    (∀ realValue : CauchyCarrier dyadicData,
      ∃ expansion : Expansion,
        Value dyadicData expansion = realValue) ∧
    (∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem ValueIsBijective :
    (∀ realValue : CauchyCarrier dyadicData,
      ∃ expansion : Expansion,
        Value dyadicData expansion = realValue) ∧
    (∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second) := by
  sorry

/--
`Bijection` TODO

Predicate logic:

  structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value

Predicate logic (unfolded):

  structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value
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
structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value

/--
`BinaryRealBijectionExists` TODO

Predicate logic:

  ∃ bridge ∈ Bijection Expansion (CauchyCarrier dyadicData), ∀ expansion : Expansion, bridge.Forward expansion = Value dyadicData expansion

Predicate logic (unfolded):

  ∀ (dyadicData : LRA.NumberSystems.RealNumbers.Dyadic.RationalDyadicApproximationData), Exists fun bridge => ∀ (expansion : LRA.NumberSystems.RealNumbers.Dyadic.Expansion), bridge.1 expansion = LRA.NumberSystems.RealNumbers.Dyadic.Expansion.rec ((fun _ => .rec = 0⋯) Unit.unit) (fun Sign Magnitude => (fun Sign Magnitude => LRA.NumberSystems.RealNumbers.Dyadic.Sign.rec ((fun magnitude => cast ⋯ (dyadicData.CauchyRealExtension.RealModel.negInst.neg (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.UnsignedValue dyadicData magnitude.Magnitude)))) Magnitude) ((fun magnitude => dyadicData.ToCauchyCarrier (instHAdd.hAdd (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.WholeNumeralValue dyadicData magnitude.Magnitude.IntegerPart)) (dyadicData.FromCauchyCarrier (LRA.NumberSystems.RealNumbers.Dyadic.FractionalValue dyadicData magnitude.Magnitude.FractionalPart)))) Magnitude) Sign) Sign Magnitude) expansion

Logical form (Lean):

```lean
theorem BinaryRealBijectionExists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadicData),
      ∀ expansion : Expansion,
        bridge.Forward expansion = Value dyadicData expansion
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
theorem BinaryRealBijectionExists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadicData),
      ∀ expansion : Expansion,
        bridge.Forward expansion = Value dyadicData expansion := by
  sorry

/--
`BinaryRealBijection` TODO

Predicate logic:

  noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData)

Predicate logic (unfolded):

  noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData)
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
noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData)

end LRA.NumberSystems.RealNumbers.Dyadic
