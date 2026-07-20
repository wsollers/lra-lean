-- LRA/Foundation/Sets/Implementation.lean
-- Active set implementation switch.

import LRA.Foundation.Sets.FoundationImplementation

namespace LRA
namespace Foundation
namespace Sets

/-!
Lean module: LRA.Foundation.Sets.Implementation
Verification status: checked switch module

This module is the shared implementation switch for set construction work.
Change the abbreviations in `Active` to make another construction the default
target for Volume III and later shared tests and downstream examples.
-/

namespace Active

abbrev SetImpl : LRASetImplementation := FoundationSets.implementation

abbrev Set (α : LRACarrier) : LRACarrier :=
  SetImpl.Set α

abbrev member {α : LRACarrier} (element : α) (subset : Set α) : Prop :=
  SetImpl.member element subset

abbrev empty (α : LRACarrier) : Set α :=
  SetImpl.empty α

abbrev universal (α : LRACarrier) : Set α :=
  SetImpl.universal α

abbrev singleton {α : LRACarrier} (element : α) : Set α :=
  SetImpl.singleton element

abbrev union {α : LRACarrier} (left right : Set α) : Set α :=
  SetImpl.union left right

abbrev intersection {α : LRACarrier} (left right : Set α) : Set α :=
  SetImpl.intersection left right

abbrev complement {α : LRACarrier} (subset : Set α) : Set α :=
  SetImpl.complement subset

abbrev difference {α : LRACarrier} (left right : Set α) : Set α :=
  SetImpl.difference left right

abbrev symmetricDifference {α : LRACarrier} (left right : Set α) : Set α :=
  SetImpl.symmetricDifference left right

abbrev subset {α : LRACarrier} (left right : Set α) : Prop :=
  SetImpl.subset left right

abbrev powerSet {α : LRACarrier} (baseSet : Set α) : Set (Set α) :=
  SetImpl.powerSet baseSet

abbrev extensionality {α : LRACarrier} {left right : Set α}
    (sameMembers : ∀ element, member element left ↔ member element right) :
    left = right :=
  SetImpl.extensionality sameMembers

abbrev finiteSet {α : LRACarrier} (subset : Set α) : Prop :=
  SetImpl.finiteSet subset

abbrev covers {α : LRACarrier} (collection : Set (Set α)) (target : Set α) : Prop :=
  SetImpl.covers collection target

abbrev subcover {α : LRACarrier} (subcollection collection : Set (Set α))
    (target : Set α) : Prop :=
  SetImpl.subcover subcollection collection target

abbrev finiteCover {α : LRACarrier} (collection : Set (Set α)) (target : Set α) :
    Prop :=
  SetImpl.finiteCover collection target

abbrev openCover {α : LRACarrier} (topology collection : Set (Set α)) (target : Set α) :
    Prop :=
  SetImpl.openCover topology collection target

abbrev finiteIntersectionProperty {α : LRACarrier} (collection : Set (Set α)) : Prop :=
  SetImpl.finiteIntersectionProperty collection

end Active

end Sets
end Foundation
end LRA
