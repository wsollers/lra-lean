import LRA.VolumeI.Logic.Syntax.Term

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Substitution into terms.

Terms have no binder of their own, so substituting a term `t` for a
variable `x` inside another term is unconditional -- there is no capture
risk to guard against at this level, unlike formulas. Every occurrence of
`x` is replaced by `t`; everything else is left alone.
-/

/-- Substitute `t` for every occurrence of `x` in a term. -/
def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i))

end LRA.VolumeI.Logic.FirstOrder
