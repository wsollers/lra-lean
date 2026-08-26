import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure
import LRA.Set.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

abbrev extensionalityFormula := LRA.Set.ModelTheory.extensionalityFormula
abbrev emptySetFormula := LRA.Set.ModelTheory.emptySetFormula
abbrev pairingFormula := LRA.Set.ModelTheory.pairingFormula
abbrev unionFormula := LRA.Set.ModelTheory.unionFormula
abbrev powerSetFormula := LRA.Set.ModelTheory.powerSetFormula
abbrev infinityFormula := LRA.Set.ModelTheory.infinityFormula
abbrev foundationFormula := LRA.Set.ModelTheory.foundationFormula
abbrev choiceFormula := LRA.Set.ModelTheory.choiceFormula
abbrev SeparationHygienic := LRA.Set.ModelTheory.SeparationHygienic
abbrev separationInstance := LRA.Set.ModelTheory.separationInstance
abbrev ReplacementHygienic := LRA.Set.ModelTheory.ReplacementHygienic
abbrev replacementInstance := LRA.Set.ModelTheory.replacementInstance
abbrev ZFCTheory := LRA.Set.ModelTheory.ZFCTheory
abbrev TGUniverseAxiom := LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom

def RelativizedAssignment
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (structureData : UniverseLStructure SetObject) :=
  Nat → UniverseDomain structureData

def SatisfiesAllExpandedZFCAxioms
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (model : Model ExpandedMembershipSignature) : Prop :=
  model ∈ ModelsOfFormulaTheory ZFCTheory

def SupportsTGExpansion
    (SetObject : Type u) [Membership SetObject SetObject] : Prop :=
  TGUniverseAxiom SetObject

theorem supportsTGExpansion_iff_universe_axiom
    (SetObject : Type u) [Membership SetObject SetObject] :
    SupportsTGExpansion SetObject ↔ TGUniverseAxiom SetObject := by
  rfl

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
