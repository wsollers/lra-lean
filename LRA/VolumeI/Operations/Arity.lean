import LRA.VolumeI.Operations.Operations

namespace LRA.VolumeI.Operations

universe u

/-- An `n`-ary operation on a carrier. -/
abbrev NaryOperation (arity : Nat) (Alpha : Type u) :=
  (Fin arity -> Alpha) -> Alpha

/-- A nullary operation presented as a zero-ary operation. -/
def NullaryAsNary {Alpha : Type u}
    (constant : NullaryOperation Alpha) : NaryOperation 0 Alpha :=
  fun _ => constant

/-- A unary operation presented as a one-ary operation. -/
def UnaryAsNary {Alpha : Type u}
    (operation : UnaryOperation Alpha) : NaryOperation 1 Alpha :=
  fun input => operation (input ⟨0, by decide⟩)

/-- A binary operation presented as a two-ary operation. -/
def BinaryAsNary {Alpha : Type u}
    (operation : BinaryOperation Alpha) : NaryOperation 2 Alpha :=
  fun input => operation (input ⟨0, by decide⟩) (input ⟨1, by decide⟩)

end LRA.VolumeI.Operations
