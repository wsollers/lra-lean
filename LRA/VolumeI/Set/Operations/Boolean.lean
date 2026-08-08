import LRA.VolumeI.Set.Operations.Public

universe u v

namespace LRA.VolumeI.Set.Operations

/-!
Boolean extensions of the public set-operation interface.

These operations are intentionally layered on top of the core set interface:
some backends, such as typed predicate sets and mathlib sets, have a universal
set and global complement, while ZFC-style set theory should not be forced to
provide a universal set.
-/

/-- Public Boolean-style set operations. -/
structure BooleanSetOperations extends PublicSetOperations where
  universal : SetObject
  complement : SetObject → SetObject
  difference : SetObject → SetObject → SetObject
  symmetricDifference : SetObject → SetObject → SetObject

/-- Membership readings for Boolean-style set operations. -/
structure BooleanSetOperationLaws (operations : BooleanSetOperations) : Prop
    extends PublicSetOperationLaws operations.toPublicSetOperations where
  universalMembership :
    ∀ element, operations.member element operations.universal
  complementMembership :
    ∀ element setObject,
      operations.member element (operations.complement setObject) ↔
        ¬ operations.member element setObject
  differenceMembership :
    ∀ element left right,
      operations.member element (operations.difference left right) ↔
        operations.member element left ∧ ¬ operations.member element right
  symmetricDifferenceMembership :
    ∀ element left right,
      operations.member element (operations.symmetricDifference left right) ↔
        (operations.member element left ∧ ¬ operations.member element right) ∨
          (operations.member element right ∧ ¬ operations.member element left)

/-- Laws for Boolean set operations with extensionality. -/
structure BooleanSetInterfaceLaws (operations : BooleanSetOperations) : Prop
    extends BooleanSetOperationLaws operations where
  extensionality :
    ∀ {left right : operations.SetObject},
      (∀ element, operations.member element left ↔ operations.member element right) →
        left = right

end LRA.VolumeI.Set.Operations

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-- Universal set operation in a Boolean set interface. -/
abbrev Universal (operations : BooleanSetOperations.{u, v}) : operations.SetObject :=
  operations.universal

/-- Complement operation in a Boolean set interface. -/
abbrev Complement (operations : BooleanSetOperations.{u, v})
    (setObject : operations.SetObject) : operations.SetObject :=
  operations.complement setObject

/-- Difference operation in a Boolean set interface. -/
abbrev Difference (operations : BooleanSetOperations.{u, v})
    (left right : operations.SetObject) : operations.SetObject :=
  operations.difference left right

/-- Symmetric difference operation in a Boolean set interface. -/
abbrev SymmetricDifference (operations : BooleanSetOperations.{u, v})
    (left right : operations.SetObject) : operations.SetObject :=
  operations.symmetricDifference left right

end LRA.VolumeI.Set.Generic
