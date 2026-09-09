import LRA.Identity.Interface.Syntax

namespace LRA.Identity.Syntax

universe u

/--
`SyntacticIdentityPreservedByConstructor` TODO

Predicate logic:

  ∀ {Syntax : Type u} (arity : Nat) (constructor : (Fin arity → Syntax) → Syntax), LRA.Identity.Syntax.PreservedByConstructor LRA.Identity.Syntax.SyntacticallyIdentical arity constructor

Predicate logic (unfolded):

  ∀ {Syntax : Type u} (arity : Nat) (constructor : (Fin arity → Syntax) → Syntax) (left right : Fin arity → Syntax), (∀ (i : Fin arity), left i = right i) → constructor left = constructor right

Logical form (Lean):

```lean
theorem SyntacticIdentityPreservedByConstructor {Syntax : Type u}
    (arity : Nat) (constructor : (Fin arity -> Syntax) -> Syntax) :
    PreservedByConstructor SyntacticallyIdentical arity constructor
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem SyntacticIdentityPreservedByConstructor {Syntax : Type u}
    (arity : Nat) (constructor : (Fin arity -> Syntax) -> Syntax) :
    PreservedByConstructor SyntacticallyIdentical arity constructor := by
  sorry

end LRA.Identity.Syntax
