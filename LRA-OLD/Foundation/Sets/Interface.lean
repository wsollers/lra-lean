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
  complement : {α : LRACarrier} → Set α → Set α
  difference : {α : LRACarrier} → Set α → Set α → Set α
  symmetricDifference : {α : LRACarrier} → Set α → Set α → Set α
  subset : {α : LRACarrier} → Set α → Set α → Prop
  powerSet : {α : LRACarrier} → Set α → Set (Set α)
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

def inclusionMonotone (S : LRASetImplementation) {α β : LRACarrier}
    (operation : S.Set α → S.Set β) : Prop :=
  ∀ left right, S.subset left right → S.subset (operation left) (operation right)

def inclusionAntitone (S : LRASetImplementation) {α β : LRACarrier}
    (operation : S.Set α → S.Set β) : Prop :=
  ∀ left right, S.subset left right → S.subset (operation right) (operation left)

def finiteSet (S : LRASetImplementation) {α : LRACarrier}
    (subset : S.Set α) : Prop :=
  ∃ size : Nat, ∃ enumeration : Fin size → α,
    ∀ element, S.member element subset → ∃ index, enumeration index = element

def covers (S : LRASetImplementation) {α : LRACarrier}
    (collection : S.Set (S.Set α)) (target : S.Set α) : Prop :=
  ∀ element, S.member element target → ∃ coveringSet,
    S.member coveringSet collection ∧ S.member element coveringSet

def subcover (S : LRASetImplementation) {α : LRACarrier}
    (subcollection collection : S.Set (S.Set α)) (target : S.Set α) : Prop :=
  S.subset subcollection collection ∧ S.covers subcollection target

def finiteCover (S : LRASetImplementation) {α : LRACarrier}
    (collection : S.Set (S.Set α)) (target : S.Set α) : Prop :=
  S.covers collection target ∧ S.finiteSet collection

def openCover (S : LRASetImplementation) {α : LRACarrier}
    (topology collection : S.Set (S.Set α)) (target : S.Set α) : Prop :=
  S.covers collection target ∧ S.subset collection topology

def finiteIntersectionProperty (S : LRASetImplementation) {α : LRACarrier}
    (collection : S.Set (S.Set α)) : Prop :=
  ∀ finiteSubcollection,
    S.subset finiteSubcollection collection →
      S.finiteSet finiteSubcollection →
        ∃ element, ∀ memberSet,
          S.member memberSet finiteSubcollection → S.member element memberSet

end LRASetImplementation

end Sets
end Foundation
end LRA
