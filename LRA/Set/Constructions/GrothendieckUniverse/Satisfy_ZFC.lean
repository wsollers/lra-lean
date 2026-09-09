import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Theory
import LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.Model
import LRA.Set.Constructions.GrothendieckUniverse.Theorems
import LRA.Logic.Semantics.Satisfaction

/-!
Every Grothendieck universe `U` in a host `S` is an internal model of
ZFCSet's exported ZFC theory. Parametric over the host; TGSet instantiates it.
-/

namespace LRA.Set.Constructions.GrothendieckUniverse

open LRA.Logic
open LRA.Logic.FirstOrder
open LRA.ModelTheory.FirstOrder
open LRA.Set.ModelTheory
open LRA.Set.Constructions.ZFCSet.Interface.ModelTheory
open LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory

universe u

/--
`GrothendieckUniverseMembershipModel` TODO

Predicate logic:

  noncomputable def GrothendieckUniverseMembershipModel
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (A U : SetObject)
      (universeHypothesis : IsGrothendieckUniverseFor A U) :
      Model MembershipSignature where
    Domain

Predicate logic (unfolded):

  noncomputable def GrothendieckUniverseMembershipModel
      {SetObject : Type u}
      [Membership SetObject SetObject]
      (A U : SetObject)
      (universeHypothesis : IsGrothendieckUniverseFor A U) :
      Model MembershipSignature where
    Domain (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def GrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    Model MembershipSignature where
  Domain
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
noncomputable def GrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    Model MembershipSignature where
  Domain := { x : SetObject // x ∈ U }
  domainNonempty := ⟨⟨A, universeHypothesis.1⟩⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => (arguments ⟨0, by decide⟩).1 ∈ (arguments ⟨1, by decide⟩).1
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet =>
        let emptyWitness :=
          Classical.choose
            (GrothendieckUniverseContainsEmptySet
              (U := U) universeHypothesis.2)
        let emptyWitnessSpec :=
          Classical.choose_spec
            (GrothendieckUniverseContainsEmptySet
              (U := U) universeHypothesis.2)
        ⟨emptyWitness, emptyWitnessSpec.1⟩

/--
`CanonicalGrothendieckUniverseMembershipModel` TODO

Predicate logic:

  noncomputable def CanonicalGrothendieckUniverseMembershipModel
      {SetObject : Type u}
      [Membership SetObject SetObject]
      [GrothendieckUniverseAxiom SetObject]
      (A : SetObject) :
      Model MembershipSignature :=
    GrothendieckUniverseMembershipModel
      A
      (TheGrothendieckUniverse A)
      (TheGrothendieckUniverseIsGrothendieckUniverseFor A)

Predicate logic (unfolded):

  noncomputable def CanonicalGrothendieckUniverseMembershipModel
      {SetObject : Type u}
      [Membership SetObject SetObject]
      [GrothendieckUniverseAxiom SetObject]
      (A : SetObject) :
      Model MembershipSignature :=
    GrothendieckUniverseMembershipModel
      A
      (TheGrothendieckUniverse A)
      (TheGrothendieckUniverseIsGrothendieckUniverseFor A) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def CanonicalGrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    Model MembershipSignature :=
  GrothendieckUniverseMembershipModel
    A
    (TheGrothendieckUniverse A)
    (TheGrothendieckUniverseIsGrothendieckUniverseFor A)
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
noncomputable def CanonicalGrothendieckUniverseMembershipModel
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    Model MembershipSignature :=
  GrothendieckUniverseMembershipModel
    A
    (TheGrothendieckUniverse A)
    (TheGrothendieckUniverseIsGrothendieckUniverseFor A)

/--
`grothendieckUniverseModelIsStandardTransitive` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U), LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.IsStandardTransitiveMembershipStructure (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A U universeHypothesis)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
  Prove
    ((∀ (left right : Subtype fun x => inst.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A U universeHypothesis).2 x), inst.1 right.1 left.1 ↔ inst.1 right.1 left.1) ∧ (∀ ⦃x y : SetObject⦄, inst.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A U universeHypothesis).2 x → inst.1 x y → inst.1 (LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.toUniverseLStructure A U universeHypothesis).2 y))

