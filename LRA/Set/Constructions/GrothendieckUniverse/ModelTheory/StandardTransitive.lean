import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Logic.Semantics.Satisfaction
import LRA.Set.Constructions.GrothendieckUniverse.Theorems

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.Set.Constructions.GrothendieckUniverse
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

universe u

noncomputable def GrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    Model MembershipSignature where
  Domain := { x : SetObject // x ∈ U }
  domainNonempty := ⟨⟨A, universeHypothesis.1⟩⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => (arguments ⟨0, by decide⟩).1 ∈ (arguments ⟨1, by decide⟩).1
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet =>
        let emptyWitness :=
          Classical.choose
            (GrothendieckUniverseContainsEmptySet
              (U := U) universeHypothesis.2)
        let emptyWitnessSpec :=
          Classical.choose_spec
            (GrothendieckUniverseContainsEmptySet
              (U := U) universeHypothesis.2)
        ⟨emptyWitness, emptyWitnessSpec.1⟩

noncomputable def CanonicalGrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    Model MembershipSignature :=
  GrothendieckUniverseMembershipModel
    A
    (TheGrothendieckUniverse A)
    (TheGrothendieckUniverseIsGrothendieckUniverseFor A)

theorem grothendieckUniverseSatisfiesExtensionality
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      extensionalityFormula := by
  sorry

theorem grothendieckUniverseSatisfiesEmptySet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      emptySetFormula := by
  sorry

theorem grothendieckUniverseSatisfiesPairing
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      pairingFormula := by
  sorry

theorem grothendieckUniverseSatisfiesUnion
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      unionFormula := by
  sorry

theorem grothendieckUniverseSatisfiesPowerSet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      powerSetFormula := by
  sorry

theorem grothendieckUniverseSatisfiesInfinity
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      infinityFormula := by
  sorry

theorem grothendieckUniverseSatisfiesFoundation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      foundationFormula := by
  sorry

theorem grothendieckUniverseSatisfiesChoice
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      choiceFormula := by
  sorry

theorem grothendieckUniverseSatisfiesSeparation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      (separationInstance property) := by
  sorry

theorem grothendieckUniverseSatisfiesReplacement
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      (replacementInstance relation) := by
  sorry

theorem grothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    GrothendieckUniverseMembershipModel A U universeHypothesis ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

theorem canonicalGrothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    CanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.ModelTheory
