
import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Behavior
import LRA.NumberSystems.RationalNumbers.Interface.Definition
import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

open LRA.AlgebraicStructures
open LRA.Order
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

noncomputable instance rationalCarrierAdd
    (rationalData : IntegerAndPositiveNaturalData) :
    Add (Carrier rationalData) := ⟨addition rationalData⟩

noncomputable instance rationalCarrierMul
    (rationalData : IntegerAndPositiveNaturalData) :
    Mul (Carrier rationalData) := ⟨multiplication rationalData⟩

noncomputable instance rationalCarrierNeg
    (rationalData : IntegerAndPositiveNaturalData) :
    Neg (Carrier rationalData) := ⟨negation rationalData⟩

/--
`quotient_inverse` TODO

Predicate logic:

  noncomputable def quotient_inverse
    (rationalData : IntegerAndPositiveNaturalData) :
    Carrier rationalData → Carrier rationalData

Predicate logic (unfolded):

  noncomputable def quotient_inverse
    (rationalData : IntegerAndPositiveNaturalData) :
    Carrier rationalData → Carrier rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_inverse
    (rationalData : IntegerAndPositiveNaturalData) :
    Carrier rationalData → Carrier rationalData
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
noncomputable def quotient_inverse
    (rationalData : IntegerAndPositiveNaturalData) :
    Carrier rationalData → Carrier rationalData := by
  classical
  intro value
  by_cases valueIsZero : value = zero rationalData
  · exact zero rationalData
  · exact inverse rationalData value valueIsZero

noncomputable instance rationalCarrierInv
    (rationalData : IntegerAndPositiveNaturalData) :
    Inv (Carrier rationalData) := ⟨quotient_inverse rationalData⟩

noncomputable instance rationalCarrierZero
    (rationalData : IntegerAndPositiveNaturalData) :
    OfNat (Carrier rationalData) 0 := ⟨zero rationalData⟩

noncomputable instance rationalCarrierOne
    (rationalData : IntegerAndPositiveNaturalData) :
    OfNat (Carrier rationalData) 1 := ⟨one rationalData⟩

noncomputable instance rationalCarrierLT
    (rationalData : IntegerAndPositiveNaturalData) :
    LT (Carrier rationalData) := ⟨strict_order rationalData⟩

noncomputable instance rationalCarrierLE
    (rationalData : IntegerAndPositiveNaturalData) :
    LE (Carrier rationalData) := ⟨nonstrict_order rationalData⟩

/--
`RationalFieldCert` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), OrderedFieldLaws (Carrier rationalData)

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), LRA.AlgebraicStructures.OrderedFieldLaws (Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1)

Logical form (Lean):

```lean
theorem RationalFieldCert
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData)
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
theorem RationalFieldCert
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedFieldLaws (Carrier rationalData) := by
  sorry

/--
`RationalStrictOrderCert` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), StrictOrderCompatibilityLaw (Carrier rationalData)

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1)

Logical form (Lean):

```lean
theorem RationalStrictOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    StrictOrderCompatibilityLaw (Carrier rationalData)
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
theorem RationalStrictOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    StrictOrderCompatibilityLaw (Carrier rationalData) := by
  sorry

