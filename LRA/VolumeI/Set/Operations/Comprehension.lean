import LRA.VolumeI.Set.Operations.Boolean

universe u v

namespace LRA.VolumeI.Set.Operations

/-!
Generic separation surface.

This interface is for set backends that can form the subset of an existing set
determined by a predicate on the carrier. It is intentionally separate from the
smallest public set interface because this is the axiom-schema-shaped operation,
not unrestricted comprehension.
-/

/-- Public set operations plus bounded predicate separation. -/
structure ComprehensionSetOperations extends PublicSetOperations where
  separation : SetObject → (Element → Prop) → SetObject

/-- Membership reading for generic bounded predicate separation. -/
structure ComprehensionSetOperationLaws
    (operations : ComprehensionSetOperations) : Prop
    extends PublicSetOperationLaws operations.toPublicSetOperations where
  separationMembership :
    ∀ ambient predicate element,
      operations.member element (operations.separation ambient predicate) ↔
        operations.member element ambient ∧ predicate element

/-- Separation laws bundled with extensionality. -/
structure ComprehensionSetInterfaceLaws
    (operations : ComprehensionSetOperations) : Prop
    extends ComprehensionSetOperationLaws operations where
  extensionality :
    ∀ {left right : operations.SetObject},
      (∀ element, operations.member element left ↔ operations.member element right) →
        left = right

/-- Boolean set operations plus bounded predicate separation. -/
structure BooleanComprehensionSetOperations extends BooleanSetOperations where
  separation : SetObject → (Element → Prop) → SetObject

/-- Laws for Boolean set operations with bounded predicate separation. -/
structure BooleanComprehensionSetOperationLaws
    (operations : BooleanComprehensionSetOperations) : Prop
    extends BooleanSetOperationLaws operations.toBooleanSetOperations where
  separationMembership :
    ∀ ambient predicate element,
      operations.member element (operations.separation ambient predicate) ↔
        operations.member element ambient ∧ predicate element

/-- Boolean-separation laws bundled with extensionality. -/
structure BooleanComprehensionSetInterfaceLaws
    (operations : BooleanComprehensionSetOperations) : Prop
    extends BooleanComprehensionSetOperationLaws operations where
  extensionality :
    ∀ {left right : operations.SetObject},
      (∀ element, operations.member element left ↔ operations.member element right) →
        left = right

end LRA.VolumeI.Set.Operations

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-- Form the subset of an ambient set whose elements satisfy a predicate. -/
abbrev Separation (operations : ComprehensionSetOperations.{u, v})
    (ambient : operations.SetObject)
    (predicate : operations.Element → Prop) : operations.SetObject :=
  operations.separation ambient predicate

/-- Form the subset of an ambient set whose elements satisfy a predicate in a Boolean interface. -/
abbrev BooleanSeparation
    (operations : BooleanComprehensionSetOperations.{u, v})
    (ambient : operations.SetObject)
    (predicate : operations.Element → Prop) : operations.SetObject :=
  operations.separation ambient predicate

end LRA.VolumeI.Set.Generic
