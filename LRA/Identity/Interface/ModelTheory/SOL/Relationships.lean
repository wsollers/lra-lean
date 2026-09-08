import LRA.Identity.Interface.ModelTheory.SOL.Henkin
import LRA.ModelTheory.SecondOrder.FullModel

namespace LRA.Identity.ModelTheory.SOL

open LRA.Logic

/-- A Henkin model is full when every relation and function of each arity is
in its corresponding second-order domain. -/
abbrev IsFull {S : Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) : Prop :=
  LRA.ModelTheory.SecondOrder.HasFullSecondOrderSemantics M

end LRA.Identity.ModelTheory.SOL
