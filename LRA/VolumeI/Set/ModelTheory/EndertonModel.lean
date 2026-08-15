-- LRA/VolumeI/Set/ModelTheory/EndertonModel.lean
-- The Enderton universe as an L_∈ structure.

import LRA.VolumeI.Set.ModelTheory.Axioms
import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Enderton.Axioms.Axioms
import LRA.VolumeI.Logic.Semantics.Satisfaction

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/-!
Volume I label: set-model-theory-enderton-model
Lean module: LRA.Set.ModelTheory.EndertonModel
Verification status: model checked; satisfaction proofs pending
(each is unfold-satisfaction-then-apply-the-matching-Enderton-axiom)

The Enderton universe as an `L_∈` structure
`⟨Enderton.Set, MembershipRelation, ∅⟩`, and the satisfaction
obligations `Enderton ⊨ ZFC` — one theorem per axiom. The primitive
`Set`/`MembershipRelation` were *designed* from these axioms, so each
satisfaction proof should bottom out in exactly one `Enderton.Axioms`
citation after the satisfaction relation is unfolded.

Note the ontology fact this file makes precise: `Enderton.Set` and
`ZFSet` can be `L_∈`-structures because they are single-sorted —
everything is a set. `LRASet Alpha` can NOT: it is two-sorted (atoms
vs sets), so it is not an `L_∈`-structure at all. The backend
capability differences of the Set chapter reappear here as a
difference in *signature*.
-/

/-- The Enderton universe as an `L_∈` structure. Reducible so the
Enderton chapter's own notation elaborates directly on the model's
domain.

Logical form:

```lean
noncomputable def EndertonMembershipModel : Model MembershipSignature where
  Domain := Enderton.Set
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅
```
-/
@[reducible] noncomputable def EndertonMembershipModel : Model MembershipSignature where
  Domain := Enderton.Set
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

/--
`endertonInterpretsMem` states enderton interprets mem.

Logical form:

```lean
theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → Enderton.Set) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩)
```
-/
@[simp] theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → Enderton.Set) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := rfl

/--
`endertonInterpretsEmpty` states enderton interprets empty.

Logical form:

```lean
theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : Enderton.Set)
```
-/
@[simp] theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : Enderton.Set) := rfl

/-! ## Satisfaction: Enderton ⊨ ZFC, axiom by axiom

Each proof is the same recipe: unfold `Satisfies` through the
transcribed formula, reduce the assignment bookkeeping, and apply the
matching `Enderton.Axioms` axiom. All are on the proving queue.
-/

/--
`endertonSatisfiesExtensionality` states enderton satisfies extensionality.

Logical form:

```lean
theorem endertonSatisfiesExtensionality
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment extensionalityFormula
```
-/
theorem endertonSatisfiesExtensionality
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment extensionalityFormula := by
  intro x y h
  refine Enderton.Extensionality x y fun z => ?_
  exact satisfiesIffF.mp (h z)

/--
`endertonSatisfiesEmptySet` states enderton satisfies empty set.

Logical form:

```lean
theorem endertonSatisfiesEmptySet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment emptySetFormula
```
-/
theorem endertonSatisfiesEmptySet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment emptySetFormula :=
  fun a h => Enderton.TheEmptySetIsEmpty a h

/--
`endertonSatisfiesPairing` states enderton satisfies pairing.

Logical form:

```lean
theorem endertonSatisfiesPairing
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment pairingFormula
```
-/
theorem endertonSatisfiesPairing
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment pairingFormula := by
  intro a b
  obtain ⟨C, hC⟩ := Enderton.Pairing a b
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr ⟨C, fun x => ?_⟩
  refine satisfiesIffF.mpr
    ⟨fun h => satisfiesOrF.mpr ((hC x).mp h),
     fun h => (hC x).mpr (satisfiesOrF.mp h)⟩

/--
`endertonSatisfiesUnion` states enderton satisfies union.

Logical form:

