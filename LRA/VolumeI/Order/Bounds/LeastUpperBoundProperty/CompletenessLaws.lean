import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition

namespace LRA.Order

universe u v

/-!
Backend-relative least-upper-bound completeness for ordered carriers.

Completeness is second-order: the chosen `SetObject` controls which subsets
are quantified over. Instantiating `SetObject` with `Set R` gives the
classical full-subset reading; smaller backends give weaker completeness.
-/

class OrderCompletenessLaws (R : Type u) (SetObject : Type v)
    [LE R] [Membership R SetObject] : Prop where
  Completeness :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b)

section Wrappers

variable {R : Type u} {SetObject : Type v}

theorem Completeness [LE R] [Membership R SetObject]
    [OrderCompletenessLaws R SetObject] :
    LRA.Order.LeastUpperBoundProperty
      SetObject (fun a b : R => a <= b) :=
  OrderCompletenessLaws.Completeness

end Wrappers

end LRA.Order