Logical form (Lean):

```lean
theorem grothendieckUniverseModelIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    IsStandardTransitiveMembershipStructure (toUniverseLStructure A U universeHypothesis)
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
theorem grothendieckUniverseModelIsStandardTransitive
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    IsStandardTransitiveMembershipStructure (toUniverseLStructure A U universeHypothesis) := by
  sorry

/--
`HasCumulativeHierarchyClassification` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment φ

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment φ

Logical form (Lean):

```lean
abbrev HasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) : Prop :=
  GrothendieckUniverseMembershipModel A U universeHypothesis ∈ ModelsOfFormulaTheory ZFCTheory
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
abbrev HasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) : Prop :=
  GrothendieckUniverseMembershipModel A U universeHypothesis ∈ ModelsOfFormulaTheory ZFCTheory

/--
`SupportsTGUniverseTower` TODO

Predicate logic:

  ∀ (SetObject : Type u) [inst : Membership SetObject SetObject] [inst_1 : LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] (A : SetObject), LRA.Set.Constructions.GrothendieckUniverse.CanonicalGrothendieckUniverseMembershipModel A ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    { Domain := Subtype fun x => inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 (Classical.choose ⋯) x) → Subtype fun x => inst.1 (Classical.choose ⋯) x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.arity x) → Subtype fun x => inst.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).val (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
abbrev SupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] : Prop :=
  ∀ A : SetObject,
    CanonicalGrothendieckUniverseMembershipModel A ∈ ModelsOfFormulaTheory ZFCTheory
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
abbrev SupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] : Prop :=
  ∀ A : SetObject,
    CanonicalGrothendieckUniverseMembershipModel A ∈ ModelsOfFormulaTheory ZFCTheory

/--
`grothendieckUniverseSatisfiesExtensionality` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.extensionalityFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesExtensionality
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      extensionalityFormula
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
theorem grothendieckUniverseSatisfiesExtensionality
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      extensionalityFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesEmptySet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.emptySetFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesEmptySet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      emptySetFormula
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
theorem grothendieckUniverseSatisfiesEmptySet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      emptySetFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesPairing` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.pairingFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesPairing
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      pairingFormula
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
theorem grothendieckUniverseSatisfiesPairing
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      pairingFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesUnion` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.unionFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesUnion
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      unionFormula
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
theorem grothendieckUniverseSatisfiesUnion
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      unionFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesPowerSet` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.powerSetFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesPowerSet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      powerSetFormula
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
theorem grothendieckUniverseSatisfiesPowerSet
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      powerSetFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesInfinity` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.infinityFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesInfinity
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      infinityFormula
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
theorem grothendieckUniverseSatisfiesInfinity
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      infinityFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesFoundation` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.foundationFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesFoundation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      foundationFormula
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
theorem grothendieckUniverseSatisfiesFoundation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      foundationFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesChoice` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.choiceFormula

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesChoice
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      choiceFormula
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
theorem grothendieckUniverseSatisfiesChoice
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      choiceFormula := by
  sorry

/--
`grothendieckUniverseSatisfiesSeparation` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (property : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.SeparationHygienic property → ∀ (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.separationInstance property)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    property : Formula MembershipSignature Nat
    hygienic : SeparationHygienic property
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    ((SetLike.1 ∈ LRA.Logic.FirstOrder.freeVariables property → False) ∧ (SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables property → False)) → ∀ (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).1), LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 2 (LRA.Logic.FirstOrder.Formula.forallQ 0 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2))).impl ((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg).impl (((LRA.Set.ModelTheory.memT (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 1)).impl property.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 0) (LRA.Set.ModelTheory.varT 2)))).neg).neg).neg).neg)

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesSeparation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
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
theorem grothendieckUniverseSatisfiesSeparation
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      (separationInstance property) := by
  sorry

