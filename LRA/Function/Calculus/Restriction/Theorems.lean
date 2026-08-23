import LRA.Function.Calculus.Restriction.Definition
import LRA.Function.Operations.Composition.Definition
import LRA.Function.Properties.Definition

namespace LRA.Function

universe u v w

variable {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
variable (original : LRA.Function Domain Codomain)
variable (inclusion : LRA.Function Subdomain Domain)

                                                      
theorem RestrictionRestrictsTo :
    RestrictsTo (Restriction original inclusion) original inclusion := by
  sorry

                                                             
theorem RestrictionEqualsCompose :
    Restriction original inclusion = Compose original inclusion := by
  sorry

                                                                                        
theorem RestrictionInjective
    (originalInjective : Injective original)
    (inclusionInjective : Injective inclusion) :
    Injective (Restriction original inclusion) := by
  sorry

                                                                                         
theorem RestrictionSurjectiveOfSurjective
    (originalSurjective : Surjective original)
    (inclusionSurjective : Surjective inclusion) :
    Surjective (Restriction original inclusion) := by
  sorry

end LRA.Function
