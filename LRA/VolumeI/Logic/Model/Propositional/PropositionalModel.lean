import LRA.VolumeI.Logic.Syntax.Propositional.Formula

namespace LRA.VolumeI.Logic.Propositional

/-!
Propositional models.

A propositional structure is not a domain equipped with functions and
relations, the way an `L`-structure (`Model`) is. It is simply a
valuation: a map assigning each propositional atom a truth value. This is
a genuinely different *kind* of object from `Model`, not a degenerate
special case of it -- there is no domain of elements here, nothing to
apply a function to, nothing for a relation to hold of. `PropositionalModel`
is declared as its own thin structure for exactly this reason, rather than
as some instance of `Model` (even `Model` at the empty signature): the
empty-signature `Model` would still carry three vacuous interpretation
fields (`interpretFunction`, `interpretRelation`, `interpretConstant`, all
`Empty.elim`) purely to expose a `Domain` field that would then immediately
be fixed to `Bool` anyway -- ceremony with no semantic content.

The genuine correspondence between propositional and first-order logic is
not "propositional logic has no signature": it is that every propositional
atom corresponds to a *zero-ary relation symbol*. A propositional signature
with atoms `{p, q, r}` corresponds to a first-order signature with three
nullary relation symbols `R_p, R_q, R_r`; the interpretation of each such
symbol in an `L`-structure is exactly a truth value, with the structure's
domain playing no role at all in that interpretation. This is a real,
nonvacuous embedding (atoms to nullary relation symbols), to be built once
`Formula` exists on the first-order side -- not a claim that propositional
models are already first-order models with nothing in them.
-/

/-- A propositional model (structure) over the language `L`: a valuation
assigning each atom of `L` a truth value. -/
structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool

/-!
Satisfaction.

`M.satisfies φ` says the formula `φ` evaluates to `true` under `M`'s
valuation -- the propositional analogue of `M, s ⊨ φ` in first-order logic,
with no assignment `s` needed, since propositional atoms carry no
variables to assign.
-/

/-- The satisfaction relation: `M` satisfies `φ` when `φ` evaluates to
`true` under `M`'s valuation. -/
def PropositionalModel.satisfies
    {L : PropositionalLanguage} (M : PropositionalModel L) (φ : Formula L) : Prop :=
  evaluate M.valuation φ = true

/-- Notation for satisfaction, matching `v ⊨ φ`. -/
scoped notation:50 M " ⊨ₚ " φ => PropositionalModel.satisfies M φ

end LRA.VolumeI.Logic.Propositional
