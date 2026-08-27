import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.ModelTheory.StandardTransitive

namespace LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

universe u

abbrev MembershipSignature := LRA.Set.ModelTheory.MembershipSignature

def toUniverseLStructure
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    UniverseLStructure SetObject where
  base := A
  carrier := U
  carrierHypothesis := universeHypothesis

noncomputable abbrev GrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    Model MembershipSignature :=
  LRA.Set.ModelTheory.GrothendieckUniverseMembershipModel A U universeHypothesis

theorem grothendieckUniverseModelIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    IsStandardTransitiveMembershipStructure (toUniverseLStructure A U universeHypothesis) :=
  universeStructureIsStandardTransitive (toUniverseLStructure A U universeHypothesis)

noncomputable abbrev CanonicalGrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    Model MembershipSignature :=
  LRA.Set.ModelTheory.CanonicalGrothendieckUniverseMembershipModel A

abbrev HasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) : Prop :=
  GrothendieckUniverseMembershipModel A U universeHypothesis ∈ ModelsOfFormulaTheory ZFCTheory

abbrev SupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] : Prop :=
  ∀ A : SetObject,
    CanonicalGrothendieckUniverseMembershipModel A ∈ ModelsOfFormulaTheory ZFCTheory

theorem grothendieckUniverseSatisfiesExtensionality
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment extensionalityFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesExtensionality A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesEmptySet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment emptySetFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesEmptySet A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesPairing
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment pairingFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesPairing A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesUnion
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment unionFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesUnion A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesPowerSet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment powerSetFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesPowerSet A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesInfinity
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment infinityFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesInfinity A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesFoundation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment foundationFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesFoundation A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesChoice
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment choiceFormula :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesChoice A U universeHypothesis assignment

theorem grothendieckUniverseSatisfiesSeparation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment
      (separationInstance property) :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesSeparation
    A U universeHypothesis property hygienic assignment

theorem grothendieckUniverseSatisfiesReplacement
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U)
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies (GrothendieckUniverseMembershipModel A U universeHypothesis) assignment
      (replacementInstance relation) :=
  LRA.Set.ModelTheory.grothendieckUniverseSatisfiesReplacement
    A U universeHypothesis relation hygienic assignment

theorem grothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    GrothendieckUniverseMembershipModel A U universeHypothesis ∈ ModelsOfFormulaTheory ZFCTheory :=
  LRA.Set.ModelTheory.grothendieckUniverseModelsZFC A U universeHypothesis

theorem grothendieckUniverseHasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) :
    HasCumulativeHierarchyClassification A U universeHypothesis :=
  grothendieckUniverseModelsZFC A U universeHypothesis

theorem canonicalGrothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    CanonicalGrothendieckUniverseMembershipModel A ∈ ModelsOfFormulaTheory ZFCTheory :=
  LRA.Set.ModelTheory.canonicalGrothendieckUniverseModelsZFC A

theorem grothendieckUniverseSupportsTGExpansion
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] :
    SupportsTGExpansion SetObject := by
  show LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject
  exact inferInstance

theorem grothendieckUniverseSupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] :
    SupportsTGUniverseTower SetObject := by
  intro A
  exact canonicalGrothendieckUniverseModelsZFC A

end LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
