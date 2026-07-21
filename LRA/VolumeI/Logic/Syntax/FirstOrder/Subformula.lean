import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula

namespace LRA.VolumeI.Logic.FirstOrder

/-!
Subformula.

`IsSubformula φ ψ` says `φ` is a subformula of `ψ`: the smallest
reflexive-transitive relation such that every formula-valued immediate
part of a constructor counts as a subformula of the whole. Declared as an
inductive relation, not a computed `Finset`/`Set` of "all subformulas of
ψ", because the latter would need `DecidableEq (Formula S Variable)` --
itself needing decidable equality on `Signature.RelationSymbol`, `Term`,
and `Variable` all the way down, a substantial side-condition this
relation does not need at all. An inductive `Prop`-valued relation is the
standard way "subformula" is defined in the literature in the first place,
not merely a convenient encoding of an enumeration.

`relation` and `equal` (atomic formulas) contribute no constructor here:
they have *terms* as their immediate parts, not smaller formulas, so the
only way to reach one as a subformula is `refl` -- an atomic formula is a
subformula only of itself, never a proper subformula of anything (which
matches the informal fact that atomic formulas have no formula-valued
substructure to descend into).

`neg`, `impl` (twice), and `forallQ` each contribute exactly one
constructor per formula-valued immediate part: `neg φ`'s one part is `φ`
itself; `impl φ ψ` has two parts, `φ` and `ψ`; `forallQ v φ`'s one part is
`φ` (the variable `v` is not itself a formula, so it contributes nothing
here).

`trans` closes the relation under transitivity, so a subformula three
levels deep is still recognized as a subformula of the outermost formula,
not merely of its immediate parent.
-/

inductive IsSubformula {S : Signature} {Variable : Type} :
    Formula S Variable -> Formula S Variable -> Prop
  | refl (φ : Formula S Variable) : IsSubformula φ φ
  | negOf (φ : Formula S Variable) : IsSubformula φ (Formula.neg φ)
  | implLeft (φ ψ : Formula S Variable) : IsSubformula φ (Formula.impl φ ψ)
  | implRight (φ ψ : Formula S Variable) : IsSubformula ψ (Formula.impl φ ψ)
  | forallOf (v : Variable) (φ : Formula S Variable) : IsSubformula φ (Formula.forallQ v φ)
  | trans {φ ψ χ : Formula S Variable} :
      IsSubformula φ ψ -> IsSubformula ψ χ -> IsSubformula φ χ

end LRA.VolumeI.Logic.FirstOrder