/--
`RationalDenseOrderCert` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), DenseOrderLaw (Carrier rationalData)

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData), LRA.Order.DenseOrderLaw (Quot (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1)

Logical form (Lean):

```lean
theorem RationalDenseOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    DenseOrderLaw (Carrier rationalData)
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
theorem RationalDenseOrderCert
    (rationalData : IntegerAndPositiveNaturalData) :
    DenseOrderLaw (Carrier rationalData) := by
  sorry

/--
`RationalQuotientFractionsRealizesRationalModel` TODO

Predicate logic:

  noncomputable def RationalQuotientFractionsRealizesRationalModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def RationalQuotientFractionsRealizesRationalModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def RationalQuotientFractionsRealizesRationalModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier
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
noncomputable def RationalQuotientFractionsRealizesRationalModel
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel where
  Carrier := Carrier rationalData
  addInst := rationalCarrierAdd rationalData
  mulInst := rationalCarrierMul rationalData
  negInst := rationalCarrierNeg rationalData
  invInst := rationalCarrierInv rationalData
  zeroInst := rationalCarrierZero rationalData
  oneInst := rationalCarrierOne rationalData
  ltInst := rationalCarrierLT rationalData
  leInst := rationalCarrierLE rationalData
  fieldCert := RationalFieldCert rationalData
  strictCert := RationalStrictOrderCert rationalData
  denseCert := RationalDenseOrderCert rationalData

/--
`RationalIntegerEmbeddingPreservesNegation` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), ∀ value : rationalData.integer_system.Model.Carrier, integer_embedding rationalData (-value) = -(integer_embedding rationalData value)

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (value : rationalData.integer_system.Model.1), Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1 { numerator := rationalData.integer_system.Model.negInst.1 value, denominator := rationalData.3 } = (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.rationalCarrierNeg rationalData).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1 { numerator := value, denominator := rationalData.3 })

Logical form (Lean):

```lean
theorem RationalIntegerEmbeddingPreservesNegation
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ value : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData (-value) = -(integer_embedding rationalData value)
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
theorem RationalIntegerEmbeddingPreservesNegation
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ value : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData (-value) = -(integer_embedding rationalData value) := by
  sorry

/--
`RationalIntegerEmbeddingPreservesOrder` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), ∀ first second : rationalData.integer_system.Model.Carrier, integer_embedding rationalData first ≤ integer_embedding rationalData second ↔ first ≤ second

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (first second : rationalData.integer_system.Model.1), (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.rationalCarrierLE rationalData).1 (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1 { numerator := first, denominator := rationalData.3 }) (Quot.mk (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.representative_setoid rationalData).1 { numerator := second, denominator := rationalData.3 }) ↔ rationalData.integer_system.Model.leInst.1 first second

Logical form (Lean):

