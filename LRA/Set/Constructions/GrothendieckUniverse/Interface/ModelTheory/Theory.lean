import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.LStructure
import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Axioms

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

universe u

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
  sorry

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
