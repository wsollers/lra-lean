import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Tauto
import LRA.VolumeI.Set.ZFC.Semantics.ClosedAxioms

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Element-level readings of the named ZFC axioms.

The base semantic predicates say that a model satisfies the syntactic ZFC
axiom formulas. This module extracts the ordinary model-facing readings
of the basic axioms as propositions about actual domain elements.
-/

/-- The element-level membership relation of a ZFC model.

`zfcSetMembership M element set` means that `element` is a member of `set`
according to the interpretation of the single binary relation symbol of
the ZFC signature in `M`. -/
def zfcSetMembership
    (M : ZFCModel)
    (element set : M.Domain) : Prop :=
  M.interpretRelation .member fun argument =>
    match argument with
    | ⟨0, _⟩ => element
    | ⟨1, _⟩ => set

private theorem firstOrder_satisfies_andFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (andFormula φ ψ) ↔
      FirstOrder.Satisfies M assignment φ ∧
        FirstOrder.Satisfies M assignment ψ := by
  exact FirstOrder.satisfiesAndIffSatisfiesBoth M assignment φ ψ

private theorem firstOrder_satisfies_existsVariable_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (v : ZFCVariable)
    (φ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (existsVariable v φ) ↔
      ∃ witness : M.Domain,
        FirstOrder.Satisfies M
          (updateAssignment assignment v witness)
          φ := by
  exact FirstOrder.satisfiesExistsIffSomeWitness M assignment v φ

private theorem firstOrder_satisfies_iffFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (iffFormula φ ψ) ↔
      (FirstOrder.Satisfies M assignment φ ↔
        FirstOrder.Satisfies M assignment ψ) := by
  rw [show iffFormula φ ψ = andFormula (impliesFormula φ ψ) (impliesFormula ψ φ) by rfl]
  rw [firstOrder_satisfies_andFormula_iff]
  simp only [impliesFormula, FirstOrder.Satisfies]
  tauto

/-- Satisfaction of the atomic formula `x ∈ y` is exactly element-level
membership between the assigned values of `x` and `y`. -/
theorem satisfies_isMemberOf_iff_zfcSetMembership
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (x y : ZFCVariable) :
    satisfiesZFCFormula M assignment (isMemberOf x y) ↔
      zfcSetMembership M (assignment x) (assignment y) := by
  change
    M.interpretRelation .member
        (fun argument : Fin 2 =>
          FirstOrder.evaluateTerm M assignment
            ((fun argument : Fin 2 =>
              match argument with
              | ⟨0, _⟩ => variableTerm x
              | ⟨1, _⟩ => variableTerm y) argument)) ↔
      M.interpretRelation .member
        (fun argument : Fin 2 =>
          match argument with
          | ⟨0, _⟩ => assignment x
          | ⟨1, _⟩ => assignment y)
  have hArguments :
      (fun argument : Fin 2 =>
          FirstOrder.evaluateTerm M assignment
            ((fun argument : Fin 2 =>
              match argument with
              | ⟨0, _⟩ => variableTerm x
              | ⟨1, _⟩ => variableTerm y) argument)) =
        (fun argument : Fin 2 =>
          match argument with
          | ⟨0, _⟩ => assignment x
          | ⟨1, _⟩ => assignment y) := by
    funext argument
    fin_cases argument <;> rfl
  rw [hArguments]

/-- Element-level reading of Extensionality: sets with the same members are
equal. -/
theorem extensionalityAxiomReading
    {M : ZFCModel}
    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M) :
    ∀ leftSet rightSet : M.Domain,
      (∀ element : M.Domain,
        zfcSetMembership M element leftSet ↔
          zfcSetMembership M element rightSet) ->
        leftSet = rightSet := by
  rcases hBasicAxioms with
    ⟨hExtensionality, _hEmptySet, _hPairing, _hUnion, _hPowerSet,
      _hFoundation, _hInfinity⟩
  rcases M.domainNonempty with ⟨defaultElement⟩
  let baseAssignment : ZFCVariable -> M.Domain := fun _ => defaultElement
  have hExtensionalityFormula :
      satisfiesZFCFormula M baseAssignment extensionalityAxiom :=
    (satisfiesZFCSentence_iff_satisfiesZFCFormula
      M baseAssignment extensionalitySentence).mp hExtensionality
  intro leftSet rightSet hSameMembers
  let axiomAssignment :=
    updateAssignment
      (updateAssignment baseAssignment 0 leftSet)
      1 rightSet
  have hApplied :=
    hExtensionalityFormula leftSet rightSet
  have hLeftSubset :
      FirstOrder.Satisfies M axiomAssignment (isSubsetOf 0 1) := by
    intro element hElementFormula
    have hElementLeft :
        zfcSetMembership M element leftSet := by
      have hBridge :=
        (satisfies_isMemberOf_iff_zfcSetMembership
          M (updateAssignment axiomAssignment (freshVariable [0, 1]) element)
          (freshVariable [0, 1]) 0).mp hElementFormula
      simpa [axiomAssignment, zfcSetMembership, updateAssignment,
        freshVariable] using hBridge
    have hElementRight :
        zfcSetMembership M element rightSet :=
      (hSameMembers element).mp hElementLeft
    have hBridge :=
      (satisfies_isMemberOf_iff_zfcSetMembership
        M (updateAssignment axiomAssignment (freshVariable [0, 1]) element)
        (freshVariable [0, 1]) 1).mpr hElementRight
    simpa [axiomAssignment, zfcSetMembership, updateAssignment,
      freshVariable] using hBridge
  have hRightSubset :
      FirstOrder.Satisfies M axiomAssignment (isSubsetOf 1 0) := by
    intro element hElementFormula
    have hElementRight :
        zfcSetMembership M element rightSet := by
      have hBridge :=
        (satisfies_isMemberOf_iff_zfcSetMembership
          M (updateAssignment axiomAssignment (freshVariable [1, 0]) element)
          (freshVariable [1, 0]) 1).mp hElementFormula
      simpa [axiomAssignment, zfcSetMembership, updateAssignment,
        freshVariable] using hBridge
    have hElementLeft :
        zfcSetMembership M element leftSet :=
      (hSameMembers element).mpr hElementRight
    have hBridge :=
      (satisfies_isMemberOf_iff_zfcSetMembership
        M (updateAssignment axiomAssignment (freshVariable [1, 0]) element)
        (freshVariable [1, 0]) 0).mpr hElementLeft
    simpa [axiomAssignment, zfcSetMembership, updateAssignment,
      freshVariable] using hBridge
  have hSubsetConjunction :
      FirstOrder.Satisfies M axiomAssignment
        (andFormula (isSubsetOf 0 1) (isSubsetOf 1 0)) :=
    (firstOrder_satisfies_andFormula_iff
      M axiomAssignment (isSubsetOf 0 1) (isSubsetOf 1 0)).mpr
        ⟨hLeftSubset, hRightSubset⟩
  have hEquality := hApplied hSubsetConjunction
  simpa [axiomAssignment, isEqualTo, variableTerm, FirstOrder.Satisfies,
    FirstOrder.evaluateTerm, updateAssignment] using hEquality

