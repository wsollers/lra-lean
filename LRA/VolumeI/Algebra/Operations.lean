-- LRA/VolumeI/Algebra/Operations.lean
--
-- The operation sibling of the model signature: an operation takes an
-- arity-`n` tuple and returns a CARRIER element (codomain α, not Prop).
-- This is the only difference from a relation — same signature root,
-- same `pair` constructor, same accessor discipline. The two siblings
-- stay symmetric on purpose.
--
-- ApplyBinaryOperation parallels Sets.Relations.BinaryRelationHolds:
-- it is the queryable accessor that feeds two carrier elements in as the
-- 2-tuple. Its Fin/pair plumbing is paid once per concrete operation by a
-- characterization lemma (see VolumeII Arithmetic: ApplyNaturalAddition…).

import LRA.VolumeI.Foundations.Tuple

namespace LRA.VolumeI.Algebra.Operations

open LRA.VolumeI.Foundations

/-- An arity-`n` operation on `α`: a map from an arity-`n` tuple to a carrier
    element. Arity lives in the type, exactly as for relations. -/
abbrev Operation (α : Type) (n : Nat) : Type := Tuple α n → α

/-- A binary operation: the arity-2 specialization. The algebraic structures
    consume this as their operation interface. -/
abbrev BinaryOperation (α : Type) : Type := Operation α 2

/-- A unary operation: the arity-1 specialization (e.g. additive inverse). -/
abbrev UnaryOperation (α : Type) : Type := Operation α 1

/-- Apply a binary operation to an ordered pair of carrier elements.
    Mirrors `BinaryRelationHolds`; the `pair` plumbing is sealed here. -/
def ApplyBinaryOperation {α : Type}
    (operation : BinaryOperation α) (first second : α) : α :=
  operation (pair first second)

/-- Apply a unary operation to a single carrier element. -/
def ApplyUnaryOperation {α : Type}
    (operation : UnaryOperation α) (element : α) : α :=
  operation (fun _ => element)

end LRA.VolumeI.Algebra.Operations
