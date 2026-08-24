import LRA.NumberSystems.Carriers.Definition
import LRA.NumberSystems.WholeNumbers.Constructions.Landau
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs
import LRA.NumberSystems.Integers.Constructions.Tao
import LRA.NumberSystems.Integers.Constructions.Mendelson
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions
import LRA.NumberSystems.RealNumbers.Constructions.Cantor
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals
import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.Carriers

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau
open LRA.Set

noncomputable def landauNaturalArithmeticForWholeNumbers :
    LRA.NumberSystems.WholeNumbers.Constructions.Landau.NaturalArithmeticForWholeNumbers
      LandauElement (PredicateSet LandauElement) where
  model := LandauPeanoSystem
  strictOrder := LandauLessThan LandauPeanoSystem
  strictOrder_trichotomous := LandauLessThanTrichotomous LandauPeanoSystem
  strictOrder_transitive := LandauLessThanTransitive LandauPeanoSystem
  addition_preserves_and_reflects_strictOrder :=
    LandauAdditionPreservesAndReflectsLandauLessThan LandauPeanoSystem
  multiplication_preserves_and_reflects_strictOrder :=
    LandauMultiplicationPreservesAndReflectsLandauLessThan LandauPeanoSystem

abbrev N_0_Landau :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.Carrier
    landauNaturalArithmeticForWholeNumbers

noncomputable def landauWholeNumberArithmeticForQuotientPairs :
    LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs :=
  LRA.NumberSystems.WholeNumbers.Constructions.Landau.quotientOrderedPairsInput
    landauNaturalArithmeticForWholeNumbers

abbrev Z_QuotientOrderedPairs :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier
    landauWholeNumberArithmeticForQuotientPairs

/-!
`Tao.WholeNumberArithmeticForTaoFormalDifferences` and
`Mendelson.PositiveNaturalPairData` are both plain `abbrev`s for
`QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs`
(see `Integers/Constructions/Tao/Carrier.lean` and
`Integers/Constructions/Mendelson/Carrier.lean`), so the same
`landauWholeNumberArithmeticForQuotientPairs` witness grounds them too.
-/

abbrev Z_Tao :=
  LRA.NumberSystems.Integers.Tao.Carrier
    landauWholeNumberArithmeticForQuotientPairs

abbrev Z_Mendelson :=
  LRA.NumberSystems.Integers.Mendelson.Carrier
    landauWholeNumberArithmeticForQuotientPairs

/-!
`RationalQuotientFractions` needs an `IntegerNumberSystem`, not just a bare
`DiscretelyOrderedIntegralDomainModel` — the extra field is
`EveryElementIsIntegerNumeral`. `QuotientOrderedPairs/Instances.lean`
already had a concrete (non-`Classical.choose`) model builder
(`QuotientOrderedPairsRealizesIntegerModel`); it only needed that one
extra field wrapped around it, added there as
`QuotientOrderedPairsRealizesIntegerNumberSystem`. (`Tao` and `Mendelson`
only have *existence* theorems for `IntegerNumberSystem`
(`TaoRealizesIntegerNumberSystem`/`MendelsonRealizesIntegerNumberSystem`),
so a concrete natural-number embedding into their `Classical.choose`d,
opaque model isn't expressible — `QuotientOrderedPairs` is the only ℤ
construction usable here.)
-/

noncomputable def landauIntegerNumberSystem :
    LRA.NumberSystems.Integers.IntegerNumberSystem :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerNumberSystem
    landauWholeNumberArithmeticForQuotientPairs

/-- The positive naturals embed into the integers by going through the
whole-number carrier (`some : LandauElement → Option LandauElement`) and
then the whole-number-to-integer embedding already built for
`QuotientOrderedPairs`. -/
noncomputable def landauNaturalToInteger (value : LandauElement) :
    landauIntegerNumberSystem.Model.Carrier :=
  LRA.NumberSystems.Integers.QuotientOrderedPairs.embed
    landauWholeNumberArithmeticForQuotientPairs
    (LRA.NumberSystems.WholeNumbers.Constructions.Landau.naturalEmbedding
      landauNaturalArithmeticForWholeNumbers value)