```lean
theorem endertonSatisfiesUnion
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment unionFormula
```
-/
theorem endertonSatisfiesUnion
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment unionFormula := by
  intro F
  obtain ⟨U, hU⟩ := Enderton.Union F
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr ⟨U, fun x => ?_⟩
  refine satisfiesIffF.mpr ⟨fun h => ?_, fun h => ?_⟩
  · obtain ⟨B, hBF, hxB⟩ := (hU x).mp h
    exact (satisfiesExistsIffSomeWitness _ _ _ _).mpr
      ⟨B, (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨hBF, hxB⟩⟩
  · obtain ⟨B, hB⟩ := (satisfiesExistsIffSomeWitness _ _ _ _).mp h
    obtain ⟨hBF, hxB⟩ := (satisfiesAndIffSatisfiesBoth _ _ _ _).mp hB
    exact (hU x).mpr ⟨B, hBF, hxB⟩

/--
`endertonSatisfiesPowerSet` states enderton satisfies power set.

Logical form:

```lean
theorem endertonSatisfiesPowerSet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment powerSetFormula
```
-/
theorem endertonSatisfiesPowerSet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment powerSetFormula := by
  intro A
  obtain ⟨P, hP⟩ := Enderton.PowerSet A
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr ⟨P, fun X => ?_⟩
  exact satisfiesIffF.mpr (hP X)

/--
`endertonSatisfiesInfinity` states enderton satisfies infinity.

Logical form:

```lean
theorem endertonSatisfiesInfinity
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment infinityFormula
```
-/
theorem endertonSatisfiesInfinity
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment infinityFormula := by
  sorry

/--
`endertonSatisfiesFoundation` states enderton satisfies foundation.

Logical form:

```lean
theorem endertonSatisfiesFoundation
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment foundationFormula
```
-/
theorem endertonSatisfiesFoundation
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment foundationFormula := by
  sorry

/--
`endertonSatisfiesChoice` states enderton satisfies choice.

Logical form:

```lean
theorem endertonSatisfiesChoice
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment choiceFormula
```
-/
theorem endertonSatisfiesChoice
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment choiceFormula := by
  sorry

/--
`endertonSatisfiesSeparation` states enderton satisfies separation.

Logical form:

```lean
theorem endertonSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (separationInstance property)
```
-/
theorem endertonSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (separationInstance property) := by
  intro A
  obtain ⟨B, hB⟩ := Enderton.Separation
    (fun z => Satisfies EndertonMembershipModel
      (updateAssignment (updateAssignment assignment 1 A) 0 z) property)
    A
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr ⟨B, fun x => ?_⟩
  refine satisfiesIffF.mpr ?_
  have agrees :
      ∀ (C z : EndertonMembershipModel.Domain), ∀ candidateVariable,
        candidateVariable ∈ freeVariables property →
        updateAssignment (updateAssignment assignment 1 A) 0 z
            candidateVariable =
          updateAssignment
            (updateAssignment (updateAssignment assignment 1 A) 2 C)
            0 z candidateVariable := by
    intro C z candidateVariable candidateIsFree
    by_cases h0 : candidateVariable = 0
    · subst h0; simp [updateAssignment]
    · by_cases h2 : candidateVariable = 2
      · exact absurd (h2 ▸ candidateIsFree) hygienic.2
      · simp [updateAssignment, h0, h2]
  constructor
  · intro hx
    obtain ⟨hxA, hφ⟩ := (hB x).mp hx
    refine (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨hxA, ?_⟩
    exact (satisfies_iff_of_agrees_on_freeVariables
      EndertonMembershipModel property (agrees _ x)).mp hφ
  · intro hx
    obtain ⟨hxA, hφ⟩ := (satisfiesAndIffSatisfiesBoth _ _ _ _).mp hx
    refine (hB x).mpr ⟨hxA, ?_⟩
    exact (satisfies_iff_of_agrees_on_freeVariables
      EndertonMembershipModel property (agrees _ x)).mpr hφ

/--
`endertonSatisfiesReplacement` states enderton satisfies replacement.

Logical form:

```lean
theorem endertonSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (replacementInstance relation)
```
-/
theorem endertonSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/-- The Enderton universe is a model of ZFC: assembly of the ten
per-axiom satisfaction theorems.

Logical form:

```lean
theorem endertonModelsZFC :
    EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
```
-/
theorem endertonModelsZFC :
    EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  intro assignment formula formulaIsAxiom
  cases formulaIsAxiom with
  | extensionality => exact endertonSatisfiesExtensionality assignment
  | emptySet => exact endertonSatisfiesEmptySet assignment
  | pairing => exact endertonSatisfiesPairing assignment
  | union => exact endertonSatisfiesUnion assignment
  | powerSet => exact endertonSatisfiesPowerSet assignment
  | infinity => exact endertonSatisfiesInfinity assignment
  | foundation => exact endertonSatisfiesFoundation assignment
  | choice => exact endertonSatisfiesChoice assignment
  | separation property hygienic =>
      exact endertonSatisfiesSeparation property hygienic assignment
  | replacement relation hygienic =>
      exact endertonSatisfiesReplacement relation hygienic assignment

end LRA.Set.ModelTheory
