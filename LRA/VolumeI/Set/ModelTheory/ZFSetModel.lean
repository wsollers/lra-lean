-- LRA/VolumeI/Set/ModelTheory/ZFSetModel.lean
-- Mathlib's ZFC universe as an L_∈ structure, with real satisfaction proofs.

import LRA.VolumeI.Set.ModelTheory.Axioms
import Mathlib.SetTheory.ZFC.Basic

namespace LRA.VolumeI.Set.ModelTheory

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.FirstOrder

/-!
Volume I label: set-model-theory-zfset-model
Lean module: LRA.VolumeI.Set.ModelTheory.ZFSetModel
Verification status: model checked; eight of ten satisfaction theorems
fully proved against Mathlib (Replacement and Choice pending)

Mathlib's `ZFSet` as an `L_∈` structure `⟨ZFSet, ∈, ∅⟩`, and the
satisfaction theorems `ZFSet ⊨ ZFC` — Mathlib's set-theoretic universe
is a bona fide model of the project's *formalized* ZFC theory. This is
the retroactive certification of the Set chapter: the axioms the
Enderton backend takes as primitive are here *theorems* about a
constructed universe, verified through the project's own satisfaction
relation.

The proofs lean on a pleasant fact: `Satisfies` is defined by
structural recursion, so satisfaction of a transcribed axiom reduces
*definitionally* to the raw set-theoretic statement — the assignment
bookkeeping (`updateAssignment` chains, `Fin 2` argument vectors)
evaluates away, and each proof is the matching Mathlib lemma applied
through the derived-connective helpers (`satisfiesIffF`,
`satisfiesOrF`, `satisfiesAndIffSatisfiesBoth`).
-/

/-- Mathlib's ZFC universe as an `L_∈` structure. Reducible so that
ZFSet's own notation (`∈`, `∩`, `{·,·}`) elaborates directly on the
model's domain.

Logical form:

