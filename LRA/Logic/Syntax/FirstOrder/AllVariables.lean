import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Union
import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Syntax.FirstOrder.FreeVariablesInTerm

namespace LRA.Logic.FirstOrder

/--
`allVariables` TODO

Predicate logic:

  def allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => allVariables φ
  | .impl φ ψ => allVariables φ ∪ allVariables ψ
  | .forallQ v φ => {v} ∪ allVariables φ

Predicate logic (unfolded):

  def allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => allVariables φ
  | .impl φ ψ => allVariables φ ∪ allVariables ψ
  | .forallQ v φ => {v} ∪ allVariables φ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => allVariables φ
  | .impl φ ψ => allVariables φ ∪ allVariables ψ
  | .forallQ v φ => {v} ∪ allVariables φ
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
def allVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => allVariables φ
  | .impl φ ψ => allVariables φ ∪ allVariables ψ
  | .forallQ v φ => {v} ∪ allVariables φ

end LRA.Logic.FirstOrder
