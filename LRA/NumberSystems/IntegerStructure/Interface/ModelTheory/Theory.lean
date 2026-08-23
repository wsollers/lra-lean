-- LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Theory.lean
-- Integer-structure theories over `IntegerFirstOrderSignature`.

import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.LStructure
import LRA.NumberSystems.IntegerStructure.Definition
import LRA.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

open LRA.NumberSystems.IntegerStructure.Interface.Signature

/-!
`L_int` theories and their defining axioms.

The inverse, base-relation, and aperiodicity axioms are first-order and are
stated over any `L_int`-structure. Two-sided induction is a second-order
schema, exactly as for `PeanoSystem`'s induction axiom, so it is stated over
a `HenkinModel` instead. See `PeanoSystem.Interface.ModelTheory.Theory` for
the one-sided precedent this mirrors.
-/

/-- Successor and predecessor are mutual inverses. -/
def IntegerInverseAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (∀ element : M.Domain,
    M.interpretFunction .predecessor (fun _ => M.interpretFunction .successor (fun _ => element)) =
      element) /\
  (∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => M.interpretFunction .predecessor (fun _ => element)) =
      element)

/-- The successor of zero is one, and the predecessor of zero is negative
one. -/
def IntegerBaseNeighboursAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (M.interpretFunction .successor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .one) /\
  (M.interpretFunction .predecessor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .negativeOne)

/-- No positive number of forward steps from zero returns to zero. -/
def IntegerAperiodicAxiom
    (M : IntegerStructureLStructure) : Prop :=
  ∀ iterations : Nat, 0 < iterations ->
    LRA.NumberSystems.IntegerStructure.iterate
      (fun element => M.interpretFunction .successor (fun _ => element))
      iterations (M.interpretConstant .zero) ≠
      M.interpretConstant .zero

/-- Two-sided induction: every subset of the Henkin domain containing zero
and closed under both successor and predecessor contains every element. -/
def IntegerInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .zero ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    (∀ element ∈ subset,
      M.interpretFunction .predecessor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

/-- The Henkin second-order integer-structure theory, all read off one
`HenkinModel`. Full second-order semantics would require the extra
certificate `HasFullSecondOrderSemantics`. -/
def IntegerStructureHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  IntegerInverseAxiom M.toModel /\
  IntegerBaseNeighboursAxiom M.toModel /\
  IntegerAperiodicAxiom M.toModel /\
  IntegerInductionAxiom M

/-- Backward-compatible name for the active Henkin second-order integer
theory surface. -/
abbrev IntegerStructureTheory := IntegerStructureHenkinTheory

/-- Backward-compatible alias for the active Henkin second-order integer
axiom surface. -/
abbrev IntegerStructureAxioms := IntegerStructureHenkinTheory

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
