-- LRA/Foundation/Sets/Interface.lean
-- Common interface for set implementations.

import LRA.Foundation.Sets

namespace LRA
namespace Foundation
namespace Sets

/-!
Lean module: LRA.Foundation.Sets.Interface
Verification status: checked interface module

`LRASetImplementation` is the common public shape for switchable set
implementations. A set implementation supplies a type of subsets for every
carrier, membership, extensionality, and the basic set constructors used by
later volume layers.
-/

structure LRASetImplementation where
  Set : LRACarrier → LRACarrier
  member : {α : LRACarrier} → α → Set α → Prop
  empty : (α : LRACarrier) → Set α
  universal : (α : LRACarrier) → Set α
  singleton : {α : LRACarrier} → α → Set α
  union : {α : LRACarrier} → Set α → Set α → Set α
  intersection : {α : LRACarrier} → Set α → Set α → Set α
  subset : {α : LRACarrier} → Set α → Set α → Prop
  extensionality :
    {α : LRACarrier} →
      {left right : Set α} →
        (∀ element, member element left ↔ member element right) → left = right

namespace LRASetImplementation

def contains (S : LRASetImplementation) {α : LRACarrier}
    (subset : S.Set α) (element : α) : Prop :=
  S.member element subset

def nonempty (S : LRASetImplementation) {α : LRACarrier}
    (subset : S.Set α) : Prop :=
  ∃ element, S.member element subset

def disjoint (S : LRASetImplementation) {α : LRACarrier}
    (left right : S.Set α) : Prop :=
  ∀ element, S.member element left → ¬ S.member element right

end LRASetImplementation

end Sets
end Foundation
end LRA
