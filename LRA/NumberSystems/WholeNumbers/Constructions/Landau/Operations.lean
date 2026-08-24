import LRA.NumberSystems.WholeNumbers.Constructions.Landau.WellFoundedness
import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.WholeNumbers.Constructions.Landau

open LRA.NumberSystems.NaturalNumbers.Constructions.Landau

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

                                                                            
noncomputable def addition : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, right => right
  | left, none => left
  | some left, some right =>
      some (LandauAddition natural_data.model left right)

                                                                              
noncomputable def multiplication : Carrier natural_data → Carrier natural_data → Carrier natural_data
  | none, _ => none
  | _, none => none
  | some left, some right =>
      some (LandauMultiplication natural_data.model left right)

end LRA.NumberSystems.WholeNumbers.Constructions.Landau
