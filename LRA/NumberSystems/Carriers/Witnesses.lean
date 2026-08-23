import LRA.NumberSystems.Carriers.Definition
import LRA.NumberSystems.WholeNumbers.Constructions.Landau
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs

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

end LRA.NumberSystems.Carriers
