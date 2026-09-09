import LRA.Relation.Interface
import LRA.Set.Interop.Providers.LRA.ZFC
import LRA.Set.Constructions.ZFCSet.Axioms.Public
import LRA.Set.Interface.Definitions.Pairing

namespace LRA.Relation.Constructions.LRA

/--
`CarrierOfSet` TODO

Predicate logic:

  abbrev CarrierOfSet
      (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
    {x : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet // x ∈ carrierObject}

Predicate logic (unfolded):

  abbrev CarrierOfSet
      (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
    {x : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet // x ∈ carrierObject} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev CarrierOfSet
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {x : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet // x ∈ carrierObject}
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
abbrev CarrierOfSet
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {x : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet // x ∈ carrierObject}

/--
`ZFCSetRelation` TODO

Predicate logic:

  def ZFCSetRelation
      (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
    {relationObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet //
      ∀ pairObject, pairObject ∈ relationObject →
        ∃ left right,
          left ∈ carrierObject ∧
          right ∈ carrierObject ∧
          pairObject = LRA.Set.OrderedPair left right}

Predicate logic (unfolded):

  def ZFCSetRelation
      (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
    {relationObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet //
      ∀ pairObject, pairObject ∈ relationObject →
        ∃ left right,
          left ∈ carrierObject ∧
          right ∈ carrierObject ∧
          pairObject = LRA.Set.OrderedPair left right} (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ZFCSetRelation
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {relationObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet //
    ∀ pairObject, pairObject ∈ relationObject →
      ∃ left right,
        left ∈ carrierObject ∧
        right ∈ carrierObject ∧
        pairObject = LRA.Set.OrderedPair left right}
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ZFCSetRelation
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {relationObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet //
    ∀ pairObject, pairObject ∈ relationObject →
      ∃ left right,
        left ∈ carrierObject ∧
        right ∈ carrierObject ∧
        pairObject = LRA.Set.OrderedPair left right}

/--
`ZFCSetRelation.toEndorelation` TODO

Predicate logic:

  ∀ {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet} (relation : LRA.Relation.Constructions.LRA.ZFCSetRelation carrierObject) (a a_1 : LRA.Relation.Constructions.LRA.CarrierOfSet carrierObject), LRA.Set.Constructions.ZFCMembership (LRA.Set.OrderedPair a.val a_1.val) relation.val

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    LRA.Set.Constructions.ZFCMembership (LRA.Set.Constructions.ZFCSet.Axioms.instHasPairingSet.1 a.1 a_1.1) relation.1

Logical form (Lean):

```lean
def ZFCSetRelation.toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.Endorelation (CarrierOfSet carrierObject) :=
  fun left right => LRA.Set.OrderedPair left.1 right.1 ∈ relation.1
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
def ZFCSetRelation.toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.Endorelation (CarrierOfSet carrierObject) :=
  fun left right => LRA.Set.OrderedPair left.1 right.1 ∈ relation.1

end LRA.Relation.Constructions.LRA
