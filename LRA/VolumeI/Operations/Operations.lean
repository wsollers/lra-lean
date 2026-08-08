import LRA.VolumeI.Set

namespace LRA.VolumeI.Operations

universe u v

/-- A nullary operation on a carrier. -/
abbrev NullaryOperation (alpha : Type u) := alpha

/-- Compatibility synonym for a nullary operation. -/
abbrev ConstantOperation (alpha : Type u) :=
  NullaryOperation alpha

/-- A unary endo-operation on a carrier. -/
abbrev UnaryOperation (alpha : Type u) := alpha -> alpha

/-- A binary operation on a carrier. -/
abbrev BinaryOperation (alpha : Type u) := alpha -> alpha -> alpha

/-- An external binary operation, such as scalar multiplication. -/
abbrev ExternalBinaryOperation (scalar carrier : Type u) :=
  scalar -> carrier -> carrier

/-- A partial unary operation on a carrier. -/
structure PartialUnaryOperation (alpha : Type u) where
  /-- The operation's domain of definition. -/
  Domain : alpha -> Prop
  /-- The value of the operation at a point in its domain. -/
  Value : forall input, Domain input -> alpha

/-- A partial binary operation on a carrier. -/
structure PartialBinaryOperation (alpha : Type u) where
  /-- The operation's domain of definition. -/
  Domain : alpha -> alpha -> Prop
  /-- The value of the operation at a pair in its domain. -/
  Value : forall left right, Domain left right -> alpha

end LRA.VolumeI.Operations
