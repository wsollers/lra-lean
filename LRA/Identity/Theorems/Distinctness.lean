import LRA.Identity.Interface.Definitions.Distinctness
import LRA.Identity.Theorems.Equivalence

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

theorem DistinctIrreflexive (x : Carrier) : ¬ Distinct x x :=
  fun h => h (IdentReflexive x)

theorem DistinctSymmetric {x y : Carrier} (h : Distinct x y) : Distinct y x :=
  fun hyx => h (IdentSymmetric hyx)

end LRA.Identity
