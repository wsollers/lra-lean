import LRA.VolumeI.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Substitutability.

Substituting a term `t` for free occurrences of a variable `x` in a
formula `φ` is only *sound* -- only relates correctly to what the
substitution lemma needs it to mean semantically -- when no free variable
of `t` gets accidentally *captured* by a quantifier in `φ` that the
substituted occurrence of `x` was, before substitution, outside the scope
of. This is the single most notorious pitfall in formalizing first-order
logic: naive substitution can silently change a formula's meaning if `t`
mentions a variable that a quantifier inside `φ` happens to rebind.

`IsSubstitutable φ x t` states the side condition under which substituting
`t` for `x` in `φ` is safe, by structural recursion mirroring
`freeVariables`:

  - atomic formulas (`relation`, `equal`) have no binder at all, so
    substitution can never capture anything inside them -- always safe;
  - `¬`/`→` pass the condition through to their subformula(s) unchanged --
    these introduce no binding either;
  - `∀v. φ`: if `x` is not free in `∀v. φ` at all (either because `v = x`
    already rebinds it, or `x` simply does not occur), there is nothing to
    substitute here, so the condition is vacuously satisfied regardless of
    `t`. If `x` *is* free in `∀v. φ`, then substitution will genuinely
    reach inside `φ`'s body past this `∀`, so `t` must not mention `v`
    freely -- otherwise the substituted `t` would have its own `v` swept
    into `∀v`'s scope, changing its meaning. The condition still recurses
    into `φ` regardless, so substitutability is required at every binder
    `x` is free across, not merely the outermost one.

This is a `Prop`, not a `Bool`/`Decidable` predicate: it is a *hypothesis*
substitution's correctness theorem will be stated under, not something
`substitute` itself needs to check or decide before running. `substitute`
(defined separately) is total and unconditional -- it does not refuse to
substitute when this condition fails, it simply may produce a formula
whose meaning does not match what the substitution lemma promises.
-/

/-- The condition under which substituting `t` for free occurrences of `x`
in `φ` is capture-avoiding. -/
def IsSubstitutable
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Variable -> Term S Variable -> Prop
  | .relation _ _, _, _ => True
  | .equal _ _, _, _ => True
  | .neg φ, x, t => IsSubstitutable φ x t
  | .impl φ ψ, x, t => IsSubstitutable φ x t ∧ IsSubstitutable ψ x t
  | .forallQ v φ, x, t =>
      (x ∈ freeVariables (Formula.forallQ v φ) -> v ∉ freeVariablesInTerm t) ∧
        IsSubstitutable φ x t

end LRA.VolumeI.Logic.FirstOrder
