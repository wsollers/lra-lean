import LRA.NumberSystems.Carriers.Definition
import LRA.NumberSystems.WholeNumbers.Constructions.Landau
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs
import LRA.NumberSystems.Integers.Constructions.Tao
import LRA.NumberSystems.Integers.Constructions.Mendelson
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions

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

end LRA.NumberSystems.Carriers
