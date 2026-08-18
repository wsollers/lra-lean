-- LRA/VolumeI/Set/ModelTheory/Language.lean
-- The first-order language of membership, L_∈.

import LRA.Logic.Language.FirstOrder.Signature
import LRA.Logic.Syntax.FirstOrder.Sentence

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/-!
Volume I label: set-model-theory-language
Lean module: LRA.Set.ModelTheory.Language
Verification status: checked language module

The language of set theory, `L_∈ = {∈, ∅}`: one binary relation symbol
`∈` and one constant symbol `∅`. Equality is the built-in logical
equality of FOL⁼, not a member of the signature — matching the
`Formula.equal` primitive. The Empty Set axiom is `∅`'s defining axiom
in this extended language; the unconditional existence claim
`∃x ∀y ¬(y ∈ x)`, stated purely in `{∈}`, is what licenses the constant
(existence from the axiom, uniqueness from Extensionality).

Geometric reading before the symbols: a *signature* is an alphabet, a
*structure* is a universe interpreting that alphabet, and a *theory* is
a list of demands written in the alphabet. They are three different
objects, joined only by `⊨`. This module is the alphabet.
-/

/-- The single relation symbol of `L_∈`. -/
inductive MembershipRelationSymbol : Type where
  | mem
  deriving DecidableEq

/-- The single constant symbol of `L_∈`. -/
inductive MembershipConstantSymbol : Type where
  | emptySet
  deriving DecidableEq

/-- `L_∈` has no function symbols. -/
def MembershipFunctions : ArityIndexedSymbols where
  Symbol := Empty
  arity := Empty.elim

/-- `∈` is binary. -/
def MembershipRelations : ArityIndexedSymbols where
  Symbol := MembershipRelationSymbol
  arity := fun _ => 2

/-- The signature of `L_∈`: one binary relation, one constant, no function symbols. -/
def MembershipSignature : Signature where
  Functions := MembershipFunctions
  Relations := MembershipRelations
  Constants := MembershipConstantSymbol

/-- The membership symbol is binary. -/
theorem MembershipSymbolIsBinary :
    MembershipSignature.IsBinaryRelationSymbol .mem := rfl

/-! ## Formula-building helpers -/

/-- The variable `n` as a term. -/
abbrev varT (n : Nat) : Term MembershipSignature Nat := .var n

/-- The constant `∅` as a term. -/
abbrev emptyT : Term MembershipSignature Nat := .const .emptySet

/-- Two terms as the `Fin 2`-indexed argument family expected by a binary relation. -/
def binaryTerms
    (left right : Term MembershipSignature Nat) :
    Fin 2 -> Term MembershipSignature Nat :=
  Fin.cases left (Fin.cases right Fin.elim0)

/-- `left ∈ right` between terms. -/
def memT (left right : Term MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .relation .mem (binaryTerms left right)

/-- `x ∈ y` between variables. -/
abbrev memF (x y : Nat) : Formula MembershipSignature Nat :=
  memT (varT x) (varT y)

/-- `x = y` between variables. -/
abbrev eqF (x y : Nat) : Formula MembershipSignature Nat :=
  .equal (varT x) (varT y)

/-- `φ ∨ ψ := ¬φ → ψ`. -/
def orF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .impl (.neg φ) ψ

/-- `φ ↔ ψ := (φ → ψ) ∧ (ψ → φ)`. -/
def iffF (φ ψ : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  Formula.and (.impl φ ψ) (.impl ψ φ)

end LRA.Set.ModelTheory
