namespace LRA.Identity.Syntax

universe u

/--
`PreservedByConstructor` TODO

Predicate logic:

  ∀ {Syntax : Type u} (R : Syntax → Syntax → Prop) (arity : Nat) (constructor : (Fin arity → Syntax) → Syntax) (left right : Fin arity → Syntax), (∀ (i : Fin arity), R (left i) (right i)) → R (constructor left) (constructor right)

Predicate logic (unfolded):

  ∀ {Syntax : Type u} (R : Syntax → Syntax → Prop) (arity : Nat) (constructor : (Fin arity → Syntax) → Syntax) (left right : Fin arity → Syntax), (∀ (i : Fin arity), R (left i) (right i)) → R (constructor left) (constructor right)

Logical form (Lean):

```lean
def PreservedByConstructor {Syntax : Type u}
    (R : Syntax -> Syntax -> Prop) (arity : Nat)
    (constructor : (Fin arity -> Syntax) -> Syntax) : Prop :=
  forall left right, (forall i, R (left i) (right i)) ->
    R (constructor left) (constructor right)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PreservedByConstructor {Syntax : Type u}
    (R : Syntax -> Syntax -> Prop) (arity : Nat)
    (constructor : (Fin arity -> Syntax) -> Syntax) : Prop :=
  forall left right, (forall i, R (left i) (right i)) ->
    R (constructor left) (constructor right)

end LRA.Identity.Syntax
