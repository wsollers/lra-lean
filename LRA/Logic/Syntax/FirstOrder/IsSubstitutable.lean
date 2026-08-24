import LRA.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.Logic.FirstOrder

/--
`IsSubstitutable` TODO

Predicate logic:

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : DecidableVariable] = a : LRA.Logic.FirstOrder.Formula S Variable (a_1 : Variable) (a_2 : LRA.Logic.FirstOrder.Term S Variable), (LRA.Logic.FirstOrder.Formula.brecOn.go (motive := fun x => Variable → LRA.Logic.FirstOrder.Term S Variable → Prop) a LRA.Logic.FirstOrder.IsSubstitutable._f).1 a_1 a_2

Predicate logic (unfolded):

  ∀ {S : LRA.Logic.Signature} {Variable : Type} [inst : (a b : Variable) → Decidable (a = b)] (a : LRA.Logic.FirstOrder.Formula S Variable) (a_1 : Variable) (a_2 : LRA.Logic.FirstOrder.Term S Variable), (LRA.Logic.FirstOrder.Formula.brecOn.go (motive := fun x => Variable → LRA.Logic.FirstOrder.Term S Variable → Prop) a LRA.Logic.FirstOrder.IsSubstitutable._f).1 a_1 a_2

Logical form (Lean):

```lean
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
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
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

end LRA.Logic.FirstOrder
