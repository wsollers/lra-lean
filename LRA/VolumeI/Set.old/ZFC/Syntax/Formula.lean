import LRA.VolumeI.Logic.Syntax.FirstOrder.Formula
import LRA.VolumeI.Set.ZFC.Language.Signature
import LRA.VolumeI.Set.ZFC.Syntax.FreshVariable

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
ZFC formulas.

The general first-order syntax layer stays parameterized by an arbitrary
signature and variable type. The ZFC layer fixes both choices: the
one-relation ZFC signature and the concrete natural-number variable supply
used by ZFC formula builders.
-/

/-- First-order terms over the ZFC signature, using ZFC's concrete
variable type. -/
abbrev ZFCTerm := FirstOrder.Term zfcSignature ZFCVariable

/-- First-order formulas over the ZFC signature, using ZFC's concrete
variable type. -/
abbrev ZFCFormula := FirstOrder.Formula zfcSignature ZFCVariable

/-- The ZFC term represented by a variable. -/
def variableTerm (x : ZFCVariable) : ZFCTerm :=
  FirstOrder.Term.var x

/-- The atomic ZFC formula `x ∈ y`. -/
def isMemberOf (x y : ZFCVariable) : ZFCFormula :=
  FirstOrder.Formula.relation .member fun argument =>
    match argument with
    | ⟨0, _⟩ => variableTerm x
    | ⟨1, _⟩ => variableTerm y

/-- The atomic ZFC formula `x = y`. -/
def isEqualTo (x y : ZFCVariable) : ZFCFormula :=
  FirstOrder.Formula.equal (variableTerm x) (variableTerm y)

/-- The ZFC formula implication `φ → ψ`. -/
def impliesFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  FirstOrder.Formula.impl φ ψ

/-- The ZFC formula negation `¬φ`. -/
def notFormula (φ : ZFCFormula) : ZFCFormula :=
  FirstOrder.Formula.neg φ

/-- The ZFC formula conjunction `φ ∧ ψ`. -/
def andFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  FirstOrder.Formula.and φ ψ

/-- The ZFC formula disjunction `φ ∨ ψ`, derived as `¬φ → ψ`. -/
def orFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  impliesFormula (notFormula φ) ψ

/-- The ZFC formula biconditional `φ ↔ ψ`, derived as
`(φ → ψ) ∧ (ψ → φ)`. -/
def iffFormula (φ ψ : ZFCFormula) : ZFCFormula :=
  andFormula (impliesFormula φ ψ) (impliesFormula ψ φ)

/-- The ZFC universal quantification formula `∀ x, φ`. -/
def forallVariable (x : ZFCVariable) (φ : ZFCFormula) : ZFCFormula :=
  FirstOrder.Formula.forallQ x φ

/-- The ZFC existential quantification formula `∃ x, φ`. -/
def existsVariable (x : ZFCVariable) (φ : ZFCFormula) : ZFCFormula :=
  FirstOrder.Formula.existsQ x φ

end LRA.VolumeI.Set.ZFC
