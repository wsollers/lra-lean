import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Constructions.ZFCSet.Axioms.Axioms
import LRA.Logic.Semantics.Satisfaction

/-! ZFCSet satisfies its own exported ZFC theory. -/

namespace LRA.Set.Constructions.ZFCSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

@[reducible] noncomputable def ZFCSetMembershipModel : Model MembershipSignature where
  Domain := LRA.Set.Constructions.ZFCSet
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

@[simp] theorem zfcSetInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.Constructions.ZFCSet) :
    ZFCSetMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := by
  sorry

@[simp] theorem zfcSetInterpretsEmpty :
    ZFCSetMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.Constructions.ZFCSet) := by
  sorry

theorem zfcSetSatisfiesExtensionality
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment extensionalityFormula := by
  sorry

theorem zfcSetSatisfiesEmptySet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment emptySetFormula := by
  sorry

theorem zfcSetSatisfiesPairing
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment pairingFormula := by
  sorry

theorem zfcSetSatisfiesUnion
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment unionFormula := by
  sorry

theorem zfcSetSatisfiesPowerSet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment powerSetFormula := by
  sorry

theorem zfcSetSatisfiesInfinity
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment infinityFormula := by
  sorry

theorem zfcSetSatisfiesFoundation
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment foundationFormula := by
  sorry

theorem zfcSetSatisfiesChoice
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment choiceFormula := by
  sorry

theorem zfcSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
      (separationInstance property) := by
  sorry

theorem zfcSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

theorem zfcSetModelsZFC :
    ZFCSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.ZFCSet