```lean
noncomputable def ZFSetMembershipModel : Model.{1} MembershipSignature where
  Domain := ZFSet.{0}
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
@[reducible] noncomputable def ZFSetMembershipModel : Model.{1} MembershipSignature where
  Domain := ZFSet.{0}
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

/-! ## Satisfaction: ZFSet ⊨ ZFC, axiom by axiom -/

/--
`zfSetSatisfiesExtensionality` states zf set satisfies extensionality.

Logical form:

```lean
theorem zfSetSatisfiesExtensionality (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment extensionalityFormula
```
-/
theorem zfSetSatisfiesExtensionality (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment extensionalityFormula := by
  intro x y h
  refine ZFSet.ext fun z => ?_
  exact satisfiesIffF.mp (h z)

/--
`zfSetSatisfiesEmptySet` states zf set satisfies empty set.

Logical form:

```lean
theorem zfSetSatisfiesEmptySet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment emptySetFormula
```
-/
theorem zfSetSatisfiesEmptySet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment emptySetFormula :=
  fun a h => ZFSet.notMem_empty a h

/--
`zfSetSatisfiesPairing` states zf set satisfies pairing.

Logical form:

```lean
theorem zfSetSatisfiesPairing (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment pairingFormula
```
-/
theorem zfSetSatisfiesPairing (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment pairingFormula := by
  intro a b
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨({a, b} : ZFSet), fun x => ?_⟩
  refine satisfiesIffF.mpr
    ⟨fun h => satisfiesOrF.mpr (ZFSet.mem_pair.mp h),
     fun h => ZFSet.mem_pair.mpr (satisfiesOrF.mp h)⟩

/--
`zfSetSatisfiesUnion` states zf set satisfies union.

Logical form:

```lean
theorem zfSetSatisfiesUnion (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment unionFormula
```
-/
theorem zfSetSatisfiesUnion (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment unionFormula := by
  intro F
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨ZFSet.sUnion F, fun x => ?_⟩
  refine satisfiesIffF.mpr (ZFSet.mem_sUnion.trans ?_)
  refine Iff.trans ?_ (satisfiesExistsIffSomeWitness _ _ _ _).symm
  constructor
  · rintro ⟨B, hBF, hxB⟩
    exact ⟨B, (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨hBF, hxB⟩⟩
  · rintro ⟨B, hB⟩
    obtain ⟨hBF, hxB⟩ := (satisfiesAndIffSatisfiesBoth _ _ _ _).mp hB
    exact ⟨B, hBF, hxB⟩

/--
`zfSetSatisfiesPowerSet` states zf set satisfies power set.

Logical form:

```lean
theorem zfSetSatisfiesPowerSet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment powerSetFormula
```
-/
theorem zfSetSatisfiesPowerSet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment powerSetFormula := by
  intro A
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨ZFSet.powerset A, fun X => ?_⟩
  exact satisfiesIffF.mpr (ZFSet.mem_powerset.trans ZFSet.subset_def)

/--
`zfSetSatisfiesInfinity` states zf set satisfies infinity.

Logical form:

```lean
theorem zfSetSatisfiesInfinity (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment infinityFormula
```
-/
theorem zfSetSatisfiesInfinity (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment infinityFormula := by
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨ZFSet.omega, (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨?_, ?_⟩⟩
  · exact ZFSet.omega_zero
  · intro x hx
    refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
      ⟨(insert x x : ZFSet), (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨?_, ?_⟩⟩
    · intro z
      refine satisfiesIffF.mpr
        ⟨fun h => satisfiesOrF.mpr (or_comm.mp (ZFSet.mem_insert_iff.mp h)),
         fun h => ZFSet.mem_insert_iff.mpr (or_comm.mp (satisfiesOrF.mp h))⟩
    · exact ZFSet.omega_succ hx

/--
`zfSetSatisfiesFoundation` states zf set satisfies foundation.

Logical form:

```lean
theorem zfSetSatisfiesFoundation (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment foundationFormula
```
-/
theorem zfSetSatisfiesFoundation (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment foundationFormula := by
  intro A hne
  obtain ⟨y, hyA, hdisj⟩ := ZFSet.regularity A hne
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨y, (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨hyA, ?_⟩⟩
  intro z hzy hzA
  have hz := (@ZFSet.mem_inter A y z).mpr ⟨hzA, hzy⟩
  rw [hdisj] at hz
  exact ZFSet.notMem_empty z hz

/-- Choice (Zermelo selector form) — pending: needs a selector-set
construction from `Classical.choice` through `ZFSet.image` or
`ZFSet.range` over the family.

Logical form:

```lean
theorem zfSetSatisfiesChoice (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment choiceFormula
```
-/
theorem zfSetSatisfiesChoice (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment choiceFormula := by
  sorry

/--
`zfSetSatisfiesSeparation` states zf set satisfies separation.

Logical form:

```lean
theorem zfSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (separationInstance property)
```
-/
theorem zfSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (separationInstance property) := by
  intro A
  -- Carve the subset with the *semantic* predicate induced by the
  -- syntactic property under the ambient assignment.
  refine (satisfiesExistsIffSomeWitness _ _ _ _).mpr
    ⟨ZFSet.sep
      (fun z => Satisfies ZFSetMembershipModel
        (updateAssignment (updateAssignment assignment 1 A) 0 z) property)
      A, fun x => ?_⟩
  refine satisfiesIffF.mpr ?_
  have agrees :
      ∀ (B z : ZFSetMembershipModel.Domain), ∀ candidateVariable,
        candidateVariable ∈ freeVariables property →
        updateAssignment (updateAssignment assignment 1 A) 0 z
            candidateVariable =
          updateAssignment
            (updateAssignment (updateAssignment assignment 1 A) 2 B)
            0 z candidateVariable := by
    intro B z candidateVariable candidateIsFree
    by_cases h0 : candidateVariable = 0
    · subst h0; simp [updateAssignment]
    · by_cases h2 : candidateVariable = 2
      · exact absurd (h2 ▸ candidateIsFree) hygienic.2
      · simp [updateAssignment, h0, h2]
  constructor
  · intro hx
    obtain ⟨hxA, hφ⟩ :=
      (@ZFSet.mem_sep
        (fun z => Satisfies ZFSetMembershipModel
          (updateAssignment (updateAssignment assignment 1 A) 0 z) property)
        A x).mp hx
    refine (satisfiesAndIffSatisfiesBoth _ _ _ _).mpr ⟨hxA, ?_⟩
    exact (satisfies_iff_of_agrees_on_freeVariables
      ZFSetMembershipModel property (agrees _ x)).mp hφ
  · intro hx
    obtain ⟨hxA, hφ⟩ := (satisfiesAndIffSatisfiesBoth _ _ _ _).mp hx
    refine (@ZFSet.mem_sep
      (fun z => Satisfies ZFSetMembershipModel
        (updateAssignment (updateAssignment assignment 1 A) 0 z) property)
      A x).mpr ⟨hxA, ?_⟩
    exact (satisfies_iff_of_agrees_on_freeVariables
      ZFSetMembershipModel property (agrees _ x)).mpr hφ

/-- Replacement — pending: needs the substitution–satisfaction lemma
relating `Satisfies` of `substitute 1 (varT 4) relation` to
satisfaction of `relation` under a rebound assignment, then
`ZFSet.image` supplies the witness.

Logical form:

```lean
theorem zfSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (replacementInstance relation)
```
-/
theorem zfSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/-- Mathlib's ZFC universe is a model of the project's formalized ZFC:
assembly of the ten per-axiom satisfaction theorems.

Logical form:

```lean
theorem zfSetModelsZFC :
    ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
```
-/
theorem zfSetModelsZFC :
    ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  intro assignment formula formulaIsAxiom
  cases formulaIsAxiom with
  | extensionality => exact zfSetSatisfiesExtensionality assignment
  | emptySet => exact zfSetSatisfiesEmptySet assignment
  | pairing => exact zfSetSatisfiesPairing assignment
  | union => exact zfSetSatisfiesUnion assignment
  | powerSet => exact zfSetSatisfiesPowerSet assignment
  | infinity => exact zfSetSatisfiesInfinity assignment
  | foundation => exact zfSetSatisfiesFoundation assignment
  | choice => exact zfSetSatisfiesChoice assignment
  | separation property hygienic =>
      exact zfSetSatisfiesSeparation property hygienic assignment
  | replacement relation hygienic =>
      exact zfSetSatisfiesReplacement relation hygienic assignment

end LRA.VolumeI.Set.ModelTheory
