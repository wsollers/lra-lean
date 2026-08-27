import LRA.Relation.Interface
import LRA.Set.Interop.Providers.LRA.ZFC
import LRA.Set.Constructions.ZFCSet.Axioms.Public
import LRA.Set.Interface.Definitions.Pairing

namespace LRA.Relation.Constructions.LRA

abbrev CarrierOfSet
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {x : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet // x ∈ carrierObject}

def ZFCSetRelation
    (carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet) : Type :=
  {relationObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet //
    ∀ pairObject, pairObject ∈ relationObject →
      ∃ left right,
        left ∈ carrierObject ∧
        right ∈ carrierObject ∧
        pairObject = LRA.Set.OrderedPair left right}

def ZFCSetRelation.toEndorelation
    {carrierObject : LRA.Set.Interop.Providers.LRA.ZFC.ZFCSet}
    (relation : ZFCSetRelation carrierObject) :
    LRA.Relation.Endorelation (CarrierOfSet carrierObject) :=
  fun left right => LRA.Set.OrderedPair left.1 right.1 ∈ relation.1

end LRA.Relation.Constructions.LRA
