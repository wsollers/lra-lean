import LRA.Function.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition

namespace LRA.Function

universe u

                                          
def IdentityFunction (Carrier : Type u) : Endofunction Carrier :=
  fun input => input

end LRA.Function
