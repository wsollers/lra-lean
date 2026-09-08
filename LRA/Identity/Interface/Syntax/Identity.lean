namespace LRA.Identity.Syntax

universe u

/-- Syntactic identity is literal equality of syntax trees.

Logical form: `left = right`.
-/
abbrev SyntacticallyIdentical {Syntax : Type u} (left right : Syntax) : Prop :=
  left = right

end LRA.Identity.Syntax