/--
`grothendieckUniverseSatisfiesReplacement` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U) (relation : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ReplacementHygienic relation → ∀ (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).Domain), LRA.Logic.FirstOrder.Satisfies (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis) assignment (LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.replacementInstance relation)

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
    relation : Formula MembershipSignature Nat
    hygienic : ReplacementHygienic relation
    assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain
  Prove
    ((SetLike.2 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ ((SetLike.3 ∈ LRA.Logic.FirstOrder.freeVariables relation → False) ∧ (SetLike.4 ∈ LRA.Logic.FirstOrder.allVariables relation → False))) → ∀ (assignment : Nat → (LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis).1), LRA.Logic.FirstOrder.Satisfies { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } assignment (LRA.Logic.FirstOrder.Formula.forallQ 2 ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem fun i => Fin.induction.match_1 (fun x => (fun x => (fun x => LRA.Logic.FirstOrder.Term LRA.Set.ModelTheory.MembershipSignature Nat) x) x) i fun i hi => Fin.induction.go (LRA.Set.ModelTheory.varT 0) (fun i x => (fun i => Fin.cases (LRA.Set.ModelTheory.varT 2) Fin.elim0 i) i) i hi).impl ((LRA.Logic.FirstOrder.Formula.forallQ 1 relation.neg).neg.impl (LRA.Logic.FirstOrder.Formula.forallQ 1 (LRA.Logic.FirstOrder.Formula.forallQ 4 ((relation.impl (LRA.Logic.FirstOrder.substitute 1 (LRA.Logic.FirstOrder.Term.var 4) relation).neg).neg.impl (LRA.Logic.FirstOrder.Formula.equal (LRA.Logic.FirstOrder.Term.var 1) (LRA.Logic.FirstOrder.Term.var 4))))).neg).neg)).impl (LRA.Logic.FirstOrder.Formula.forallQ 3 (LRA.Logic.FirstOrder.Formula.forallQ 1 (((LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3))).impl (LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg).impl ((LRA.Logic.FirstOrder.Formula.forallQ 0 ((LRA.Set.ModelTheory.memF 0 2).impl relation.neg).neg.neg).neg.impl (LRA.Logic.FirstOrder.Formula.relation LRA.Set.ModelTheory.MembershipRelationSymbol.mem (LRA.Set.ModelTheory.binaryTerms (LRA.Set.ModelTheory.varT 1) (LRA.Set.ModelTheory.varT 3)))).neg).neg).neg).neg))

Logical form (Lean):

```lean
theorem grothendieckUniverseSatisfiesReplacement
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
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
theorem grothendieckUniverseSatisfiesReplacement
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U)
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → (GrothendieckUniverseMembershipModel A U universeHypothesis).Domain) :
    Satisfies
      (GrothendieckUniverseMembershipModel A U universeHypothesis)
      assignment
      (replacementInstance relation) := by
  sorry

/--
`grothendieckUniverseModelsZFC` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U), LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel A U universeHypothesis ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
  Prove
    { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.2 x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).1 (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).1) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem grothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    GrothendieckUniverseMembershipModel A U universeHypothesis ∈
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

Related proof moves: TODO

-/
theorem grothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    GrothendieckUniverseMembershipModel A U universeHypothesis ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

/--
`canonicalGrothendieckUniverseModelsZFC` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] [inst_1 : LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject] (A : SetObject), LRA.Set.Constructions.GrothendieckUniverse.CanonicalGrothendieckUniverseMembershipModel A ∈ LRA.ModelTheory.FirstOrder.ModelsOfFormulaTheory LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A : SetObject
  Prove
    { Domain := Subtype fun x => inst.1 (Classical.indefiniteDescription (LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A) ⋯).val x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 (Classical.choose ⋯) x) → Subtype fun x => inst.1 (Classical.choose ⋯) x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.arity x) → Subtype fun x => inst.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).val (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem canonicalGrothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    CanonicalGrothendieckUniverseMembershipModel A ∈
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

Related proof moves: TODO

-/
theorem canonicalGrothendieckUniverseModelsZFC
    {SetObject : Type u}
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject]
    (A : SetObject) :
    CanonicalGrothendieckUniverseMembershipModel A ∈
      ModelsOfFormulaTheory ZFCTheory := by
  sorry

/--
`grothendieckUniverseHasCumulativeHierarchyClassification` TODO

Predicate logic:

  ∀ {SetObject : Type u} [inst : Membership SetObject SetObject] (A U : SetObject) (universeHypothesis : LRA.Set.Constructions.GrothendieckUniverse.IsGrothendieckUniverseFor A U), LRA.Set.Constructions.GrothendieckUniverse.HasCumulativeHierarchyClassification A U universeHypothesis

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    A U : SetObject
  Prove
    { Domain := Subtype fun x => inst.1 U x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.2 functionSymbol) → Subtype fun x => inst.1 U x) → Subtype fun x => inst.1 U x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.Relations.arity x) → Subtype fun x => inst.1 U x) → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => inst.1 (arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩).val (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem grothendieckUniverseHasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    HasCumulativeHierarchyClassification A U universeHypothesis
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
theorem grothendieckUniverseHasCumulativeHierarchyClassification
    {SetObject : Type u}
    [Membership SetObject SetObject]
    (A U : SetObject)
    (universeHypothesis : IsGrothendieckUniverseFor A U) :
    HasCumulativeHierarchyClassification A U universeHypothesis := by
  sorry

/--
`grothendieckUniverseSupportsTGExpansion` TODO

Predicate logic:

  ∀ (SetObject : Type u) [inst : Membership SetObject SetObject], LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject → LRA.Set.Constructions.GrothendieckUniverse.Interface.ModelTheory.SupportsTGExpansion SetObject

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject → LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject

Logical form (Lean):

```lean
theorem grothendieckUniverseSupportsTGExpansion
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] :
    SupportsTGExpansion SetObject
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
theorem grothendieckUniverseSupportsTGExpansion
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] :
    SupportsTGExpansion SetObject := by
  sorry

