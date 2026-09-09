import LRA.Relation.Constructions.LRA.ZFCSetRelation

namespace LRA.Relation.Examples.ZFC

open LRA.Relation.Constructions.LRA
open LRA.Set.Constructions.ZFCSet.Axioms

/--
`singletonCarrierObject` TODO

Predicate logic:

  noncomputable def singletonCarrierObject :
      LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet :=
    TheSingleton TheEmptySet

Predicate logic (unfolded):

  noncomputable def singletonCarrierObject :
      LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet :=
    TheSingleton TheEmptySet (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def singletonCarrierObject :
    LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet :=
  TheSingleton TheEmptySet
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
noncomputable def singletonCarrierObject :
    LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet :=
  TheSingleton TheEmptySet

/--
`emptyMemberOfSingletonCarrier` TODO

Predicate logic:

  noncomputable def emptyMemberOfSingletonCarrier :
      CarrierOfSet singletonCarrierObject :=
    ⟨TheEmptySet, by
      sorry⟩

Predicate logic (unfolded):

  noncomputable def emptyMemberOfSingletonCarrier :
      CarrierOfSet singletonCarrierObject :=
    ⟨TheEmptySet, by
      sorry⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def emptyMemberOfSingletonCarrier :
    CarrierOfSet singletonCarrierObject :=
  ⟨TheEmptySet, by
    sorry⟩
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
noncomputable def emptyMemberOfSingletonCarrier :
    CarrierOfSet singletonCarrierObject :=
  ⟨TheEmptySet, by
    sorry⟩

/--
`singletonIdentityRelation` TODO

Predicate logic:

  noncomputable def singletonIdentityRelation :
      ZFCSetRelation singletonCarrierObject :=
    ⟨TheSingleton (LRA.Set.OrderedPair TheEmptySet TheEmptySet), by
      intro pairObject pairObjectMem
      refine ⟨TheEmptySet, TheEmptySet, ?_, ?_, ?_⟩
      · sorry
      · sorry
      · sorry⟩

Predicate logic (unfolded):

  noncomputable def singletonIdentityRelation :
      ZFCSetRelation singletonCarrierObject :=
    ⟨TheSingleton (LRA.Set.OrderedPair TheEmptySet TheEmptySet), by
      intro pairObject pairObjectMem
      refine ⟨TheEmptySet, TheEmptySet, ?_, ?_, ?_⟩
      · sorry
      · sorry
      · sorry⟩ (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def singletonIdentityRelation :
    ZFCSetRelation singletonCarrierObject :=
  ⟨TheSingleton (LRA.Set.OrderedPair TheEmptySet TheEmptySet), by
    intro pairObject pairObjectMem
    refine ⟨TheEmptySet, TheEmptySet, ?_, ?_, ?_⟩
    · sorry
    · sorry
    · sorry⟩
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
noncomputable def singletonIdentityRelation :
    ZFCSetRelation singletonCarrierObject :=
  ⟨TheSingleton (LRA.Set.OrderedPair TheEmptySet TheEmptySet), by
    intro pairObject pairObjectMem
    refine ⟨TheEmptySet, TheEmptySet, ?_, ?_, ?_⟩
    · sorry
    · sorry
    · sorry⟩

/--
`singletonIdentityEndorelation` TODO

Predicate logic:

  ∀ (a a_1 : LRA.Relation.Constructions.LRA.CarrierOfSet LRA.Relation.Examples.ZFC.singletonCarrierObject), LRA.Set.Constructions.ZFCMembership (LRA.Set.OrderedPair a.val a_1.val) LRA.Relation.Examples.ZFC.singletonIdentityRelation.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCMembership (LRA.Set.Constructions.ZFCSet.Axioms.instHasPairingSet.1 a.1 a_1.1) LRA.Relation.Examples.ZFC.singletonIdentityRelation.1

Logical form (Lean):

```lean
noncomputable def singletonIdentityEndorelation :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityRelation.toEndorelation
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
noncomputable def singletonIdentityEndorelation :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityRelation.toEndorelation

/--
`singletonIdentityRelatesEmptyToItself` TODO

Predicate logic:

  LRA.Relation.Examples.ZFC.singletonIdentityEndorelation LRA.Relation.Examples.ZFC.emptyMemberOfSingletonCarrier LRA.Relation.Examples.ZFC.emptyMemberOfSingletonCarrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.instMembershipZFCSet.1 LRA.Relation.Examples.ZFC.singletonIdentityRelation.1 (LRA.Set.Constructions.ZFCSet.Axioms.instHasPairingSet.1 LRA.Relation.Examples.ZFC.emptyMemberOfSingletonCarrier.1 LRA.Relation.Examples.ZFC.emptyMemberOfSingletonCarrier.1)

Logical form (Lean):

```lean
theorem singletonIdentityRelatesEmptyToItself :
    singletonIdentityEndorelation
      emptyMemberOfSingletonCarrier
      emptyMemberOfSingletonCarrier
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
theorem singletonIdentityRelatesEmptyToItself :
    singletonIdentityEndorelation
      emptyMemberOfSingletonCarrier
      emptyMemberOfSingletonCarrier := by
  sorry

/--
`NatToRealExampleDeferred` Placeholder proposition naming the deferred ZFC-carried Nat -> Real example without collapsing it to a vacuous truth.

Predicate logic:

  Exists fun carrier => Nonempty carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun carrier => Nonempty carrier

Logical form (Lean):

```lean
def NatToRealExampleDeferred : Prop :=
  ∃ carrier : Type, Nonempty carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def NatToRealExampleDeferred : Prop :=
  ∃ carrier : Type, Nonempty carrier

/--
`natToRealExampleDeferred` The object-language Nat -> Real example is deferred until canonical ZFC carrier objects for naturals and reals are exposed cheaply enough to reuse here.

Predicate logic:

  Exists fun carrier => Nonempty carrier

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun carrier => Nonempty carrier

Logical form (Lean):

```lean
def natToRealExampleDeferred : Prop := NatToRealExampleDeferred
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
def natToRealExampleDeferred : Prop := NatToRealExampleDeferred

/--
`successorLikeRelationOnSingleton` A local stand-in for the intended Nat -> Nat shape using the available singleton carrier.

Predicate logic:

  ∀ (a a_1 : LRA.Relation.Constructions.LRA.CarrierOfSet LRA.Relation.Examples.ZFC.singletonCarrierObject), LRA.Set.Constructions.ZFCMembership (LRA.Set.OrderedPair a.val a_1.val) LRA.Relation.Examples.ZFC.singletonIdentityRelation.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCMembership (LRA.Set.Constructions.ZFCSet.Axioms.instHasPairingSet.1 a.1 a_1.1) LRA.Relation.Examples.ZFC.singletonIdentityRelation.1

Logical form (Lean):

```lean
noncomputable def successorLikeRelationOnSingleton :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityEndorelation
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
noncomputable def successorLikeRelationOnSingleton :
    LRA.Relation.Endorelation (CarrierOfSet singletonCarrierObject) :=
  singletonIdentityEndorelation

end LRA.Relation.Examples.ZFC
