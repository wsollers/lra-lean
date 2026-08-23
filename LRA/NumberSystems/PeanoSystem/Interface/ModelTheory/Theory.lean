-- LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Theory.lean
-- Peano theories over `PeanoFirstOrderSignature`.

import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure
import LRA.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

open LRA.NumberSystems.PeanoSystem.Interface.Signature

/-!
`L_nat` theories and their defining axioms.

The base and successor axioms are first-order and are stated over any
`L_nat`-structure. Induction is a second-order schema --
"every subset containing the base and closed under successor is the whole
domain" quantifies over subsets of the domain, not over its elements -- so it
is stated over a `HenkinModel` instead, using the model's chosen
`SecondOrderDomain` as the range of that quantifier, per
`LRA.Logic.Model.SecondOrderMonadic.HenkinModel`'s own account of why Henkin
semantics is the tractable choice here.
-/

/-- The distinguished element is not a successor. -/
def PeanoBaseNotSuccessorAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => element) ≠ M.interpretConstant .one

/-- The successor operation is injective. -/
def PeanoSuccessorInjectiveAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ first second : M.Domain,
    M.interpretFunction .successor (fun _ => first) =
      M.interpretFunction .successor (fun _ => second) ->
    first = second

/-- Induction: every subset of the Henkin domain containing the base and
closed under successor contains every element. -/
def PeanoInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .one ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

/-- The Henkin second-order Peano theory: base, successor, and induction,
all read off one `HenkinModel`. Full second-order semantics would require
the extra certificate `HasFullSecondOrderSemantics`. -/
def PeanoHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  PeanoBaseNotSuccessorAxiom M.toModel /\
  PeanoSuccessorInjectiveAxiom M.toModel /\
  PeanoInductionAxiom M

/-- Backward-compatible name for the active Henkin second-order Peano
theory surface. -/
abbrev PeanoTheory := PeanoHenkinTheory

/-- Backward-compatible alias for the active Henkin second-order Peano
axiom surface. -/
abbrev PeanoAxioms := PeanoHenkinTheory

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