/--
`grothendieckUniverseSupportsTGUniverseTower` TODO

Predicate logic:

  ∀ (SetObject : Type u) [inst : Membership SetObject SetObject] [inst_1 : LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseAxiom SetObject], LRA.Set.Constructions.GrothendieckUniverse.SupportsTGUniverseTower SetObject

Predicate logic (unfolded):

  Ambient
    (SetObject, ∈)
  Objects
    (none)
  Prove
    { Domain := Subtype fun x => inst.1 (Classical.choose ⋯) x, domainNonempty := ⋯, equalityIsDiagonal := ⋯, interpretFunction := fun functionSymbol => Empty.rec (fun x => (Fin (LRA.Set.ModelTheory.MembershipSignature.Functions.arity functionSymbol) → Subtype fun x => inst.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) → Subtype fun x => inst.1 (LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A) x) functionSymbol, interpretRelation := fun relationSymbol arguments => LRA.Set.ModelTheory.MembershipRelationSymbol.rec (motive := fun x => (arguments : Fin (LRA.Set.ModelTheory.MembershipSignature.relationArity x) → Subtype fun x => x) ∈ LRA.Set.Constructions.GrothendieckUniverse.TheGrothendieckUniverse A → (fun relationSymbol arguments => Prop) x arguments) (fun arguments => (fun arguments => .val ∈ arguments ⟨1, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_3⟩ (arguments ⟨0, LRA.Set.Constructions.GrothendieckUniverse.GrothendieckUniverseMembershipModel._proof_4⟩).val) arguments) relationSymbol arguments, interpretConstant := fun constantSymbol => LRA.Set.ModelTheory.MembershipConstantSymbol.rec ((fun _ => let emptyWitness := Classical.choose ⋯; have emptyWitnessSpec := ⋯; ⟨emptyWitness, ⋯⟩) Unit.unit) constantSymbol } ∈ fun M => ∀ (assignment : Nat → M.1) (φ : LRA.Logic.FirstOrder.Formula LRA.Set.ModelTheory.MembershipSignature Nat), φ ∈ LRA.Set.Constructions.ZFCSet.Interface.ModelTheory.ZFCTheory → LRA.Logic.FirstOrder.Satisfies M assignment φ

Logical form (Lean):

```lean
theorem grothendieckUniverseSupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] :
    SupportsTGUniverseTower SetObject
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
theorem grothendieckUniverseSupportsTGUniverseTower
    (SetObject : Type u)
    [Membership SetObject SetObject]
    [GrothendieckUniverseAxiom SetObject] :
    SupportsTGUniverseTower SetObject := by
  sorry

end LRA.Set.Constructions.GrothendieckUniverse
