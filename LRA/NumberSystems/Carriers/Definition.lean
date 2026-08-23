import LRA.NumberSystems.NaturalNumbers.Constructions.Landau
import LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann
import LRA.NumberSystems.NaturalNumbers.Constructions.Presburger
import LRA.NumberSystems.Integers.Constructions.Polish
import LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.LStructure

namespace LRA.NumberSystems.Carriers

abbrev N_Landau :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauElement

abbrev N_VonNeumann :=
  LRA.NumberSystems.NaturalNumbers.Constructions.VonNeumann.NaturalElement

abbrev N_Presburger :=
  LRA.NumberSystems.NaturalNumbers.Constructions.Presburger.PresburgerElement

abbrev N := N_Landau

abbrev N_0 := N_VonNeumann

abbrev Z_Polish :=
  LRA.NumberSystems.Integers.Polish.TwoSidedSuccessor.Z

abbrev Z := Z_Polish

abbrev GaussianInt_OrderedPairs :=
  LRA.NumberSystems.GaussianIntegers.Interface.ModelTheory.ActiveGaussianInteger

abbrev GaussianInt := GaussianInt_OrderedPairs

end LRA.NumberSystems.Carriers
