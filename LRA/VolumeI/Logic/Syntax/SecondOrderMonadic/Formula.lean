import LRA.VolumeI.Logic.Syntax.Term

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
Monadic second-order formulas.

Declared in the `LRA.VolumeI.Logic.SecondOrderMonadic` namespace, matching
`FirstOrder.Formula`/`Propositional.Formula` -- a third, independent
formula type, not a reuse or extension of either (Lean's `inductive` has
no mechanism for "the same constructors as `FirstOrder.Formula`, plus two
more"; every constructor genuinely needed here has to be restated).

`SOFormula` has everything `FirstOrder.Formula` has (relation application,
equality, `¬`/`→`, `∀` over element variables), plus two new constructs
specific to second-order logic:

  - `setMember X t`, read `t ∈ X`: `X` (a *set variable*, drawn from
    `SetVariable`) holds of the term `t`. This is monadic SOL's atomic
    second-order construct, playing the role a relation-symbol application
    plays for ordinary (first-order) relations -- except `X` is a bound
    variable being quantified over, not a fixed symbol from the signature.
  - `forallSet X φ`, read `∀X. φ`: universal quantification over set
    variables. This is where the "monadic" restriction actually lives:
    every `X : SetVariable` is implicitly unary (`setMember` relates one
    `SetVariable` to one term, never a tuple), so `SetVariable` carries no
    arity at all, unlike `S.RelationSymbol`. A general (non-monadic) SOL
    extension would need `SetVariable` to be arity-indexed the same way
    `Signature.RelationSymbol` is, and `setMember` would need a
    `Fin n`-tuple of terms rather than a single one -- deliberately not
    built here.

`SetVariable` is a separate type parameter from `Variable` (element
variables), not a shared one: conflating them would be the same category
error already avoided once for constants-versus-functions -- a set
variable and an element variable are different *kinds* of thing (a set
variable stands for a subset of the domain; an element variable stands for
a single domain element), even though both are, mechanically, "a name
that gets bound."
-/

inductive SOFormula (S : Signature) (Variable SetVariable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> FirstOrder.Term S Variable) ->
      SOFormula S Variable SetVariable
  | equal : FirstOrder.Term S Variable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | neg : SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | impl :
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable ->
      SOFormula S Variable SetVariable
  | forallQ : Variable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable
  | setMember : SetVariable -> FirstOrder.Term S Variable -> SOFormula S Variable SetVariable
  | forallSet : SetVariable -> SOFormula S Variable SetVariable -> SOFormula S Variable SetVariable

/-!
Derived connectives and quantifiers.

`∧` and `∃` (over element variables) are exactly the same derivations as
`FirstOrder.Formula`'s. `∃X` (over set variables) is the same reduction
one level up: `∃X. φ := ¬∀X. ¬φ`.
-/

def SOFormula.and {S : Signature} {Variable SetVariable : Type}
    (φ ψ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.impl φ (SOFormula.neg ψ))

def SOFormula.existsQ {S : Signature} {Variable SetVariable : Type}
    (v : Variable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallQ v (SOFormula.neg φ))

/-- `∃X. φ := ¬∀X. ¬φ`, the existential set quantifier, derived from
`forallSet` the same way `existsQ` is derived from `forallQ`. -/
def SOFormula.existsSet {S : Signature} {Variable SetVariable : Type}
    (X : SetVariable) (φ : SOFormula S Variable SetVariable) : SOFormula S Variable SetVariable :=
  SOFormula.neg (SOFormula.forallSet X (SOFormula.neg φ))

end LRA.VolumeI.Logic.SecondOrderMonadic
