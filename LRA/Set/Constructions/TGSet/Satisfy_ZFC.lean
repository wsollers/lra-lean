import LRA.Set.Constructions.TGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.TGSet.Axioms
import LRA.Set.Constructions.TGSet.Theorems
import LRA.Set.Constructions.TGSet.Instances

/-!
TGSet satisfies ZFCSet's exported ZFC theory. TG's ten ZFC axioms are ZFC's;
these obligations are the second leg of TGSet's triple-satisfy
(Generic / ZFC / Grothendieck).
-/

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.TGSet.Interface.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

@[reducible] noncomputable def TGSetMembershipModel : Model MembershipSignature where
  Domain := TGSetObject
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

theorem tgSetSatisfiesExtensionality
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment extensionalityFormula := by
  sorry

theorem tgSetSatisfiesEmptySet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment emptySetFormula := by
  sorry

theorem tgSetSatisfiesPairing
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment pairingFormula := by
  sorry

theorem tgSetSatisfiesUnion
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment unionFormula := by
  sorry

theorem tgSetSatisfiesPowerSet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment powerSetFormula := by
  sorry

theorem tgSetSatisfiesInfinity
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment infinityFormula := by
  sorry

theorem tgSetSatisfiesFoundation
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment foundationFormula := by
  sorry

theorem tgSetSatisfiesChoice
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment choiceFormula := by
  sorry

theorem tgSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
      (separationInstance property) := by
  sorry

theorem tgSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

theorem tgSetModelsZFC :
    TGSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.TGSet