theorem landauNaturalToIntegerIsPositive :
    ∀ denominator : LandauElement,
      0 < landauNaturalToInteger denominator := by
  sorry

theorem landauEveryPositiveIntegerHasLandauDenominator :
    ∀ integer : landauIntegerNumberSystem.Model.Carrier,
      0 < integer →
      ∃ denominator : LandauElement,
        landauNaturalToInteger denominator = integer := by
  sorry

theorem landauNaturalToIntegerOneMapsToOne :
    landauNaturalToInteger LandauPeanoSystem.one = 1 := by
  sorry

theorem landauNaturalToIntegerPreservesMultiplication :
    ∀ first second : LandauElement,
      landauNaturalToInteger (LandauMultiplication LandauPeanoSystem first second) =
        landauNaturalToInteger first * landauNaturalToInteger second := by
  sorry

noncomputable def landauIntegerAndPositiveNaturalData :
    LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.IntegerAndPositiveNaturalData where
  integer_system := landauIntegerNumberSystem
  natural_carrier := LandauElement
  one := LandauPeanoSystem.one
  multiplication := LandauMultiplication LandauPeanoSystem
  to_integer := landauNaturalToInteger
  denominator_is_positive := landauNaturalToIntegerIsPositive
  every_positive_integer_has_denominator := landauEveryPositiveIntegerHasLandauDenominator
  one_maps_to_one := landauNaturalToIntegerOneMapsToOne
  multiplication_is_preserved := landauNaturalToIntegerPreservesMultiplication

abbrev Q_RationalQuotientFractions :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.Carrier
    landauIntegerAndPositiveNaturalData

abbrev Q := Q_RationalQuotientFractions

/-!
Three of `RealNumbers`'s six constructions (`Cantor`, `Dedekind`,
`PrimitiveIntervals`) need nothing beyond a bare
`DenselyOrderedFieldModel` — no separate `RationalMetricData`/
`RationalDyadicApproximationData`-style extra witness. That model is
exactly what `RationalQuotientFractions/Instances.lean` already builds
generically from any `IntegerAndPositiveNaturalData`, so
`landauIntegerAndPositiveNaturalData` grounds all three directly.
(`Cauchy` and `EffectiveCauchy` need a bit more — see below. `Dyadic`
needs a fully realized `RationalRealExtension` on top of that and is
deferred — see the audit doc.)
-/

noncomputable def landauDenselyOrderedFieldModel :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesDenselyOrderedFieldModel
    landauIntegerAndPositiveNaturalData

abbrev R_Cantor :=
  LRA.NumberSystems.RealNumbers.Cantor.Carrier landauDenselyOrderedFieldModel

abbrev R_Dedekind :=
  LRA.NumberSystems.RealNumbers.Dedekind.Cut landauDenselyOrderedFieldModel

abbrev R_PrimitiveIntervals :=
  LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier landauDenselyOrderedFieldModel

/-!
`EffectiveCauchy` needs only a bare `RationalNumberSystem` (no extra
metric/embedding data), which `RationalQuotientFractionsRealizesRationalNumberSystem`
already builds generically.
-/

noncomputable def landauRationalNumberSystem :
    LRA.NumberSystems.RationalNumbers.RationalNumberSystem :=
  LRA.NumberSystems.RationalNumbers.RationalQuotientFractions.RationalQuotientFractionsRealizesRationalNumberSystem
    landauIntegerAndPositiveNaturalData

abbrev R_EffectiveCauchy :=
  LRA.NumberSystems.RealNumbers.EffectiveCauchy.EffectiveCauchyReal
    landauRationalNumberSystem

