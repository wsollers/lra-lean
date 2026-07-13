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

abbrev subset {α : LRACarrier} (left right : Set α) : Prop :=
  SetImpl.subset left right

abbrev extensionality {α : LRACarrier} {left right : Set α}
    (sameMembers : ∀ element, member element left ↔ member element right) :
    left = right :=
  SetImpl.extensionality sameMembers

end Active

end Sets
end Foundation
end LRA
