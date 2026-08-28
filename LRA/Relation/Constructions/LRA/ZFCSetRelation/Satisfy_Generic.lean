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

theorem zfcSetRelation_interpret_eq_toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.interpret relation =
      ZFCSetRelation.toEndorelation relation :=
  rfl

end LRA.Relation.Constructions.LRA
