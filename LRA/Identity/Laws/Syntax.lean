import LRA.Identity.Interface.Syntax

namespace LRA.Identity.Syntax

universe u

/-- Literal syntactic identity is preserved by every constructor.

Logical form: `(forall i, left i = right i) -> C left = C right`.
-/
theorem SyntacticIdentityPreservedByConstructor {Syntax : Type u}
    (arity : Nat) (constructor : (Fin arity -> Syntax) -> Syntax) :
    PreservedByConstructor SyntacticallyIdentical arity constructor := by
  sorry

end LRA.Identity.Syntax
