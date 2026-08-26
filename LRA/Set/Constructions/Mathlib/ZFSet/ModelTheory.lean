
import LRA.Set.Model.Theory
import Mathlib.SetTheory.ZFC.Basic

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/--
`ZFSetMembershipModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

  noncomputable def ZFSetMembershipModel : Model.{1} MembershipSignature where
  Domain := ZFSet.{0}
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅ (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`zfSetSatisfiesExtensionality` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment extensionalityFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.extensionalityFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesExtensionality (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment extensionalityFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesExtensionality (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment extensionalityFormula := by
  sorry

/--
`zfSetSatisfiesEmptySet` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment emptySetFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.emptySetFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesEmptySet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment emptySetFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesEmptySet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment emptySetFormula := by
  sorry

/--
`zfSetSatisfiesPairing` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment pairingFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.pairingFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesPairing (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment pairingFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesPairing (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment pairingFormula := by
  sorry

/--
`zfSetSatisfiesUnion` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment unionFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.unionFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesUnion (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment unionFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesUnion (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment unionFormula := by
  sorry

/--
`zfSetSatisfiesPowerSet` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment powerSetFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.powerSetFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesPowerSet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment powerSetFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesPowerSet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment powerSetFormula := by
  sorry

/--
`zfSetSatisfiesInfinity` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment infinityFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.infinityFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesInfinity (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment infinityFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesInfinity (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment infinityFormula := by
  sorry

/--
`zfSetSatisfiesFoundation` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment foundationFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.foundationFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesFoundation (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment foundationFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesFoundation (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment foundationFormula := by
  sorry

/--
`zfSetSatisfiesChoice` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment choiceFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment LRA.Set.ModelTheory.choiceFormula

Logical form (Lean):

```lean
theorem zfSetSatisfiesChoice (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment choiceFormula
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesChoice (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment choiceFormula := by
  sorry

/--
`zfSetSatisfiesSeparation` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment (separationInstance property)

Predicate logic (unfolded):

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 1).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 2).1 → False) → ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 2).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2))).impl ((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg).impl (((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2)))).neg).neg).neg).neg)

Logical form (Lean):

```lean
theorem zfSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (separationInstance property)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (separationInstance property) := by
  sorry

/--
`zfSetSatisfiesReplacement` TODO

Predicate logic:

  (Nat → ZFSetMembershipModel.Domain) → Satisfies ZFSetMembershipModel assignment (replacementInstance relation)

Predicate logic (unfolded):

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 2).1 → False ∧ (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 3).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.allVariables relation) (instOfNatNat 4).1 → False)) → ∀ (assignment : Nat → LRA.Set.ModelTheory.ZFSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.ZFSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 2).1 ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem fun i => Fin.induction.match_1 (fun x => (fun x => (fun x => LRA.Logic.FirstOrder.Term LRA.Set.ModelTheory.MembershipSignature Nat) x) x) i fun i hi => Fin.induction.go (LRA.Set.ModelTheory.varT 0) (fun i x => (fun i => Fin.cases (LRA.Set.ModelTheory.varT 2) Fin.elim0 i) i) i hi).impl ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 relation.neg).neg.impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 4).1 ((relation.impl (LRA.Logic.FirstOrder.substitute (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Term.var (instOfNatNat 4).1) relation).neg).neg.impl (LRA.Logic.FirstOrder.Formula.equal (LRA.Logic.FirstOrder.Term.var (instOfNatNat 1).1) (LRA.Logic.FirstOrder.Term.var (instOfNatNat 4).1))))).neg).neg)).impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 3).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3))).impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg).impl ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3)))).neg).neg).neg).neg))

Logical form (Lean):

```lean
theorem zfSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (replacementInstance relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem zfSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/--
`zfSetModelsZFC` TODO

Predicate logic:

  ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory

Predicate logic (unfolded):

  Set.instMembership.1 (fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), Set.instMembership.1 LRA.Set.ModelTheory.ZFCTheory φ → LRA.Logic.FirstOrder.Satisfies M assignment φ) LRA.Set.ModelTheory.ZFSetMembershipModel

Logical form (Lean):

```lean
theorem zfSetModelsZFC :
    ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem zfSetModelsZFC :
    ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.ModelTheory
