import LRA.VolumeI.Logic.Syntax.Term

namespace LRA.VolumeI.Logic.FirstOrder

/-!
First-order formulas.

Declared in the `LRA.VolumeI.Logic.FirstOrder` namespace, not bare
`LRA.VolumeI.Logic`, because propositional logic's `Formula` (in
`LRA.VolumeI.Logic.Syntax.Propositional.Formula`) already occupies that
name in the shared namespace -- both are called `Formula`, and both have
an `impl` constructor, so leaving either one unnamespaced makes the two
collide the moment both are in scope (`Formula.impl` becomes ambiguous).
Namespacing by logic, matching each one's folder (`Syntax/Propositional/`,
`Syntax/FirstOrder/`), is the same disambiguation every other pair of
same-named concepts in this project already gets via distinct type names;
here the type names themselves coincide, so the namespace has to do the
separating instead.

A formula over a signature `S`, with variables drawn from `Variable`, is
one of:

  - a relation symbol applied to exactly `arity r` many terms (packaged as
    a `Fin (arity r)`-indexed family, the same shape `Term.apply` uses one
    level down for function symbols),
  - an equality between two terms,
  - the negation of a smaller formula,
  - an implication between two smaller formulas, or
  - a universal quantification: a variable, together with a smaller
    formula it binds.

`¬` and `→` are the only primitive connectives, matching propositional
logic's same choice and `Language.Notation.LogicalConnective`'s declared
primitives. `∀` is primitive; `∃` is not a constructor here -- it is
expected to be introduced later as derived notation,
`∃v. φ := ¬∀v. ¬φ`, matching `Language.Notation.LogicalQuantifier`'s
doc-comment. `∧`, `∨`, `↔` are likewise expected to be derived from `¬`/`→`,
the same reduction already used for propositional `Formula.and`/`.or`/
`.iff`.

Equality is its own constructor, not a case of `relation`: per the alphabet
definition, `=` is a logical symbol present in every language, unlike the
symbols of a signature's `Relations`, which vary language to language.

Binding itself -- which occurrences of a variable inside a formula are
bound versus free, and what it means to substitute a term for a free
occurrence -- is not defined here. It is a fact *about* `Formula`, to be
stated and proved once free variables and substitution are introduced,
not part of `Formula`'s own declaration; `forallQ`'s constructor merely
has the right shape (one variable, one smaller formula) to make that later
definition possible.
-/

inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable

/-!
Derived connectives.

`∧` is defined in terms of `¬`/`→`, the same reduction already used for
propositional `Formula.and`: `φ ∧ ψ := ¬(φ → ¬ψ)`. The theorem confirming
this has the expected satisfaction condition lives in `Semantics`, not
here, alongside `Satisfies` itself -- stating it here would need `Formula`
to import `Satisfaction`, which itself imports `Formula`.
-/

def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

/-- `∃v. φ := ¬∀v. ¬φ`, the standard reduction of the existential
quantifier to the universal one, matching
`Language.Notation.LogicalQuantifier`'s doc-comment. The theorem confirming
this has the expected satisfaction condition -- holding iff *some* domain
element witnesses `φ` -- lives in `Semantics`, alongside `Satisfies`
itself, for the same reason `Formula.and`'s satisfaction theorem does. -/
def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

end LRA.VolumeI.Logic.FirstOrder