/-- Element-level reading of Pairing: for any two sets, there is a set
whose members are exactly those two sets. -/
theorem pairingAxiomReading
    {M : ZFCModel}
    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M) :
    ∀ leftSet rightSet : M.Domain,
      ∃ pairSet : M.Domain,
        ∀ element : M.Domain,
          zfcSetMembership M element pairSet ↔
            element = leftSet ∨ element = rightSet := by
  rcases hBasicAxioms with
    ⟨_hExtensionality, _hEmptySet, hPairing, _hUnion, _hPowerSet,
      _hFoundation, _hInfinity⟩
  rcases M.domainNonempty with ⟨defaultElement⟩
  let baseAssignment : ZFCVariable -> M.Domain := fun _ => defaultElement
  have hPairingFormula :
      satisfiesZFCFormula M baseAssignment pairingAxiom :=
    (satisfiesZFCSentence_iff_satisfiesZFCFormula
      M baseAssignment pairingSentence).mp hPairing
  intro leftSet rightSet
  let axiomAssignment :=
    updateAssignment
      (updateAssignment baseAssignment 0 leftSet)
      1 rightSet
  have hPairingExists :
      FirstOrder.Satisfies M axiomAssignment
        (existsVariable (freshVariable [0, 1])
          (isPairSetOf (freshVariable [0, 1]) 0 1)) :=
    hPairingFormula leftSet rightSet
  rcases
      (firstOrder_satisfies_existsVariable_iff
        M axiomAssignment (freshVariable [0, 1])
        (isPairSetOf (freshVariable [0, 1]) 0 1)).mp
        hPairingExists with
    ⟨pairSet, hPairSetFormula⟩
  refine ⟨pairSet, ?_⟩
  intro element
  let elementAssignment :=
    updateAssignment
      (updateAssignment axiomAssignment (freshVariable [0, 1]) pairSet)
      (freshVariable [freshVariable [0, 1], 0, 1]) element
  have hElementFormula :
      FirstOrder.Satisfies M elementAssignment
        (iffFormula
          (isMemberOf (freshVariable [freshVariable [0, 1], 0, 1])
            (freshVariable [0, 1]))
          (orFormula
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 0)
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 1))) :=
    hPairSetFormula element
  have hMembershipIffFormula :
      FirstOrder.Satisfies M elementAssignment
          (isMemberOf (freshVariable [freshVariable [0, 1], 0, 1])
            (freshVariable [0, 1])) ↔
        FirstOrder.Satisfies M elementAssignment
          (orFormula
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 0)
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 1)) :=
    (firstOrder_satisfies_iffFormula_iff
      M elementAssignment
      (isMemberOf (freshVariable [freshVariable [0, 1], 0, 1])
        (freshVariable [0, 1]))
      (orFormula
        (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 0)
        (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 1))).mp
      hElementFormula
  have hMembershipBridge :
      FirstOrder.Satisfies M elementAssignment
          (isMemberOf (freshVariable [freshVariable [0, 1], 0, 1])
            (freshVariable [0, 1])) ↔
        zfcSetMembership M element pairSet := by
    have hBridge :=
      satisfies_isMemberOf_iff_zfcSetMembership
        M elementAssignment
        (freshVariable [freshVariable [0, 1], 0, 1])
        (freshVariable [0, 1])
    simpa [elementAssignment, axiomAssignment, zfcSetMembership,
      updateAssignment, freshVariable] using hBridge
  have hOrBridge :
      FirstOrder.Satisfies M elementAssignment
          (orFormula
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 0)
            (isEqualTo (freshVariable [freshVariable [0, 1], 0, 1]) 1)) ↔
        element = leftSet ∨ element = rightSet := by
    constructor
    · intro hOr
      by_cases hLeft : element = leftSet
      · exact Or.inl hLeft
      · exact Or.inr (by
          have hRight := hOr hLeft
          simpa [elementAssignment, axiomAssignment, isEqualTo, variableTerm,
            orFormula, notFormula, impliesFormula, FirstOrder.Satisfies,
            FirstOrder.evaluateTerm, updateAssignment, freshVariable] using hRight)
    · intro hOr
      intro hNotLeftFormula
      rcases hOr with hLeft | hRight
      · have hNotLeft : ¬ element = leftSet := by
          intro h
          apply hNotLeftFormula
          simpa [elementAssignment, axiomAssignment, isEqualTo, variableTerm,
            FirstOrder.Satisfies, FirstOrder.evaluateTerm, updateAssignment,
            freshVariable] using h
        exact False.elim (hNotLeft hLeft)
      · simpa [elementAssignment, axiomAssignment, isEqualTo, variableTerm,
          FirstOrder.Satisfies, FirstOrder.evaluateTerm, updateAssignment,
          freshVariable] using hRight
  exact hMembershipBridge.symm.trans (hMembershipIffFormula.trans hOrBridge)

