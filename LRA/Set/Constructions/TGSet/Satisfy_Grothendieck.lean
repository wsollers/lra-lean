import LRA.Set.Constructions.TGSet.Satisfy_ZFC
import LRA.Set.Constructions.TGSet.Interface.ModelTheory.Theory
import LRA.Set.Constructions.TGSet.Theorems.ModelTheory.StandardTransitive
import LRA.Set.Constructions.GrothendieckUniverse.Satisfy_ZFC

/-!
TGSet supports and satisfies the Grothendieck-universe tower: the third leg of
TGSet's triple-satisfy (Generic / ZFC / Grothendieck). Every internal universe
`U` is itself an internal model of ZFC, and TG provides a canonical such
universe for every parameter set.
-/

namespace LRA.Set.Constructions.TGSet

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.Constructions.TGSet.Interface.ModelTheory
open LRA.Set.Constructions.GrothendieckUniverse
open LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory

/--
`tgSetSupportsUniverseAxiom` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom

Logical form (Lean):

```lean
theorem tgSetSupportsUniverseAxiom : TGUniverseAxiom
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
theorem tgSetSupportsUniverseAxiom : TGUniverseAxiom := by
  sorry

/--
`tgSetContainsInternalUniverseModel` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject), Exists fun U => Exists fun hU => LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U hU ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSetObject
  Prove
    Exists fun U => Exists fun hU => { Domain := Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 U x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => LRA.Set.Constructions.instMembershipTGSet.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem tgSetContainsInternalUniverseModel
    (A : TGSetObject) :
    ∃ U : TGSetObject,
      ∃ hU : TGUniversePredicate A U,
      GrothendieckUniverseMembershipModel A U hU ∈
        ModelsOfFormulaTheory ZFCTheory
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem tgSetContainsInternalUniverseModel
    (A : TGSetObject) :
    ∃ U : TGSetObject,
      ∃ hU : TGUniversePredicate A U,
      GrothendieckUniverseMembershipModel A U hU ∈
        ModelsOfFormulaTheory ZFCTheory := by
  sorry

/--
`tgSetInternalUniverseIsStandardTransitive` TODO

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject), LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.IsStandardTransitiveMembershipStructure (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) ⋯)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    A : TGSetObject
  Prove
    ((∀ (left right : Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) ⋯).2 x), LRA.Set.Constructions.instMembershipTGSet.1 right.1 left.1 ↔ LRA.Set.Constructions.instMembershipTGSet.1 right.1 left.1) ∧ (∀ ⦃x y : LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject⦄, LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) ⋯).2 x → LRA.Set.Constructions.instMembershipTGSet.1 x y → LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) ⋯).2 y))

Logical form (Lean):

```lean
theorem tgSetInternalUniverseIsStandardTransitive
    (A : TGSetObject) :
    IsStandardTransitiveMembershipStructure
      (toUniverseLStructure
        A
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverseIsGrothendieckUniverseFor A))
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
theorem tgSetInternalUniverseIsStandardTransitive
    (A : TGSetObject) :
    IsStandardTransitiveMembershipStructure
      (toUniverseLStructure
        A
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A)
        (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverseIsGrothendieckUniverseFor A)) := by
  sorry

/--
`SupportsInternalUniverseTower` Interface-level tower statement: TG provides canonical internal Grothendieck universes, each of which models ZFC.

Predicate logic:

  ∀ (A : LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGSetObject), LRA.Set.Constructions.TGSet.TGSetCanonicalGrothendieckUniverseMembershipModel A ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { Domain := Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (Classical.choose ⋯) x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.arity functionSymbol) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.relationArity x) → Subtype fun x => LRA.Set.Constructions.instMembershipTGSet.mem (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => LRA.Set.Constructions.instMembershipTGSet.mem (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).val (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
def SupportsInternalUniverseTower : Prop :=
  ∀ A : TGSetObject,
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def SupportsInternalUniverseTower : Prop :=
  ∀ A : TGSetObject,
    TGSetCanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory

/--
`tgSetSupportsInternalUniverseTower` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.SupportsInternalUniverseTower

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.SupportsInternalUniverseTower

Logical form (Lean):

```lean
theorem tgSetSupportsInternalUniverseTower : SupportsInternalUniverseTower
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
theorem tgSetSupportsInternalUniverseTower : SupportsInternalUniverseTower := by
  sorry

/--
`SatisfiesTGSemanticTower` Interface-level TG semantic package. The ambient model is recorded together with the TG universe axiom and the existence of internal ZFC-universes.

Predicate logic:

  (LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom ∧ LRA.Set.Constructions.TGSet.SupportsInternalUniverseTower)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom ∧ LRA.Set.Constructions.TGSet.SupportsInternalUniverseTower)

Logical form (Lean):

```lean
def SatisfiesTGSemanticTower : Prop :=
  TGUniverseAxiom ∧ SupportsInternalUniverseTower
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def SatisfiesTGSemanticTower : Prop :=
  TGUniverseAxiom ∧ SupportsInternalUniverseTower

/--
`tgSetSatisfiesTGSemanticTower` TODO

Predicate logic:

  LRA.Set.Constructions.TGSet.SatisfiesTGSemanticTower

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.TGSet.SatisfiesTGSemanticTower

Logical form (Lean):

```lean
theorem tgSetSatisfiesTGSemanticTower : SatisfiesTGSemanticTower
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
theorem tgSetSatisfiesTGSemanticTower : SatisfiesTGSemanticTower := by
  sorry

/--
`tgSetSatisfiesTGTheory` TGSet, as the ambient model, satisfies its own interface-level export `SatisfiesTGTheory`: it models ZFC and supports the universe axiom. The proof is `⟨tgSetModelsZFC, tgSetSupportsUniverseAxiom⟩`.

Predicate logic:

  LRA.Set.Constructions.TGSet.Interface.ModelTheory.SatisfiesTGTheory LRA.Set.Constructions.TGSet.TGSetMembershipModel

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((LRA.Set.Constructions.TGSet.TGSetMembershipModel ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ) ∧ LRA.Set.Constructions.TGSet.Interface.ModelTheory.TGUniverseAxiom)

Logical form (Lean):

```lean
theorem tgSetSatisfiesTGTheory : SatisfiesTGTheory TGSetMembershipModel
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
theorem tgSetSatisfiesTGTheory : SatisfiesTGTheory TGSetMembershipModel := by
  sorry

end LRA.Set.Constructions.TGSet
