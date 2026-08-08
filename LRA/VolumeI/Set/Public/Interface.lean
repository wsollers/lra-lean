import LRA.VolumeI.Set.Operations.Public

universe u v

namespace LRA.VolumeI.Set

/-!
Public interface for generic set objects.

This is the backend-independent surface for proving set theory once. Concrete
implementations, such as predicate sets or ZFC-style sets, should provide an
adapter into this interface and prove the interface laws.
-/

/-- Backend-independent set-operation interface. -/
abbrev SetInterface := Operations.PublicSetOperations

/-- Laws for a generic set interface.

The inherited public operation laws give the membership readings for the
operation names. Extensionality is added here because generic set proofs need to
turn memberwise equivalence into equality of set objects. -/
structure SetInterfaceLaws (interface : SetInterface.{u, v}) : Prop
    extends Operations.PublicSetOperationLaws interface where
  extensionality :
    ∀ {left right : interface.SetObject},
      (∀ element, interface.member element left ↔ interface.member element right) →
        left = right

/-- A concrete backend bundled as a model of the generic set interface. -/
structure GenericSetModel where
  interface : SetInterface.{u, v}
  laws : SetInterfaceLaws interface

namespace SetInterface

/-- Membership in a generic set interface. -/
def Member (interface : SetInterface.{u, v})
    (element : interface.Element) (setObject : interface.SetObject) : Prop :=
  interface.member element setObject

/-- Empty set in a generic set interface. -/
def Empty (interface : SetInterface.{u, v}) : interface.SetObject :=
  interface.empty

/-- Singleton set in a generic set interface. -/
def Singleton (interface : SetInterface.{u, v})
    (element : interface.Element) : interface.SetObject :=
  interface.singleton element

/-- Pair set in a generic set interface. -/
def Pair (interface : SetInterface.{u, v})
    (left right : interface.Element) : interface.SetObject :=
  interface.pair left right

/-- Binary union in a generic set interface. -/
def Union (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : interface.SetObject :=
  interface.union left right

/-- Binary intersection in a generic set interface. -/
def Intersection (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : interface.SetObject :=
  interface.intersection left right

/-- Subset relation in a generic set interface. -/
def Subset (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : Prop :=
  interface.subset left right

end SetInterface

end LRA.VolumeI.Set
