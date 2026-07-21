import LRA.VolumeI.Logic.Syntax.FirstOrder.IsSubstitutable
import LRA.VolumeI.Logic.Syntax.FirstOrder.SubstituteInTerm

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Substitution into formulas.

`substitute φ x t` replaces every *free* occurrence of `x` in `φ` with the
term `t` -- written `φ[x := t]` or `φ(t/x)` in the usual notation.
`substitute` itself is total and unconditional: it does not check
`IsSubstitutable` and does not refuse to run when capture would occur. It
simply computes a formula, which may or may not mean what the
substitution lemma promises, depending on whether `IsSubstitutable φ x t`
actually holds -- exactly as documented there.

The recursion mirrors `freeVariables`/`IsSubstitutable`:

  - atomic formulas substitute directly into their term arguments (via
    `substituteInTerm`), since they have no binder to interact with;
  - `¬`/`→` recurse into their subformula(s) unchanged;
  - `∀v. φ`: if `v = x`, this quantifier already rebinds `x` -- every
    occurrence of `x` inside `φ` is bound, not free, so there is nothing
    to substitute and the subformula is left untouched. Otherwise, `x`
    may still occur free inside `φ` (past this `∀`, which binds a
    *different* variable `v`), so substitution recurses in.
-/

/-- Substitute `t` for every free occurrence of `x` in `φ`. Unconditional:
does not check or require `IsSubstitutable φ x t`. -/
def substitute
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Formula S Variable -> Formula S Variable
  | .relation r args => Formula.relation r (fun i => substituteInTerm x t (args i))
  | .equal t₁ t₂ => Formula.equal (substituteInTerm x t t₁) (substituteInTerm x t t₂)
  | .neg φ => Formula.neg (substitute x t φ)
  | .impl φ ψ => Formula.impl (substitute x t φ) (substitute x t ψ)
  | .forallQ v φ => if v = x then Formula.forallQ v φ else Formula.forallQ v (substitute x t φ)

end LRA.VolumeI.Logic.FirstOrder
