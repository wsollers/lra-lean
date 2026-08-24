import LRA.Logic.Syntax.FirstOrder.Formula

namespace LRA.Logic.FirstOrder

/--
`IsSubformula` TODO

Predicate logic:

  inductive IsSubformula {S : Signature} {Variable : Type} :
    Formula S Variable -> Formula S Variable -> Prop
  | refl (φ : Formula S Variable) : IsSubformula φ φ
  | negOf (φ : Formula S Variable) : IsSubformula φ (Formula.neg φ)
  | implLeft (φ ψ : Formula S Variable) : IsSubformula φ (Formula.impl φ ψ)
  | implRight (φ ψ : Formula S Variable) : IsSubformula ψ (Formula.impl φ ψ)
  | forallOf (v : Variable) (φ : Formula S Variable) : IsSubformula φ (Formula.forallQ v φ)
  | trans {φ ψ χ : Formula S Variable} :
      IsSubformula φ ψ -> IsSubformula ψ χ -> IsSubformula φ χ

Predicate logic (unfolded):

  inductive IsSubformula {S : Signature} {Variable : Type} :
    Formula S Variable -> Formula S Variable -> Prop
  | refl (φ : Formula S Variable) : IsSubformula φ φ
  | negOf (φ : Formula S Variable) : IsSubformula φ (Formula.neg φ)
  | implLeft (φ ψ : Formula S Variable) : IsSubformula φ (Formula.impl φ ψ)
  | implRight (φ ψ : Formula S Variable) : IsSubformula ψ (Formula.impl φ ψ)
  | forallOf (v : Variable) (φ : Formula S Variable) : IsSubformula φ (Formula.forallQ v φ)
  | trans {φ ψ χ : Formula S Variable} :
      IsSubformula φ ψ -> IsSubformula ψ χ -> IsSubformula φ χ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive IsSubformula {S : Signature} {Variable : Type} :
    Formula S Variable -> Formula S Variable -> Prop
  | refl (φ : Formula S Variable) : IsSubformula φ φ
  | negOf (φ : Formula S Variable) : IsSubformula φ (Formula.neg φ)
  | implLeft (φ ψ : Formula S Variable) : IsSubformula φ (Formula.impl φ ψ)
  | implRight (φ ψ : Formula S Variable) : IsSubformula ψ (Formula.impl φ ψ)
  | forallOf (v : Variable) (φ : Formula S Variable) : IsSubformula φ (Formula.forallQ v φ)
  | trans {φ ψ χ : Formula S Variable} :
      IsSubformula φ ψ -> IsSubformula ψ χ -> IsSubformula φ χ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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

end LRA.Logic.FirstOrder
