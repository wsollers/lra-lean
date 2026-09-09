import LRA.Set.Constructions.TGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.TGSet.Axioms
import LRA.Set.Constructions.TGSet.Theorems
import LRA.Set.Constructions.TGSet.Instances

/-!
TGSet satisfies ZFCSet's exported ZFC theory. TG's ten ZFC axioms are ZFC's;
these obligations are the second leg of TGSet's triple-satisfy
(Generic / ZFC / Grothendieck).
-/

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.TGSet.Interface.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

/--
`TGSetMembershipModel` TODO

Predicate logic:

  noncomputable def TGSetMembershipModel : Model MembershipSignature where
    Domain := TGSetObject
    domainNonempty := ⟨∅⟩
    interpretFunction := fun functionSymbol => functionSymbol.elim
    interpretRelation := fun relationSymbol arguments =>
      match relationSymbol with
      | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
    interpretConstant := fun constantSymbol =>
      match constantSymbol with
      | .emptySet => ∅

Predicate logic (unfolded):

  noncomputable def TGSetMembershipModel : Model MembershipSignature where
    Domain := TGSetObject
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
noncomputable def TGSetMembershipModel : Model MembershipSignature where
  Domain := TGSetObject
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
@[reducible] noncomputable def TGSetMembershipModel : Model MembershipSignature where
  Domain := TGSetObject
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

/--
`tgSetSatisfiesExtensionality` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesExtensionality
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment extensionalityFormula
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
theorem tgSetSatisfiesExtensionality
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment extensionalityFormula := by
  sorry

/--
`tgSetSatisfiesEmptySet` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesEmptySet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment emptySetFormula
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
theorem tgSetSatisfiesEmptySet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment emptySetFormula := by
  sorry

/--
`tgSetSatisfiesPairing` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesPairing
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment pairingFormula
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
theorem tgSetSatisfiesPairing
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment pairingFormula := by
  sorry

/--
`tgSetSatisfiesUnion` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesUnion
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment unionFormula
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
theorem tgSetSatisfiesUnion
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment unionFormula := by
  sorry

/--
`tgSetSatisfiesPowerSet` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesPowerSet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment powerSetFormula
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
theorem tgSetSatisfiesPowerSet
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment powerSetFormula := by
  sorry

/--
`tgSetSatisfiesInfinity` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesInfinity
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment infinityFormula
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
theorem tgSetSatisfiesInfinity
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment infinityFormula := by
  sorry

/--
`tgSetSatisfiesFoundation` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesFoundation
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment foundationFormula
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
theorem tgSetSatisfiesFoundation
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment foundationFormula := by
  sorry

/--
`tgSetSatisfiesChoice` TODO

Predicate logic:

  ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Logical form (Lean):

```lean
theorem tgSetSatisfiesChoice
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment choiceFormula
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
theorem tgSetSatisfiesChoice
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment choiceFormula := by
  sorry

/--
`tgSetSatisfiesSeparation` TODO

Predicate logic:

  ∀ (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.SeparationHygienic property → ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.separationInstance property)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    property : Formula MembershipSignature Nat
    hygienic : SeparationHygienic property
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    ((SetLike.1 ∈ LRA.Logic.FirstOrder.freeVariables property → False) ∧ (SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables property → False)) → ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 2 (LRA.Logic.FirstOrder.Formula.forallQ 0 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2))).impl ((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg).impl (((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2)))).neg).neg).neg).neg)

Logical form (Lean):

```lean
theorem tgSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
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
theorem tgSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
      (separationInstance property) := by
  sorry

/--
`tgSetSatisfiesReplacement` TODO

Predicate logic:

  ∀ (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ReplacementHygienic relation → ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.Domain), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.replacementInstance relation)

Predicate logic (unfolded):

  Ambient
    (Nat)
  Objects
    relation : Formula MembershipSignature Nat
    hygienic : ReplacementHygienic relation
    assignment : Nat → TGSetMembershipModel.Domain
  Prove
    ((SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ ((SetLike.3 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ (SetLike.4 ∈ LRA.Logic.FirstOrder.allVariables relation → False))) → ∀ (assignment : Nat → LRA.Set.Constructions.TGSet.TGSetMembershipModel.1), LRA.Logic.FirstOrder.Satisfies LRA.Set.Constructions.TGSet.TGSetMembershipModel assignment (LRA.Logic.FirstOrder.Formula.forallQ 2 ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem fun i => Fin.induction.match_1 (fun x => (fun x => (fun x => LRA.Logic.FirstOrder.Term LRA.Set.ModelTheory.MembershipSignature Nat) x) x) i fun i hi => Fin.induction.go (LRA.Set.ModelTheory.varT 0) (fun i x => (fun i => Fin.cases (LRA.Set.ModelTheory.varT 2) Fin.elim0 i) i) i hi).impl ((LRA.Logic.FirstOrder.Formula.forallQ 1 relation.neg).neg.impl (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 4 ((relation.impl (LRA.Logic.FirstOrder.substitute 1 (LRA.Logic.FirstOrder.Term.var 4) relation).neg).neg.impl (LRA.Logic.FirstOrder.Formula.equal (LRA.Logic.FirstOrder.Term.var 1) (LRA.Logic.FirstOrder.Term.var 4))))).neg).neg)).impl (LRA.Logic.FirstOrder.Formula.forallQ 3 (LRA.Logic.FirstOrder.Formula.forallQ 1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3))).impl (LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg).impl ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3)))).neg).neg).neg).neg))

Logical form (Lean):

```lean
theorem tgSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
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
theorem tgSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → TGSetMembershipModel.Domain) :
    Satisfies TGSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

/--
`tgSetModelsZFC` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.TGSetMembershipModel ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.TGSetMembershipModel ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem tgSetModelsZFC :
    TGSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory
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
theorem tgSetModelsZFC :
    TGSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.Constructions.TGSet
