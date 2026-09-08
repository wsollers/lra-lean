import LRA.Identity.Interface.SecondOrder.LStructure
import LRA.Identity.Interface.FirstOrder.Model
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Interface.SecondOrder

universe u

/-- A Henkin model exposes a selected domain of admissible predicates. -/
structure HenkinModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L
  predicateDomain : LRA.Identity.Logic.SOL.HenkinPredicateDomain
    firstOrder.interpretation.Domain

/-- A full model admits every predicate on the first-order carrier. -/
structure FullModel (L : LStructure) where
  firstOrder : LRA.Identity.Interface.FirstOrder.Model L

end LRA.Identity.Interface.SecondOrder
