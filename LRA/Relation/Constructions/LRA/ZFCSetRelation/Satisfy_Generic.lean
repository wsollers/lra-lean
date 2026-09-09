import LRA.Relation.Constructions.LRA.ZFCSetRelation
import LRA.Relation.Interface.Satisfy_Generic

/-!
The ZFC-set relation backend satisfies the generic relation interface by
interpreting ordered-pair membership as the canonical predicate relation on the
carrier cut out by the ambient set.
-/

namespace LRA.Relation.Constructions.LRA

instance
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet} :
    LRA.Relation.GenericSemantics
      (ZFCSetRelation carrierObject)
      (CarrierOfSet carrierObject) where
  toEndorelation := ZFCSetRelation.toEndorelation

/--
`zfcSetRelation_interpret_eq_toEndorelation` TODO

Predicate logic:

  ∀ {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet} (relation : LRA.Relation.Constructions.LRA.ZFCSetRelation carrierObject), LRA.Relation.interpret relation = relation.toEndorelation

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet
    relation : ZFCSetRelation carrierObject
  Prove
    LRA.Relation.Constructions.LRA.instGenericSemanticsZFCSetRelationCarrierOfSet.1 relation = funleft right => LRA.Set.Constructions.instMembershipZFCSet.1 relation.1 (LRA.Set.Constructions.ZFCSet.Axioms.instHasPairingSet.1 left.1 right.1)

Logical form (Lean):

```lean
theorem zfcSetRelation_interpret_eq_toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.interpret relation =
      ZFCSetRelation.toEndorelation relation
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
theorem zfcSetRelation_interpret_eq_toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.interpret relation =
      ZFCSetRelation.toEndorelation relation := by
  sorry
end LRA.Relation.Constructions.LRA