```lean
theorem RationalIntegerEmbeddingPreservesOrder
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ first second : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData first ≤ integer_embedding rationalData second ↔
        first ≤ second
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
theorem RationalIntegerEmbeddingPreservesOrder
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ first second : rationalData.integer_system.Model.Carrier,
      integer_embedding rationalData first ≤ integer_embedding rationalData second ↔
        first ≤ second := by
  sorry

/--
`RationalIntegerEmbedding` TODO

Predicate logic:

  noncomputable def RationalIntegerEmbedding
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedRingEmbeddingIntoDenseOrderedField
      rationalData.integer_system.Model
      (RationalQuotientFractionsRealizesRationalModel rationalData) where
  ToField := integer_embedding rationalData
  injective := (integer_embedding_properties rationalData).1
  PreservesZero := (integer_embedding_properties rationalData).2.1
  PreservesOne := (integer_embedding_properties rationalData).2.2.1
  PreservesAddition := (integer_embedding_properties rationalData).2.2.2.1
  PreservesNegation := RationalIntegerEmbeddingPreservesNegation rationalData
  PreservesMultiplication := (integer_embedding_properties rationalData).2.2.2.2.1
  PreservesAndReflectsOrder := RationalIntegerEmbeddingPreservesOrder rationalData

Predicate logic (unfolded):

  noncomputable def RationalIntegerEmbedding
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedRingEmbeddingIntoDenseOrderedField
      rationalData.integer_system.Model
      (RationalQuotientFractionsRealizesRationalModel rationalData) where
  ToField := integer_embedding rationalData
  injective := (integer_embedding_properties rationalData).1
  PreservesZero := (integer_embedding_properties rationalData).2.1
  PreservesOne := (integer_embedding_properties rationalData).2.2.1
  PreservesAddition := (integer_embedding_properties rationalData).2.2.2.1
  PreservesNegation := RationalIntegerEmbeddingPreservesNegation rationalData
  PreservesMultiplication := (integer_embedding_properties rationalData).2.2.2.2.1
  PreservesAndReflectsOrder := RationalIntegerEmbeddingPreservesOrder rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def RationalIntegerEmbedding
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedRingEmbeddingIntoDenseOrderedField
      rationalData.integer_system.Model
      (RationalQuotientFractionsRealizesRationalModel rationalData) where
  ToField := integer_embedding rationalData
  injective := (integer_embedding_properties rationalData).1
  PreservesZero := (integer_embedding_properties rationalData).2.1
  PreservesOne := (integer_embedding_properties rationalData).2.2.1
  PreservesAddition := (integer_embedding_properties rationalData).2.2.2.1
  PreservesNegation := RationalIntegerEmbeddingPreservesNegation rationalData
  PreservesMultiplication := (integer_embedding_properties rationalData).2.2.2.2.1
  PreservesAndReflectsOrder := RationalIntegerEmbeddingPreservesOrder rationalData
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
noncomputable def RationalIntegerEmbedding
    (rationalData : IntegerAndPositiveNaturalData) :
    OrderedRingEmbeddingIntoDenseOrderedField
      rationalData.integer_system.Model
      (RationalQuotientFractionsRealizesRationalModel rationalData) where
  ToField := integer_embedding rationalData
  injective := (integer_embedding_properties rationalData).1
  PreservesZero := (integer_embedding_properties rationalData).2.1
  PreservesOne := (integer_embedding_properties rationalData).2.2.1
  PreservesAddition := (integer_embedding_properties rationalData).2.2.2.1
  PreservesNegation := RationalIntegerEmbeddingPreservesNegation rationalData
  PreservesMultiplication := (integer_embedding_properties rationalData).2.2.2.2.1
  PreservesAndReflectsOrder := RationalIntegerEmbeddingPreservesOrder rationalData

/--
`RationalEveryElementIsIntegerFraction` TODO

Predicate logic:

  (∀ rationalData ∈ IntegerAndPositiveNaturalData), ∀ q : (RationalQuotientFractionsRealizesRationalModel rationalData).Carrier, ∃ numerator denominator ∈ rationalData.integer_system.Model.Carrier, denominator ≠ 0 ∧ q = (RationalIntegerEmbedding rationalData).ToField numerator * ((RationalIntegerEmbedding rationalData).ToField denominator)⁻¹

Predicate logic (unfolded):

  ∀ (rationalData : LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData) (q : (LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel rationalData).1), Exists fun numerator => Exists fun denominator => (denominator = rationalData.integer_system.Model.zeroInst.1 → False ∧ q = instHMul.1 ((LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalIntegerEmbedding rationalData).1 numerator) ((LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalModel rationalData).invInst.1 ((LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalIntegerEmbedding rationalData).1 denominator)))

Logical form (Lean):

```lean
theorem RationalEveryElementIsIntegerFraction
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ q : (RationalQuotientFractionsRealizesRationalModel rationalData).Carrier,
      ∃ numerator denominator : rationalData.integer_system.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          (RationalIntegerEmbedding rationalData).ToField numerator *
            ((RationalIntegerEmbedding rationalData).ToField denominator)⁻¹
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
theorem RationalEveryElementIsIntegerFraction
    (rationalData : IntegerAndPositiveNaturalData) :
    ∀ q : (RationalQuotientFractionsRealizesRationalModel rationalData).Carrier,
      ∃ numerator denominator : rationalData.integer_system.Model.Carrier,
        denominator ≠ 0 ∧
        q =
          (RationalIntegerEmbedding rationalData).ToField numerator *
            ((RationalIntegerEmbedding rationalData).ToField denominator)⁻¹ := by
  sorry

/--
`RationalQuotientFractionsRealizesRationalNumberSystem` TODO

Predicate logic:

  noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData
  IntegerEmbedding := RationalIntegerEmbedding rationalData
  EveryElementIsIntegerFraction := RationalEveryElementIsIntegerFraction rationalData

Predicate logic (unfolded):

  noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData
  IntegerEmbedding := RationalIntegerEmbedding rationalData
  EveryElementIsIntegerFraction := RationalEveryElementIsIntegerFraction rationalData (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData
  IntegerEmbedding := RationalIntegerEmbedding rationalData
  EveryElementIsIntegerFraction := RationalEveryElementIsIntegerFraction rationalData
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
noncomputable def RationalQuotientFractionsRealizesRationalNumberSystem
    (rationalData : IntegerAndPositiveNaturalData) :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem where
  IntegerSystem := rationalData.integer_system
  FieldModel :=
    RationalQuotientFractionsRealizesRationalModel rationalData
  IntegerEmbedding := RationalIntegerEmbedding rationalData
  EveryElementIsIntegerFraction := RationalEveryElementIsIntegerFraction rationalData

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
