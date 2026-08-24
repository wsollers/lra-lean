
import LRA.Set.Model.Theory
import LRA.Set.ZFCSet.Instances
import LRA.Set.ZFC.Axioms
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

/--
`EndertonMembershipModel` TODO

Predicate logic:

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

Predicate logic (unfolded):

  noncomputable def EndertonMembershipModel : Model MembershipSignature where
  Domain := LRA.Set.ZFCSet
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
`endertonInterpretsMem` TODO

Predicate logic:

  (Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) → EndertonMembershipModel.interpretRelation .mem arguments = (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩)

Predicate logic (unfolded):

  ∀ (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 LRA.Set.ModelTheory.MembershipRelationSymbol.mem) → LRA.Set.ZFCSet), LRA.Set.ModelTheory.EndertonMembershipModel.6 LRA.Set.ModelTheory.MembershipRelationSymbol.mem arguments = LRA.Set.instMembershipZFCSet.1 (arguments ⟨(instOfNatNat 1).1, ⋯⟩) (arguments ⟨(instOfNatNat 0).1, ⋯⟩)

Logical form (Lean):

```lean
theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩)
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
@[simp] theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := by
  sorry

/--
`endertonInterpretsEmpty` TODO

Predicate logic:

  EndertonMembershipModel.interpretConstant .emptySet = ∅ ∈ LRA.Set.ZFCSet

Predicate logic (unfolded):

  LRA.Set.ModelTheory.EndertonMembershipModel.7 LRA.Set.ModelTheory.MembershipConstantSymbol.emptySet = LRA.Set.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.ZFCSet)
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
@[simp] theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.ZFCSet) := by
  sorry

/--
`endertonSatisfiesExtensionality` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment extensionalityFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.extensionalityFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesExtensionality
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment extensionalityFormula
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
theorem endertonSatisfiesExtensionality
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment extensionalityFormula := by
  sorry

/--
`endertonSatisfiesEmptySet` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment emptySetFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.emptySetFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesEmptySet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment emptySetFormula
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
theorem endertonSatisfiesEmptySet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment emptySetFormula := by
  sorry

/--
`endertonSatisfiesPairing` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment pairingFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.pairingFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesPairing
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment pairingFormula
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
theorem endertonSatisfiesPairing
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment pairingFormula := by
  sorry

/--
`endertonSatisfiesUnion` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment unionFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.unionFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesUnion
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment unionFormula
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
theorem endertonSatisfiesUnion
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment unionFormula := by
  sorry

/--
`endertonSatisfiesPowerSet` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment powerSetFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.powerSetFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesPowerSet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment powerSetFormula
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
theorem endertonSatisfiesPowerSet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment powerSetFormula := by
  sorry

/--
`endertonSatisfiesInfinity` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment infinityFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.infinityFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesInfinity
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment infinityFormula
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
theorem endertonSatisfiesInfinity
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment infinityFormula := by
  sorry

/--
`endertonSatisfiesFoundation` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment foundationFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.foundationFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesFoundation
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment foundationFormula
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
theorem endertonSatisfiesFoundation
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment foundationFormula := by
  sorry

/--
`endertonSatisfiesChoice` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment choiceFormula

Predicate logic (unfolded):

  ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment LRA.Set.ModelTheory.choiceFormula

Logical form (Lean):

```lean
theorem endertonSatisfiesChoice
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment choiceFormula
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
theorem endertonSatisfiesChoice
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment choiceFormula := by
  sorry

/--
`endertonSatisfiesSeparation` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment (separationInstance property)

Predicate logic (unfolded):

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 1).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables property) (instOfNatNat 2).1 → False) → ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 2).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2))).impl ((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg).impl (((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2)))).neg).neg).neg).neg)

Logical form (Lean):

```lean
theorem endertonSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
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
theorem endertonSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (separationInstance property) := by
  sorry

/--
`endertonSatisfiesReplacement` TODO

Predicate logic:

  (Nat → EndertonMembershipModel.Domain) → Satisfies EndertonMembershipModel assignment (replacementInstance relation)

Predicate logic (unfolded):

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 2).1 → False ∧ (SetLike.instMembership.1 (LRA.Logic.FirstOrder.freeVariables relation) (instOfNatNat 3).1 → False ∧ SetLike.instMembership.1 (LRA.Logic.FirstOrder.allVariables relation) (instOfNatNat 4).1 → False)) → ∀ (assignment : Nat → LRA.Set.ModelTheory.EndertonMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.ModelTheory.EndertonMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 2).1 ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem fun i => Fin.induction.match_1 (fun x => (fun x => (fun x => LRA.Logic.FirstOrder.Term LRA.Set.ModelTheory.MembershipSignature Nat) x) x) i fun i hi => Fin.induction.go (LRA.Set.ModelTheory.varT 0) (fun i x => (fun i => Fin.cases (LRA.Set.ModelTheory.varT 2) Fin.elim0 i) i) i hi).impl ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 relation.neg).neg.impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 4).1 ((relation.impl (LRA.Logic.FirstOrder.substitute (instOfNatNat 1).1 (LRA.Logic.FirstOrder.Term.var (instOfNatNat 4).1) relation).neg).neg.impl (LRA.Logic.FirstOrder.Formula.equal (LRA.Logic.FirstOrder.Term.var (instOfNatNat 1).1) (LRA.Logic.FirstOrder.Term.var (instOfNatNat 4).1))))).neg).neg)).impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 3).1 (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 1).1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3))).impl (LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg).impl ((LRA.Logic.FirstOrder.Formula.forallQ (instOfNatNat 0).1 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3)))).neg).neg).neg).neg))

Logical form (Lean):

```lean
theorem endertonSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
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
theorem endertonSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/--
`endertonModelsZFC` TODO

Predicate logic:

  EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory

Predicate logic (unfolded):

  Set.instMembership.1 (fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), Set.instMembership.1 LRA.Set.ModelTheory.ZFCTheory φ → LRA.Logic.FirstOrder.Satisfies M assignment φ) LRA.Set.ModelTheory.EndertonMembershipModel

Logical form (Lean):

```lean
theorem endertonModelsZFC :
    EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
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
theorem endertonModelsZFC :
    EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.ModelTheory