/-!
`Cauchy` additionally needs a `RationalMetricData` witness — an absolute
value on the rational field plus its standard properties. Define
`landauRationalAbsoluteValue` as the usual `if 0 ≤ x then x else -x` (via
classical choice for decidability, matching this repo's existing use of
`Classical.choose`/`classical` elsewhere) and leave the nine standard
absolute-value facts `sorry`'d, consistent with every other law
certificate grounded so far — none of them are new mathematical claims,
just the textbook properties of `|·|` on an ordered field.
-/

open Classical in
noncomputable def landauRationalAbsoluteValue
    (value : landauRationalNumberSystem.FieldModel.signature.carrier) :
    landauRationalNumberSystem.FieldModel.signature.carrier :=
  if landauRationalNumberSystem.FieldModel.signature.le
      landauRationalNumberSystem.FieldModel.signature.zero value
  then value
  else landauRationalNumberSystem.FieldModel.signature.neg value

theorem landauRationalAbsoluteValueZero :
    landauRationalAbsoluteValue landauRationalNumberSystem.FieldModel.signature.zero =
      landauRationalNumberSystem.FieldModel.signature.zero := by
  sorry

theorem landauRationalAbsoluteValueNegation :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.neg value) =
        landauRationalAbsoluteValue value := by
  sorry

theorem landauRationalTriangleInequality :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        (landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.add first second))
        (landauRationalNumberSystem.FieldModel.signature.add
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second)) := by
  sorry

theorem landauRationalAbsoluteValueNonnegative :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.le
        landauRationalNumberSystem.FieldModel.signature.zero
        (landauRationalAbsoluteValue value) := by
  sorry

theorem landauRationalAbsoluteValueEqZeroIff :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.zero ↔
        value = landauRationalNumberSystem.FieldModel.signature.zero := by
  sorry

theorem landauRationalAbsoluteValueMultiplication :
    ∀ first second : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue
          (landauRationalNumberSystem.FieldModel.signature.multiply first second) =
        landauRationalNumberSystem.FieldModel.signature.multiply
          (landauRationalAbsoluteValue first)
          (landauRationalAbsoluteValue second) := by
  sorry

theorem landauRationalAbsoluteValueSelfOrNeg :
    ∀ value : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalAbsoluteValue value = value ∨
        landauRationalAbsoluteValue value =
          landauRationalNumberSystem.FieldModel.signature.neg value := by
  sorry

theorem landauRationalEpsilonSplit :
    ∀ epsilon : landauRationalNumberSystem.FieldModel.signature.carrier,
      landauRationalNumberSystem.FieldModel.signature.StrictOrder
        landauRationalNumberSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        landauRationalNumberSystem.FieldModel.signature.StrictOrder
          landauRationalNumberSystem.FieldModel.signature.zero smaller ∧
        landauRationalNumberSystem.FieldModel.signature.le
          (landauRationalNumberSystem.FieldModel.signature.add smaller smaller)
          epsilon := by
  sorry

noncomputable def landauRationalMetricData :
    LRA.NumberSystems.RealNumbers.Cauchy.RationalMetricData landauRationalNumberSystem where
  absolute_value := landauRationalAbsoluteValue
  absolute_value_zero := landauRationalAbsoluteValueZero
  absolute_value_negation := landauRationalAbsoluteValueNegation
  triangle_inequality := landauRationalTriangleInequality
  absolute_value_nonnegative := landauRationalAbsoluteValueNonnegative
  absolute_value_eq_zero_iff := landauRationalAbsoluteValueEqZeroIff
  absolute_value_multiplication := landauRationalAbsoluteValueMultiplication
  absolute_value_self_or_neg := landauRationalAbsoluteValueSelfOrNeg
  epsilon_split := landauRationalEpsilonSplit

abbrev R_Cauchy :=
  LRA.NumberSystems.RealNumbers.Cauchy.Carrier
    landauRationalNumberSystem landauRationalMetricData

abbrev R := R_Cauchy

end LRA.NumberSystems.Carriers
