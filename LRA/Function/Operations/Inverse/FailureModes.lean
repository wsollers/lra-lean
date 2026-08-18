import LRA.Function.Operations.Inverse.Definition

/-!
Non-uniqueness of one-sided inverses.

A two-sided inverse is unique, but a one-sided inverse need not be: a
non-surjective injection has many left inverses, and a non-injective surjection
has many right inverses. These predicates name those situations.
-/

namespace LRA.Function

universe u v

/-- A function has two distinct left inverses. -/
def MultipleLeftInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ LeftInverse function first ∧ LeftInverse function second

/-- A function has two distinct right inverses. -/
def MultipleRightInverses {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : LRA.Function Codomain Domain,
    first ≠ second ∧ RightInverse function first ∧ RightInverse function second

end LRA.Function
