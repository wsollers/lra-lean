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

/-- Satisfaction of the atomic formula `x ∈ y` is exactly element-level
membership between the assigned values of `x` and `y`. -/
theorem satisfies_isMemberOf_iff_zfcSetMembership
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (x y : ZFCVariable) :
    satisfiesZFCFormula M assignment (isMemberOf x y) ↔
      zfcSetMembership M (assignment x) (assignment y) := by
  sorry

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
  sorry

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
  sorry

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
  sorry

end LRA.VolumeI.Set.ZFC
