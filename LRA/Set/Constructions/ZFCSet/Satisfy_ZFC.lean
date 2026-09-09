import LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Constructions.ZFCSet.Axioms.Axioms
import LRA.Logic.Semantics.Satisfaction

/-! ZFCSet satisfies its own exported ZFC theory. -/

namespace LRA.Set.Constructions.ZFCSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

/--
`ZFCSetMembershipModel` TODO

Predicate logic:

  noncomputable def ZFCSetMembershipModel : Model MembershipSignature where
    Domain := LRA.Set.Constructions.ZFCSet
    domainNonempty := ⟨∅⟩
    interpretFunction := fun functionSymbol => functionSymbol.elim
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
    interpretConstant := fun constantSymbol =>
      match constantSymbol with
      | .emptySet => ∅

Predicate logic (unfolded):

  noncomputable def ZFCSetMembershipModel : Model MembershipSignature where
    Domain := LRA.Set.Constructions.ZFCSet
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
noncomputable def ZFCSetMembershipModel : Model MembershipSignature where
  Domain := LRA.Set.Constructions.ZFCSet
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
@[reducible] noncomputable def ZFCSetMembershipModel : Model MembershipSignature where
  Domain := LRA.Set.Constructions.ZFCSet
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

/--
`zfcSetInterpretsMem` TODO

Predicate logic:

  ∀ (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.relationArity LRA.Set.ModelTheory.MembershipRelationSymbol.mem) → LRA.Set.Constructions.ZFCSet), LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.interpretRelation LRA.Set.ModelTheory.MembershipRelationSymbol.mem arguments = LRA.Set.Constructions.instMembershipZFCSet.mem (arguments ⟨1, ⋯⟩) (arguments ⟨0, ⋯⟩)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.Constructions.ZFCSet
  Prove
    LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.6 LRA.Set.ModelTheory.MembershipRelationSymbol.mem arguments = LRA.Set.Constructions.instMembershipZFCSet.1 (arguments ⟨1, ⋯⟩) (arguments ⟨0, ⋯⟩)

Logical form (Lean):

```lean
theorem zfcSetInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.Constructions.ZFCSet) :
    ZFCSetMembershipModel.interpretRelation .mem arguments =
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
@[simp] theorem zfcSetInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.Constructions.ZFCSet) :
    ZFCSetMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := by
  sorry

/--
`zfcSetInterpretsEmpty` TODO

Predicate logic:

  LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.interpretConstant LRA.Set.ModelTheory.MembershipConstantSymbol.emptySet = LRA.Set.Constructions.ZFCSet.instEmptyCollection.emptyCollection

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.7 LRA.Set.ModelTheory.MembershipConstantSymbol.emptySet = LRA.Set.Constructions.ZFCSet.instEmptyCollection.1

Logical form (Lean):

```lean
theorem zfcSetInterpretsEmpty :
    ZFCSetMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.Constructions.ZFCSet)
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
@[simp] theorem zfcSetInterpretsEmpty :
    ZFCSetMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.Constructions.ZFCSet) := by
  sorry

/--
`zfcSetSatisfiesExtensionality` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesExtensionality
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment extensionalityFormula
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
theorem zfcSetSatisfiesExtensionality
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment extensionalityFormula := by
  sorry

/--
`zfcSetSatisfiesEmptySet` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesEmptySet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment emptySetFormula
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
theorem zfcSetSatisfiesEmptySet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment emptySetFormula := by
  sorry

/--
`zfcSetSatisfiesPairing` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesPairing
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment pairingFormula
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
theorem zfcSetSatisfiesPairing
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment pairingFormula := by
  sorry

/--
`zfcSetSatisfiesUnion` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesUnion
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment unionFormula
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
theorem zfcSetSatisfiesUnion
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment unionFormula := by
  sorry

/--
`zfcSetSatisfiesPowerSet` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesPowerSet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment powerSetFormula
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
theorem zfcSetSatisfiesPowerSet
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment powerSetFormula := by
  sorry

/--
`zfcSetSatisfiesInfinity` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesInfinity
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment infinityFormula
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
theorem zfcSetSatisfiesInfinity
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment infinityFormula := by
  sorry

/--
`zfcSetSatisfiesFoundation` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesFoundation
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment foundationFormula
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
theorem zfcSetSatisfiesFoundation
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment foundationFormula := by
  sorry

/--
`zfcSetSatisfiesChoice` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Logical form (Lean):

```lean
theorem zfcSetSatisfiesChoice
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment choiceFormula
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
theorem zfcSetSatisfiesChoice
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment choiceFormula := by
  sorry

/--
`zfcSetSatisfiesSeparation` TODO

Predicate logic:

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.SeparationHygienic property → ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.separationInstance property)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    property : Formula MembershipSignature Nat
    hygienic : SeparationHygienic property
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    ((SetLike.1 ∈ LRA.Logic.FirstOrder.freeVariables property → False) ∧ (SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables property → False)) → ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 2 (LRA.Logic.FirstOrder.Formula.forallQ 0 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2))).impl ((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg).impl (((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2)))).neg).neg).neg).neg)

Logical form (Lean):

```lean
theorem zfcSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
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
theorem zfcSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
      (separationInstance property) := by
  sorry

/--
`zfcSetSatisfiesReplacement` TODO

Predicate logic:

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ReplacementHygienic relation → ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.replacementInstance relation)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    relation : Formula MembershipSignature Nat
    hygienic : ReplacementHygienic relation
    assignment : Nat → ZFCSetMembershipModel.Domain
  Prove
    ((SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ ((SetLike.3 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ (SetLike.4 ∈ LRA.Logic.FirstOrder.allVariables relation → False))) → ∀ (assignment : Nat → LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ 2 ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem fun i => Fin.induction.match_1 (fun x => (fun x => (fun x => LRA.Logic.FirstOrder.Term LRA.Set.ModelTheory.MembershipSignature Nat) x) x) i fun i hi => Fin.induction.go (LRA.Set.ModelTheory.varT 0) (fun i x => (fun i => Fin.cases (LRA.Set.ModelTheory.varT 2) Fin.elim0 i) i) i hi).impl ((LRA.Logic.FirstOrder.Formula.forallQ 1 relation.neg).neg.impl (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 4 ((relation.impl (LRA.Logic.FirstOrder.substitute 1 (LRA.Logic.FirstOrder.Term.var 4) relation).neg).neg.impl (LRA.Logic.FirstOrder.Formula.equal (LRA.Logic.FirstOrder.Term.var 1) (LRA.Logic.FirstOrder.Term.var 4))))).neg).neg)).impl (LRA.Logic.FirstOrder.Formula.forallQ 3 (LRA.Logic.FirstOrder.Formula.forallQ 1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3))).impl (LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg).impl ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3)))).neg).neg).neg).neg))

Logical form (Lean):

```lean
theorem zfcSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
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
theorem zfcSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFCSetMembershipModel.Domain) :
    Satisfies ZFCSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/--
`zfcSetModelsZFC` TODO

Predicate logic:

  LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCSet.ZFCSetMembershipModel ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem zfcSetModelsZFC :
    ZFCSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
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
theorem zfcSetModelsZFC :
    ZFCSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.ZFCSet
