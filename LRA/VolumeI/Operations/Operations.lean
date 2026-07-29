import LRA.VolumeI.Set

namespace LRA.VolumeI.Operations

universe u v

/-- A nullary operation on a carrier. -/
abbrev NullaryOperation (alpha : LRA.VolumeI.Set.LRACarrier) := alpha

/-- Compatibility synonym for a nullary operation. -/
abbrev ConstantOperation (alpha : LRA.VolumeI.Set.LRACarrier) :=
  NullaryOperation alpha

/-- A unary endo-operation on a carrier. -/
abbrev UnaryOperation (alpha : LRA.VolumeI.Set.LRACarrier) := alpha -> alpha

/-- A binary operation on a carrier. -/
abbrev BinaryOperation (alpha : LRA.VolumeI.Set.LRACarrier) := alpha -> alpha -> alpha

/-- An external binary operation, such as scalar multiplication. -/
abbrev ExternalBinaryOperation
    (scalar carrier : LRA.VolumeI.Set.LRACarrier) :=
  scalar -> carrier -> carrier

/-- A partial unary operation on a carrier. -/
structure PartialUnaryOperation (alpha : LRA.VolumeI.Set.LRACarrier) where
  /-- The operation's domain of definition. -/
  Domain : LRA.VolumeI.Set.LRASet alpha
  /-- The value of the operation at a point in its domain. -/
  Value : forall input, LRA.VolumeI.Set.LRASet.Member input Domain -> alpha

/-- A partial binary operation on a carrier. -/
structure PartialBinaryOperation (alpha : LRA.VolumeI.Set.LRACarrier) where
  /-- The operation's domain of definition. -/
  Domain : alpha -> alpha -> Prop
  /-- The value of the operation at a pair in its domain. -/
  Value : forall left right, Domain left right -> alpha

end LRA.VolumeI.Operations
