-- LRA/Set/Interop/Mathlib/EndertonModel.lean
-- The Enderton universe as an L_∈ structure.

import LRA.Set.Model.Theory
import LRA.Set.ZFCSet.Instances
import LRA.Set.ZFC.Axioms
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/-!
Volume I label: set-model-theory-enderton-model
Lean module: LRA.Set.ModelTheory.EndertonModel
Verification status: model checked; satisfaction proofs pending
(each is unfold-satisfaction-then-apply-the-matching-Enderton-axiom)

The Enderton universe as an `L_∈` structure
`⟨LRA.Set.ZFCSet, MembershipRelation, ∅⟩`, and the satisfaction
obligations `Enderton ⊨ ZFC` — one theorem per axiom. The primitive
`Set`/`MembershipRelation` were *designed* from these axioms, so each
satisfaction proof should bottom out in exactly one `LRA.Set.ZFC.Axioms`
citation after the satisfaction relation is unfolded.

Note the ontology fact this file makes precise: `LRA.Set.ZFCSet` and
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
  Domain := LRA.Set.ZFCSet
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
  Domain := LRA.Set.ZFCSet
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
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩)
```
-/
@[simp] theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := by
  sorry

/--
`endertonInterpretsEmpty` states enderton interprets empty.

Logical form:

```lean
theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.ZFCSet)
```
-/
@[simp] theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.ZFCSet) := by
  sorry

/-! ## Satisfaction: Enderton ⊨ ZFC, axiom by axiom

Each proof is the same recipe: unfold `Satisfies` through the
transcribed formula, reduce the assignment bookkeeping, and apply the
matching `LRA.Set.ZFC.Axioms` axiom. All are on the proving queue.
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
  sorry

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
    Satisfies EndertonMembershipModel assignment emptySetFormula := by
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

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
  sorry

end LRA.Set.ModelTheory
