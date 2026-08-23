import LRA.NumberSystems.Carriers.Definition
import LRA.NumberSystems.WholeNumbers.Constructions.Landau
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs
import LRA.NumberSystems.Integers.Constructions.Tao
import LRA.NumberSystems.Integers.Constructions.Mendelson

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

end LRA.NumberSystems.Carriers
