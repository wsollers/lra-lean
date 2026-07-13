-- LRA/Foundation/Sets/FoundationImplementation.lean
-- Foundation-backed set implementation.

import LRA.Foundation.Sets.Interface

namespace LRA
namespace Foundation
namespace Sets
namespace FoundationSets

/-!
Lean module: LRA.Foundation.Sets.FoundationImplementation
Verification status: checked implementation module

This implementation interprets the switchable set interface by the Foundation
predicate set representation `LRA.Foundation.LRASet`.
-/

abbrev Set (α : LRACarrier) : LRACarrier :=
  LRASet α

def implementation : LRASetImplementation where
  Set := Set
  member := LRASet.member
  empty := LRASet.empty
  universal := LRASet.universal
  singleton := LRASet.singleton
  union := LRASet.union
  intersection := LRASet.intersection
  subset := LRASet.subset
  extensionality := by
    intro α left right sameMembers
    exact LRASet.extensionality sameMembers

namespace Tests

example : implementation.member 2 (implementation.singleton 2) := by
  rfl

example : ¬ implementation.member 3 (implementation.empty Nat) := by
  intro impossible
  exact impossible

example :
    implementation.subset (implementation.singleton 2) (implementation.universal Nat) := by
  intro element _elementIsTwo
  trivial

end Tests

end FoundationSets
end Sets
end Foundation
end LRA
