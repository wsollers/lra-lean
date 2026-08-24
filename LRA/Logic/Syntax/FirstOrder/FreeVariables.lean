import Mathlib.Data.Finset.Union
import Mathlib.Data.Finset.SDiff
import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Syntax.FirstOrder.FreeVariablesInTerm

namespace LRA.Logic.FirstOrder

/--
`freeVariables` TODO

Predicate logic:

  def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v

Predicate logic (unfolded):

  def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v

end LRA.Logic.FirstOrder