/-- Element-level reading of Union: every family has a union set whose
members are exactly the members of members of the family. -/
theorem unionAxiomReading
    {M : ZFCModel}
    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M) :
    ∀ family : M.Domain,
      ∃ unionSet : M.Domain,
        ∀ element : M.Domain,
          zfcSetMembership M element unionSet ↔
            ∃ memberSet : M.Domain,
              zfcSetMembership M memberSet family ∧
                zfcSetMembership M element memberSet := by
  rcases hBasicAxioms with
    ⟨_hExtensionality, _hEmptySet, _hPairing, hUnion, _hPowerSet,
      _hFoundation, _hInfinity⟩
  rcases M.domainNonempty with ⟨defaultElement⟩
  let baseAssignment : ZFCVariable -> M.Domain := fun _ => defaultElement
  have hUnionFormula :
      satisfiesZFCFormula M baseAssignment unionAxiom :=
    (satisfiesZFCSentence_iff_satisfiesZFCFormula
      M baseAssignment unionSentence).mp hUnion
  intro family
  let axiomAssignment := updateAssignment baseAssignment 0 family
  have hUnionExists :
      FirstOrder.Satisfies M axiomAssignment
        (existsVariable (freshVariable [0])
          (isUnionSetOf (freshVariable [0]) 0)) :=
    hUnionFormula family
  rcases
      (firstOrder_satisfies_existsVariable_iff
        M axiomAssignment (freshVariable [0])
        (isUnionSetOf (freshVariable [0]) 0)).mp
        hUnionExists with
    ⟨unionSet, hUnionSetFormula⟩
  refine ⟨unionSet, ?_⟩
  intro element
  let elementAssignment :=
    updateAssignment
      (updateAssignment axiomAssignment (freshVariable [0]) unionSet)
      (freshVariable [freshVariable [0], 0]) element
  have hElementFormula :
      FirstOrder.Satisfies M elementAssignment
        (iffFormula
          (isMemberOf (freshVariable [freshVariable [0], 0])
            (freshVariable [0]))
          (existsVariable
            (freshVariable
              [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
            (andFormula
              (isMemberOf
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                0)
              (isMemberOf (freshVariable [freshVariable [0], 0])
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]]))))) :=
    hUnionSetFormula element
  have hMembershipIffFormula :
      FirstOrder.Satisfies M elementAssignment
          (isMemberOf (freshVariable [freshVariable [0], 0])
            (freshVariable [0])) ↔
        FirstOrder.Satisfies M elementAssignment
          (existsVariable
            (freshVariable
              [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
            (andFormula
              (isMemberOf
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                0)
              (isMemberOf (freshVariable [freshVariable [0], 0])
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])))) :=
    (firstOrder_satisfies_iffFormula_iff
      M elementAssignment
      (isMemberOf (freshVariable [freshVariable [0], 0])
        (freshVariable [0]))
      (existsVariable
        (freshVariable
          [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
        (andFormula
          (isMemberOf
            (freshVariable
              [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
            0)
          (isMemberOf (freshVariable [freshVariable [0], 0])
            (freshVariable
              [freshVariable [0], 0, freshVariable [freshVariable [0], 0]]))))).mp
      hElementFormula
  have hMembershipBridge :
      FirstOrder.Satisfies M elementAssignment
          (isMemberOf (freshVariable [freshVariable [0], 0])
            (freshVariable [0])) ↔
        zfcSetMembership M element unionSet := by
    have hBridge :=
      satisfies_isMemberOf_iff_zfcSetMembership
        M elementAssignment
        (freshVariable [freshVariable [0], 0])
        (freshVariable [0])
    simpa [elementAssignment, axiomAssignment, zfcSetMembership,
      updateAssignment, freshVariable] using hBridge
  have hExistsBridge :
      FirstOrder.Satisfies M elementAssignment
          (existsVariable
            (freshVariable
              [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
            (andFormula
              (isMemberOf
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                0)
              (isMemberOf (freshVariable [freshVariable [0], 0])
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])))) ↔
        ∃ memberSet : M.Domain,
          zfcSetMembership M memberSet family ∧
            zfcSetMembership M element memberSet := by
    rw [firstOrder_satisfies_existsVariable_iff]
    constructor
    · intro hExists
      rcases hExists with ⟨memberSet, hMemberSetFormula⟩
      rcases
          (firstOrder_satisfies_andFormula_iff
            M
              (updateAssignment elementAssignment
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                memberSet)
              (isMemberOf
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                0)
              (isMemberOf (freshVariable [freshVariable [0], 0])
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]]))).mp
            hMemberSetFormula with
        ⟨hFamilyFormula, hElementFormula⟩
      have hFamilyMembership :
          zfcSetMembership M memberSet family := by
        have hBridge :=
          (satisfies_isMemberOf_iff_zfcSetMembership
            M
              (updateAssignment elementAssignment
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                memberSet)
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
              0).mp hFamilyFormula
        simpa [elementAssignment, axiomAssignment, zfcSetMembership,
          updateAssignment, freshVariable] using hBridge
      have hElementMembership :
          zfcSetMembership M element memberSet := by
        have hBridge :=
          (satisfies_isMemberOf_iff_zfcSetMembership
            M
              (updateAssignment elementAssignment
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                memberSet)
              (freshVariable [freshVariable [0], 0])
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])).mp
            hElementFormula
        simpa [elementAssignment, axiomAssignment, zfcSetMembership,
          updateAssignment, freshVariable] using hBridge
      exact ⟨memberSet, hFamilyMembership, hElementMembership⟩
    · intro hExists
      rcases hExists with ⟨memberSet, hFamilyMembership, hElementMembership⟩
      refine ⟨memberSet, ?_⟩
      apply
        (firstOrder_satisfies_andFormula_iff
          M
            (updateAssignment elementAssignment
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
              memberSet)
            (isMemberOf
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
              0)
            (isMemberOf (freshVariable [freshVariable [0], 0])
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]]))).mpr
      constructor
      · have hBridge :=
          (satisfies_isMemberOf_iff_zfcSetMembership
            M
              (updateAssignment elementAssignment
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                memberSet)
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
              0).mpr hFamilyMembership
        simpa [elementAssignment, axiomAssignment, zfcSetMembership,
          updateAssignment, freshVariable] using hBridge
      · have hBridge :=
          (satisfies_isMemberOf_iff_zfcSetMembership
            M
              (updateAssignment elementAssignment
                (freshVariable
                  [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])
                memberSet)
              (freshVariable [freshVariable [0], 0])
              (freshVariable
                [freshVariable [0], 0, freshVariable [freshVariable [0], 0]])).mpr
            hElementMembership
        simpa [elementAssignment, axiomAssignment, zfcSetMembership,
          updateAssignment, freshVariable] using hBridge
  exact hMembershipBridge.symm.trans (hMembershipIffFormula.trans hExistsBridge)

end LRA.VolumeI.Set.ZFC
