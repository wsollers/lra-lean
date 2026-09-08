import LRA.Identity.Interface.FirstOrder
import LRA.Identity.Interface.SecondOrder

namespace LRA.Identity.Laws.LogicalLevels

universe u

/-- A strictly first-order theory provides its reflexivity law. -/
theorem FirstOrderReflexivity
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M) (x : M.interpretation.Domain) :
    M.Identity x x := by
  sorry

/-- A strictly first-order theory provides Leibniz transport only for
predicates definable in its selected model. -/
theorem FirstOrderIndiscernibilityOfIdenticals
    {L : LRA.Identity.Interface.FirstOrder.LStructure}
    {Variable : Type} [DecidableEq Variable]
    {M : LRA.Identity.Interface.FirstOrder.Model L}
    (T : LRA.Identity.Interface.FirstOrder.Theory L Variable M)
    {x y : M.interpretation.Domain} (h : M.Identity x y) :
    forall P, LRA.Identity.Logic.FOL.FormulaDefinable Variable M.interpretation P ->
      P x -> P y := by
  sorry

/-- Full second-order identity restricts to every Henkin predicate domain. -/
theorem FullToHenkin
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R := by
  sorry

/-- Henkin identity becomes full when its domain admits every predicate. -/
theorem HenkinToFullOfAllPredicates
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory R := by
  sorry

/-- Full second-order identity entails every first-order definability
restriction on the same carrier. -/
theorem FullToFirstOrder
    {Carrier : Type u} {R : Carrier -> Carrier -> Prop}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory R) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible R := by
  sorry

end LRA.Identity.Laws.LogicalLevels
